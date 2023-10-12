module TD.Data.MessageForwardOrigin where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data MessageForwardOrigin -- ^ Contains information about the origin of a forwarded message
  = MessageForwardOriginUser -- ^ The message was originally sent by a known user
    { sender_user_id :: Maybe Int -- ^ Identifier of the user that originally sent the message
    }
  | MessageForwardOriginChat -- ^ The message was originally sent on behalf of a chat
    { sender_chat_id   :: Maybe Int    -- ^ Identifier of the chat that originally sent the message
    , author_signature :: Maybe T.Text -- ^ For messages originally sent by an anonymous chat administrator, original message author signature
    }
  | MessageForwardOriginHiddenUser -- ^ The message was originally sent by a user, which is hidden by their privacy settings
    { sender_name :: Maybe T.Text -- ^ Name of the sender
    }
  | MessageForwardOriginChannel -- ^ The message was originally a post in a channel
    { chat_id          :: Maybe Int    -- ^ Identifier of the chat from which the message was originally forwarded
    , message_id       :: Maybe Int    -- ^ Message identifier of the original message
    , author_signature :: Maybe T.Text -- ^ Original post author signature
    }
  | MessageForwardOriginMessageImport -- ^ The message was imported from an exported message history
    { sender_name :: Maybe T.Text -- ^ Name of the sender
    }
  deriving (Eq)

instance Show MessageForwardOrigin where
  show MessageForwardOriginUser
    { sender_user_id = sender_user_id_
    }
      = "MessageForwardOriginUser"
        ++ I.cc
        [ "sender_user_id" `I.p` sender_user_id_
        ]
  show MessageForwardOriginChat
    { sender_chat_id   = sender_chat_id_
    , author_signature = author_signature_
    }
      = "MessageForwardOriginChat"
        ++ I.cc
        [ "sender_chat_id"   `I.p` sender_chat_id_
        , "author_signature" `I.p` author_signature_
        ]
  show MessageForwardOriginHiddenUser
    { sender_name = sender_name_
    }
      = "MessageForwardOriginHiddenUser"
        ++ I.cc
        [ "sender_name" `I.p` sender_name_
        ]
  show MessageForwardOriginChannel
    { chat_id          = chat_id_
    , message_id       = message_id_
    , author_signature = author_signature_
    }
      = "MessageForwardOriginChannel"
        ++ I.cc
        [ "chat_id"          `I.p` chat_id_
        , "message_id"       `I.p` message_id_
        , "author_signature" `I.p` author_signature_
        ]
  show MessageForwardOriginMessageImport
    { sender_name = sender_name_
    }
      = "MessageForwardOriginMessageImport"
        ++ I.cc
        [ "sender_name" `I.p` sender_name_
        ]

instance AT.FromJSON MessageForwardOrigin where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageForwardOriginUser"          -> parseMessageForwardOriginUser v
      "messageForwardOriginChat"          -> parseMessageForwardOriginChat v
      "messageForwardOriginHiddenUser"    -> parseMessageForwardOriginHiddenUser v
      "messageForwardOriginChannel"       -> parseMessageForwardOriginChannel v
      "messageForwardOriginMessageImport" -> parseMessageForwardOriginMessageImport v
      _                                   -> mempty
    
    where
      parseMessageForwardOriginUser :: A.Value -> AT.Parser MessageForwardOrigin
      parseMessageForwardOriginUser = A.withObject "MessageForwardOriginUser" $ \o -> do
        sender_user_id_ <- o A..:?  "sender_user_id"
        pure $ MessageForwardOriginUser
          { sender_user_id = sender_user_id_
          }
      parseMessageForwardOriginChat :: A.Value -> AT.Parser MessageForwardOrigin
      parseMessageForwardOriginChat = A.withObject "MessageForwardOriginChat" $ \o -> do
        sender_chat_id_   <- o A..:?  "sender_chat_id"
        author_signature_ <- o A..:?  "author_signature"
        pure $ MessageForwardOriginChat
          { sender_chat_id   = sender_chat_id_
          , author_signature = author_signature_
          }
      parseMessageForwardOriginHiddenUser :: A.Value -> AT.Parser MessageForwardOrigin
      parseMessageForwardOriginHiddenUser = A.withObject "MessageForwardOriginHiddenUser" $ \o -> do
        sender_name_ <- o A..:?  "sender_name"
        pure $ MessageForwardOriginHiddenUser
          { sender_name = sender_name_
          }
      parseMessageForwardOriginChannel :: A.Value -> AT.Parser MessageForwardOrigin
      parseMessageForwardOriginChannel = A.withObject "MessageForwardOriginChannel" $ \o -> do
        chat_id_          <- o A..:?  "chat_id"
        message_id_       <- o A..:?  "message_id"
        author_signature_ <- o A..:?  "author_signature"
        pure $ MessageForwardOriginChannel
          { chat_id          = chat_id_
          , message_id       = message_id_
          , author_signature = author_signature_
          }
      parseMessageForwardOriginMessageImport :: A.Value -> AT.Parser MessageForwardOrigin
      parseMessageForwardOriginMessageImport = A.withObject "MessageForwardOriginMessageImport" $ \o -> do
        sender_name_ <- o A..:?  "sender_name"
        pure $ MessageForwardOriginMessageImport
          { sender_name = sender_name_
          }

instance AT.ToJSON MessageForwardOrigin where
  toJSON MessageForwardOriginUser
    { sender_user_id = sender_user_id_
    }
      = A.object
        [ "@type"          A..= AT.String "messageForwardOriginUser"
        , "sender_user_id" A..= sender_user_id_
        ]
  toJSON MessageForwardOriginChat
    { sender_chat_id   = sender_chat_id_
    , author_signature = author_signature_
    }
      = A.object
        [ "@type"            A..= AT.String "messageForwardOriginChat"
        , "sender_chat_id"   A..= sender_chat_id_
        , "author_signature" A..= author_signature_
        ]
  toJSON MessageForwardOriginHiddenUser
    { sender_name = sender_name_
    }
      = A.object
        [ "@type"       A..= AT.String "messageForwardOriginHiddenUser"
        , "sender_name" A..= sender_name_
        ]
  toJSON MessageForwardOriginChannel
    { chat_id          = chat_id_
    , message_id       = message_id_
    , author_signature = author_signature_
    }
      = A.object
        [ "@type"            A..= AT.String "messageForwardOriginChannel"
        , "chat_id"          A..= chat_id_
        , "message_id"       A..= message_id_
        , "author_signature" A..= author_signature_
        ]
  toJSON MessageForwardOriginMessageImport
    { sender_name = sender_name_
    }
      = A.object
        [ "@type"       A..= AT.String "messageForwardOriginMessageImport"
        , "sender_name" A..= sender_name_
        ]
