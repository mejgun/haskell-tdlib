module Main where

import           API.GeneralResult
import           TDLib

import           API.Functions.CheckAuthenticationBotToken
import           API.Functions.CheckDatabaseEncryptionKey
import qualified API.Functions.SendMessage     as SM
import           API.Functions.SetLogVerbosityLevel
import           API.Functions.SetTdlibParameters

import           Defaults

import           API.AuthorizationState
import qualified API.FormattedText             as FT
import qualified API.InputMessageContent       as IMC
import qualified API.Message                   as M
import qualified API.Update                    as U

data State = State
    { incomingMessagesQueue   :: [M.Message]
    , currentAnsweringMessage :: Maybe M.Message
    , currentSendingExtra     :: Maybe String
    , currentSendingMessage   :: Maybe M.Message
    }
    deriving Show

main :: IO ()
main = do
  client <- create
  send client SetLogVerbosityLevel { new_verbosity_level = Just 2 }
  let st = State { incomingMessagesQueue   = []
                 , currentAnsweringMessage = Nothing
                 , currentSendingExtra     = Nothing
                 , currentSendingMessage   = Nothing
                 }
  mainLoop client st

mainLoop :: Client -> State -> IO ()
mainLoop c st = do
  r <- receive c
  case r of
    -- new msg from tdlib
    Just (ResultWithExtra res extra) -> do
      print res -- DEBUG
      putStr "Messages in queue: "
      putStrLn $ show $ length $ incomingMessagesQueue st
      -- if we have new @extra msg =>
      -- it's reply from sendMesseage or error
      -- if msg then save it to currentSendingMessage
      -- else it's error and we need to resend message ->
      -- (N.B. it's hardly network issue, most likely json parsing error)
      -- just return currentAnsweringMessage to the incomingMessagesQueue
      if currentSendingExtra st /= Nothing && extra == currentSendingExtra st
        then case res of
          Message m ->
            let newSt = st { currentSendingMessage = Just m, currentSendingExtra = Nothing } in mainLoop c newSt
          _ ->
            let Just curAnsMsg = currentAnsweringMessage st
                newSt          = addQueueMessageAndClearState st curAnsMsg
            in  mainLoop c newSt
        else return ()
      case res of
        Update (U.UpdateAuthorizationState { U.authorization_state = s }) -> do
          handleAuthState c s
          mainLoop c st
        -- new message. if not from us => save to queue
        Update (U.UpdateNewMessage { U.message = msg }) ->
          let Just m = msg
              newSt  = if M.chat_id m == M.sender_user_id m then addQueueMessage st m else st
          in  mainLoop c newSt
        -- failed => is it our sending msg? => 
        -- return answering msg to queue and clear sending state
        Update (U.UpdateMessageSendFailed { U.old_message_id = oldID }) ->
          let Just m   = currentSendingMessage st
              Just t   = (==) <$> M._id m <*> oldID
              Just cur = currentAnsweringMessage st
          in  if t then let newSt = addQueueMessageAndClearState st cur in mainLoop c newSt else mainLoop c st
        -- sent => is it our sending msg? => 
        -- delete answering msg and clear sending state
        Update (U.UpdateMessageSendSucceeded { U.old_message_id = oldID }) ->
          let Just m = currentSendingMessage st
              t      = (==) <$> M._id m <*> oldID
          in  case t of
                Just True -> let newSt = clearState st in mainLoop c newSt
                _         -> mainLoop c st
        _ -> mainLoop c st
    -- no new msgs from tdlib => 
    -- we can take first message from queue and reply to it
    Nothing ->
      if (currentAnsweringMessage st == Nothing)
           && (currentSendingExtra st == Nothing)
           && (length (incomingMessagesQueue st) > 0)
        then do
          let (m : ms) = incomingMessagesQueue st
          xtr <- sendWExtra c $ sendMsg (M.chat_id m) "Привет. 你好"
          let newSt = st { currentSendingExtra = Just xtr, incomingMessagesQueue = ms } in mainLoop c newSt
        else mainLoop c st

handleAuthState :: Client -> Maybe AuthorizationState -> IO ()
handleAuthState c s = do
  case s of
    Just AuthorizationStateWaitTdlibParameters ->
      send c SetTdlibParameters { parameters = Just defaultTdlibParameters }
    Just (AuthorizationStateWaitEncryptionKey _) ->
      send c CheckDatabaseEncryptionKey { encryption_key = Just "randomencryption" }
    Just AuthorizationStateWaitPhoneNumber -> do
      putStrLn "Enter bot token"
      token <- getLine
      send c CheckAuthenticationBotToken { token = Just token }
    _ -> return ()

sendMsg :: Maybe Int -> String -> SM.SendMessage
sendMsg cID text = SM.SendMessage
  { SM.chat_id               = cID
  , SM.reply_to_message_id   = Nothing
  , SM.reply_markup          = Nothing
  , SM.options               = Nothing
  , SM.input_message_content = Just IMC.InputMessageText
                                 { IMC.clear_draft = Just True
                                 , IMC.disable_web_page_preview = Just False
                                 , IMC.text = Just FT.FormattedText { FT.text = Just text, FT.entities = Nothing }
                                 }
  }

addQueueMessage :: State -> M.Message -> State
addQueueMessage st m = let newQ = m : (incomingMessagesQueue st) in st { incomingMessagesQueue = newQ }


addQueueMessageAndClearState :: State -> M.Message -> State
addQueueMessageAndClearState st m = clearState $ addQueueMessage st m

clearState :: State -> State
clearState st =
  st { currentSendingExtra = Nothing, currentSendingMessage = Nothing, currentAnsweringMessage = Nothing }
