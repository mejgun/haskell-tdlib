{-# LANGUAGE OverloadedStrings #-}

module TD.Data.MessageSender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the sender of a message
data MessageSender
  = -- | The message was sent by a known user @user_id Identifier of the user that sent the message
    MessageSenderUser
      { -- |
        user_id :: Maybe Int
      }
  | -- | The message was sent on behalf of a chat @chat_id Identifier of the chat that sent the message
    MessageSenderChat
      { -- |
        chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show MessageSender where
  show
    MessageSenderUser
      { user_id = user_id
      } =
      "MessageSenderUser"
        ++ U.cc
          [ U.p "user_id" user_id
          ]
  show
    MessageSenderChat
      { chat_id = chat_id
      } =
      "MessageSenderChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.FromJSON MessageSender where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageSenderUser" -> parseMessageSenderUser v
      "messageSenderChat" -> parseMessageSenderChat v
      _ -> mempty
    where
      parseMessageSenderUser :: A.Value -> T.Parser MessageSender
      parseMessageSenderUser = A.withObject "MessageSenderUser" $ \o -> do
        user_id_ <- mconcat [o A..:? "user_id", U.rm <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageSenderUser {user_id = user_id_}

      parseMessageSenderChat :: A.Value -> T.Parser MessageSender
      parseMessageSenderChat = A.withObject "MessageSenderChat" $ \o -> do
        chat_id_ <- mconcat [o A..:? "chat_id", U.rm <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ MessageSenderChat {chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON MessageSender where
  toJSON
    MessageSenderUser
      { user_id = user_id
      } =
      A.object
        [ "@type" A..= T.String "messageSenderUser",
          "user_id" A..= user_id
        ]
  toJSON
    MessageSenderChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "messageSenderChat",
          "chat_id" A..= chat_id
        ]
