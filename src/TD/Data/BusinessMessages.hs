module TD.Data.BusinessMessages
  (BusinessMessages(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessMessage as BusinessMessage

data BusinessMessages
  = BusinessMessages -- ^ Contains a list of messages from a business account as received by a bot
    { messages :: Maybe [BusinessMessage.BusinessMessage] -- ^ List of business messages
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessMessages where
  shortShow BusinessMessages
    { messages = messages_
    }
      = "BusinessMessages"
        ++ I.cc
        [ "messages" `I.p` messages_
        ]

instance AT.FromJSON BusinessMessages where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessMessages" -> parseBusinessMessages v
      _                  -> mempty
    
    where
      parseBusinessMessages :: A.Value -> AT.Parser BusinessMessages
      parseBusinessMessages = A.withObject "BusinessMessages" $ \o -> do
        messages_ <- o A..:?  "messages"
        pure $ BusinessMessages
          { messages = messages_
          }
  parseJSON _ = mempty

