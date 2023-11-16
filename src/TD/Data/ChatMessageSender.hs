module TD.Data.ChatMessageSender
  (ChatMessageSender(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data ChatMessageSender
  = ChatMessageSender -- ^ Represents a message sender, which can be used to send messages in a chat
    { sender        :: Maybe MessageSender.MessageSender -- ^ The message sender
    , needs_premium :: Maybe Bool                        -- ^ True, if Telegram Premium is needed to use the message sender
    }
  deriving (Eq, Show)

instance I.ShortShow ChatMessageSender where
  shortShow ChatMessageSender
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
  parseJSON _ = mempty

