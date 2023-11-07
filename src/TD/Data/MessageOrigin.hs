module TD.Data.MessageOrigin
  (MessageOrigin(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains information about the origin of a message
data MessageOrigin
  = MessageOriginUser -- ^ The message was originally sent by a known user
    { sender_user_id :: Maybe Int -- ^ Identifier of the user that originally sent the message
    }
  | MessageOriginHiddenUser -- ^ The message was originally sent by a user, which is hidden by their privacy settings
    { sender_name :: Maybe T.Text -- ^ Name of the sender
    }
  | MessageOriginChat -- ^ The message was originally sent on behalf of a chat
    { sender_chat_id   :: Maybe Int    -- ^ Identifier of the chat that originally sent the message
    , author_signature :: Maybe T.Text -- ^ For messages originally sent by an anonymous chat administrator, original message author signature
    }
  | MessageOriginChannel -- ^ The message was originally a post in a channel
    { chat_id          :: Maybe Int    -- ^ Identifier of the channel chat to which the message was originally sent
    , message_id       :: Maybe Int    -- ^ Message identifier of the original message
    , author_signature :: Maybe T.Text -- ^ Original post author signature
    }
  deriving (Eq, Show)

instance I.ShortShow MessageOrigin where
  shortShow MessageOriginUser
    { sender_user_id = sender_user_id_
    }
      = "MessageOriginUser"
        ++ I.cc
        [ "sender_user_id" `I.p` sender_user_id_
        ]
  shortShow MessageOriginHiddenUser
    { sender_name = sender_name_
    }
      = "MessageOriginHiddenUser"
        ++ I.cc
        [ "sender_name" `I.p` sender_name_
        ]
  shortShow MessageOriginChat
    { sender_chat_id   = sender_chat_id_
    , author_signature = author_signature_
    }
      = "MessageOriginChat"
        ++ I.cc
        [ "sender_chat_id"   `I.p` sender_chat_id_
        , "author_signature" `I.p` author_signature_
        ]
  shortShow MessageOriginChannel
    { chat_id          = chat_id_
    , message_id       = message_id_
    , author_signature = author_signature_
    }
      = "MessageOriginChannel"
        ++ I.cc
        [ "chat_id"          `I.p` chat_id_
        , "message_id"       `I.p` message_id_
        , "author_signature" `I.p` author_signature_
        ]

instance AT.FromJSON MessageOrigin where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageOriginUser"       -> parseMessageOriginUser v
      "messageOriginHiddenUser" -> parseMessageOriginHiddenUser v
      "messageOriginChat"       -> parseMessageOriginChat v
      "messageOriginChannel"    -> parseMessageOriginChannel v
      _                         -> mempty
    
    where
      parseMessageOriginUser :: A.Value -> AT.Parser MessageOrigin
      parseMessageOriginUser = A.withObject "MessageOriginUser" $ \o -> do
        sender_user_id_ <- o A..:?  "sender_user_id"
        pure $ MessageOriginUser
          { sender_user_id = sender_user_id_
          }
      parseMessageOriginHiddenUser :: A.Value -> AT.Parser MessageOrigin
      parseMessageOriginHiddenUser = A.withObject "MessageOriginHiddenUser" $ \o -> do
        sender_name_ <- o A..:?  "sender_name"
        pure $ MessageOriginHiddenUser
          { sender_name = sender_name_
          }
      parseMessageOriginChat :: A.Value -> AT.Parser MessageOrigin
      parseMessageOriginChat = A.withObject "MessageOriginChat" $ \o -> do
        sender_chat_id_   <- o A..:?  "sender_chat_id"
        author_signature_ <- o A..:?  "author_signature"
        pure $ MessageOriginChat
          { sender_chat_id   = sender_chat_id_
          , author_signature = author_signature_
          }
      parseMessageOriginChannel :: A.Value -> AT.Parser MessageOrigin
      parseMessageOriginChannel = A.withObject "MessageOriginChannel" $ \o -> do
        chat_id_          <- o A..:?  "chat_id"
        message_id_       <- o A..:?  "message_id"
        author_signature_ <- o A..:?  "author_signature"
        pure $ MessageOriginChannel
          { chat_id          = chat_id_
          , message_id       = message_id_
          , author_signature = author_signature_
          }
  parseJSON _ = mempty

