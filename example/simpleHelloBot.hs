module Main where


import           TDLib
import           API.GeneralResult

import           API.Functions.SetLogVerbosityLevel
import           API.Functions.SetTdlibParameters
import           API.Functions.CheckDatabaseEncryptionKey
import           API.Functions.CheckAuthenticationBotToken
import qualified API.Functions.SendMessage     as SendMessage

import           Defaults

import           API.AuthorizationState
import qualified API.Update                    as Update
import qualified API.ConnectionState           as ConnectionState
import qualified API.Message                   as Message
import qualified API.InputMessageContent       as InputMessageContent
import qualified API.FormattedText             as FormattedText


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
        Update (Update.UpdateAuthorizationState { Update.authorization_state = s })
          -> handleAuthState c s
        Update (Update.UpdateNewMessage { Update.message = Just (Message.Message { Message.chat_id = cID, Message.sender_user_id = sID }) })
          -> if cID == sID
            then send
              c
              defaultSendTextMessage
                { SendMessage.chat_id               = cID
                , SendMessage.input_message_content = Just
                  InputMessageContent.InputMessageText
                    { InputMessageContent.clear_draft              = Just True
                    , InputMessageContent.disable_web_page_preview = Just False
                    , InputMessageContent.text                     = Just
                      FormattedText.FormattedText
                        { FormattedText.text     = Just "Привет. 你好"
                        , FormattedText.entities = Nothing
                        }
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
    Just (AuthorizationStateWaitEncryptionKey _) -> send
      c
      CheckDatabaseEncryptionKey { encryption_key = Just "randomencryption" }
    Just AuthorizationStateWaitPhoneNumber -> do
      putStrLn "Enter bot token"
      token <- getLine
      send c CheckAuthenticationBotToken { token = Just token }
    _ -> return ()
