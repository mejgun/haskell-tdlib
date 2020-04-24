module Main where

import           TDLib
import           API.GeneralResult

import           API.Functions.SetLogVerbosityLevel
import           API.Functions.SetTdlibParameters
import           API.Functions.CheckDatabaseEncryptionKey
import           API.Functions.CheckAuthenticationBotToken
import qualified API.Functions.SendMessage     as SM

import           Defaults

import           API.AuthorizationState
import qualified API.Update                    as U
import qualified API.Message                   as M
import qualified API.InputMessageContent       as IMC
import qualified API.FormattedText             as FT


main :: IO ()
main = do
  client <- create
  send client SetLogVerbosityLevel { new_verbosity_level = Just 2 }
  mainLoop client

mainLoop :: Client -> IO ()
mainLoop c = do
  r <- receive c
  case r of
    Just (ResultWithExtra res _) -> do
      print res
      case res of
        Update (U.UpdateAuthorizationState { U.authorization_state = s }) -> handleAuthState c s
        Update (U.UpdateNewMessage { U.message = Just (M.Message { M.chat_id = cID, M.sender_user_id = sID }) }) ->
          if cID == sID
            then send
              c
              SM.SendMessage
                { SM.chat_id               = cID
                , SM.reply_to_message_id   = Nothing
                , SM.reply_markup          = Nothing
                , SM.options               = Nothing
                , SM.input_message_content = Just IMC.InputMessageText
                  { IMC.clear_draft = Just True
                  , IMC.disable_web_page_preview = Just False
                  , IMC.text = Just FT.FormattedText { FT.text = Just "Привет. 你好", FT.entities = Nothing }
                  }
                }
            else return ()
        _ -> return ()
    _ -> return ()
  mainLoop c

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
