{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageForwardOrigin where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains information about the origin of a forwarded message
data MessageForwardOrigin
  = -- | The message was originally sent by a known user @sender_user_id Identifier of the user that originally sent the message
    MessageForwardOriginUser
      { -- |
        sender_user_id :: Maybe Int
      }
  | -- | The message was originally sent on behalf of a chat
    MessageForwardOriginChat
      { -- | For messages originally sent by an anonymous chat administrator, original message author signature
        author_signature :: Maybe String,
        -- | Identifier of the chat that originally sent the message
        sender_chat_id :: Maybe Int
      }
  | -- | The message was originally sent by a user, which is hidden by their privacy settings @sender_name Name of the sender
    MessageForwardOriginHiddenUser
      { -- |
        sender_name :: Maybe String
      }
  | -- | The message was originally a post in a channel
    MessageForwardOriginChannel
      { -- | Original post author signature
        author_signature :: Maybe String,
        -- | Message identifier of the original message
        message_id :: Maybe Int,
        -- | Identifier of the chat from which the message was originally forwarded
        chat_id :: Maybe Int
      }
  | -- | The message was imported from an exported message history @sender_name Name of the sender
    MessageForwardOriginMessageImport
      { -- |
        sender_name :: Maybe String
      }
  deriving (Eq)

instance Show MessageForwardOrigin where
  show
    MessageForwardOriginUser
      { sender_user_id = sender_user_id_
      } =
      "MessageForwardOriginUser"
        ++ U.cc
          [ U.p "sender_user_id" sender_user_id_
          ]
  show
    MessageForwardOriginChat
      { author_signature = author_signature_,
        sender_chat_id = sender_chat_id_
      } =
      "MessageForwardOriginChat"
        ++ U.cc
          [ U.p "author_signature" author_signature_,
            U.p "sender_chat_id" sender_chat_id_
          ]
  show
    MessageForwardOriginHiddenUser
      { sender_name = sender_name_
      } =
      "MessageForwardOriginHiddenUser"
        ++ U.cc
          [ U.p "sender_name" sender_name_
          ]
  show
    MessageForwardOriginChannel
      { author_signature = author_signature_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "MessageForwardOriginChannel"
        ++ U.cc
          [ U.p "author_signature" author_signature_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]
  show
    MessageForwardOriginMessageImport
      { sender_name = sender_name_
      } =
      "MessageForwardOriginMessageImport"
        ++ U.cc
          [ U.p "sender_name" sender_name_
          ]

instance T.FromJSON MessageForwardOrigin where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageForwardOriginUser" -> parseMessageForwardOriginUser v
      "messageForwardOriginChat" -> parseMessageForwardOriginChat v
      "messageForwardOriginHiddenUser" -> parseMessageForwardOriginHiddenUser v
      "messageForwardOriginChannel" -> parseMessageForwardOriginChannel v
      "messageForwardOriginMessageImport" -> parseMessageForwardOriginMessageImport v
      _ -> mempty
    where
      parseMessageForwardOriginUser :: A.Value -> T.Parser MessageForwardOrigin
      parseMessageForwardOriginUser = A.withObject "MessageForwardOriginUser" $ \o -> do
        sender_user_id_ <- o A..:? "sender_user_id"
        return $ MessageForwardOriginUser {sender_user_id = sender_user_id_}

      parseMessageForwardOriginChat :: A.Value -> T.Parser MessageForwardOrigin
      parseMessageForwardOriginChat = A.withObject "MessageForwardOriginChat" $ \o -> do
        author_signature_ <- o A..:? "author_signature"
        sender_chat_id_ <- o A..:? "sender_chat_id"
        return $ MessageForwardOriginChat {author_signature = author_signature_, sender_chat_id = sender_chat_id_}

      parseMessageForwardOriginHiddenUser :: A.Value -> T.Parser MessageForwardOrigin
      parseMessageForwardOriginHiddenUser = A.withObject "MessageForwardOriginHiddenUser" $ \o -> do
        sender_name_ <- o A..:? "sender_name"
        return $ MessageForwardOriginHiddenUser {sender_name = sender_name_}

      parseMessageForwardOriginChannel :: A.Value -> T.Parser MessageForwardOrigin
      parseMessageForwardOriginChannel = A.withObject "MessageForwardOriginChannel" $ \o -> do
        author_signature_ <- o A..:? "author_signature"
        message_id_ <- o A..:? "message_id"
        chat_id_ <- o A..:? "chat_id"
        return $ MessageForwardOriginChannel {author_signature = author_signature_, message_id = message_id_, chat_id = chat_id_}

      parseMessageForwardOriginMessageImport :: A.Value -> T.Parser MessageForwardOrigin
      parseMessageForwardOriginMessageImport = A.withObject "MessageForwardOriginMessageImport" $ \o -> do
        sender_name_ <- o A..:? "sender_name"
        return $ MessageForwardOriginMessageImport {sender_name = sender_name_}
  parseJSON _ = mempty

instance T.ToJSON MessageForwardOrigin where
  toJSON
    MessageForwardOriginUser
      { sender_user_id = sender_user_id_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardOriginUser",
          "sender_user_id" A..= sender_user_id_
        ]
  toJSON
    MessageForwardOriginChat
      { author_signature = author_signature_,
        sender_chat_id = sender_chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardOriginChat",
          "author_signature" A..= author_signature_,
          "sender_chat_id" A..= sender_chat_id_
        ]
  toJSON
    MessageForwardOriginHiddenUser
      { sender_name = sender_name_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardOriginHiddenUser",
          "sender_name" A..= sender_name_
        ]
  toJSON
    MessageForwardOriginChannel
      { author_signature = author_signature_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardOriginChannel",
          "author_signature" A..= author_signature_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
  toJSON
    MessageForwardOriginMessageImport
      { sender_name = sender_name_
      } =
      A.object
        [ "@type" A..= T.String "messageForwardOriginMessageImport",
          "sender_name" A..= sender_name_
        ]
