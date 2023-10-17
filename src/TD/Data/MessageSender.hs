module TD.Data.MessageSender
  (MessageSender(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains information about the sender of a message
data MessageSender
  = MessageSenderUser -- ^ The message was sent by a known user
    { user_id :: Maybe Int -- ^ Identifier of the user that sent the message
    }
  | MessageSenderChat -- ^ The message was sent on behalf of a chat
    { chat_id :: Maybe Int -- ^ Identifier of the chat that sent the message
    }
  deriving (Eq, Show)

instance I.ShortShow MessageSender where
  shortShow MessageSenderUser
    { user_id = user_id_
    }
      = "MessageSenderUser"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        ]
  shortShow MessageSenderChat
    { chat_id = chat_id_
    }
      = "MessageSenderChat"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]

instance AT.FromJSON MessageSender where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageSenderUser" -> parseMessageSenderUser v
      "messageSenderChat" -> parseMessageSenderChat v
      _                   -> mempty
    
    where
      parseMessageSenderUser :: A.Value -> AT.Parser MessageSender
      parseMessageSenderUser = A.withObject "MessageSenderUser" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        pure $ MessageSenderUser
          { user_id = user_id_
          }
      parseMessageSenderChat :: A.Value -> AT.Parser MessageSender
      parseMessageSenderChat = A.withObject "MessageSenderChat" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ MessageSenderChat
          { chat_id = chat_id_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageSender where
  toJSON MessageSenderUser
    { user_id = user_id_
    }
      = A.object
        [ "@type"   A..= AT.String "messageSenderUser"
        , "user_id" A..= user_id_
        ]
  toJSON MessageSenderChat
    { chat_id = chat_id_
    }
      = A.object
        [ "@type"   A..= AT.String "messageSenderChat"
        , "chat_id" A..= chat_id_
        ]

