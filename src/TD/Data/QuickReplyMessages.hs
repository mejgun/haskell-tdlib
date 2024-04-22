module TD.Data.QuickReplyMessages
  (QuickReplyMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.QuickReplyMessage as QuickReplyMessage

data QuickReplyMessages
  = QuickReplyMessages -- ^ Contains a list of quick reply messages
    { messages :: Maybe [QuickReplyMessage.QuickReplyMessage] -- ^ List of quick reply messages; messages may be null
    }
  deriving (Eq, Show)

instance I.ShortShow QuickReplyMessages where
  shortShow QuickReplyMessages
    { messages = messages_
    }
      = "QuickReplyMessages"
        ++ I.cc
        [ "messages" `I.p` messages_
        ]

instance AT.FromJSON QuickReplyMessages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "quickReplyMessages" -> parseQuickReplyMessages v
      _                    -> mempty
    
    where
      parseQuickReplyMessages :: A.Value -> AT.Parser QuickReplyMessages
      parseQuickReplyMessages = A.withObject "QuickReplyMessages" $ \o -> do
        messages_ <- o A..:?  "messages"
        pure $ QuickReplyMessages
          { messages = messages_
          }
  parseJSON _ = mempty

