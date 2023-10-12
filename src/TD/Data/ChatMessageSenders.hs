module TD.Data.ChatMessageSenders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatMessageSender as ChatMessageSender

data ChatMessageSenders
  = ChatMessageSenders -- ^ Represents a list of message senders, which can be used to send messages in a chat
    { senders :: Maybe [ChatMessageSender.ChatMessageSender] -- ^ List of available message senders
    }
  deriving (Eq)

instance Show ChatMessageSenders where
  show ChatMessageSenders
    { senders = senders_
    }
      = "ChatMessageSenders"
        ++ I.cc
        [ "senders" `I.p` senders_
        ]

instance AT.FromJSON ChatMessageSenders where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMessageSenders" -> parseChatMessageSenders v
      _                    -> mempty
    
    where
      parseChatMessageSenders :: A.Value -> AT.Parser ChatMessageSenders
      parseChatMessageSenders = A.withObject "ChatMessageSenders" $ \o -> do
        senders_ <- o A..:?  "senders"
        pure $ ChatMessageSenders
          { senders = senders_
          }

instance AT.ToJSON ChatMessageSenders where
  toJSON ChatMessageSenders
    { senders = senders_
    }
      = A.object
        [ "@type"   A..= AT.String "chatMessageSenders"
        , "senders" A..= senders_
        ]
