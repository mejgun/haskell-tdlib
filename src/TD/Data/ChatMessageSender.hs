module TD.Data.ChatMessageSender where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data ChatMessageSender
  = ChatMessageSender -- ^ Represents a message sender, which can be used to send messages in a chat
    { sender        :: Maybe MessageSender.MessageSender -- ^ Available message senders
    , needs_premium :: Maybe Bool                        -- ^ True, if Telegram Premium is needed to use the message sender
    }
  deriving (Eq)

instance Show ChatMessageSender where
  show ChatMessageSender
    { sender        = sender_
    , needs_premium = needs_premium_
    }
      = "ChatMessageSender"
        ++ I.cc
        [ "sender"        `I.p` sender_
        , "needs_premium" `I.p` needs_premium_
        ]

instance AT.FromJSON ChatMessageSender where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatMessageSender" -> parseChatMessageSender v
      _                   -> mempty
    
    where
      parseChatMessageSender :: A.Value -> AT.Parser ChatMessageSender
      parseChatMessageSender = A.withObject "ChatMessageSender" $ \o -> do
        sender_        <- o A..:?  "sender"
        needs_premium_ <- o A..:?  "needs_premium"
        pure $ ChatMessageSender
          { sender        = sender_
          , needs_premium = needs_premium_
          }

instance AT.ToJSON ChatMessageSender where
  toJSON ChatMessageSender
    { sender        = sender_
    , needs_premium = needs_premium_
    }
      = A.object
        [ "@type"         A..= AT.String "chatMessageSender"
        , "sender"        A..= sender_
        , "needs_premium" A..= needs_premium_
        ]
