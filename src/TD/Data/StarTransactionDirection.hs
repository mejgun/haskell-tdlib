module TD.Data.StarTransactionDirection
  (StarTransactionDirection(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes direction of a transaction with Telegram Stars
data StarTransactionDirection
  = StarTransactionDirectionIncoming -- ^ The transaction is incoming and increases the number of owned Telegram Stars
  | StarTransactionDirectionOutgoing -- ^ The transaction is outgoing and decreases the number of owned Telegram Stars
  deriving (Eq, Show)

instance I.ShortShow StarTransactionDirection where
  shortShow StarTransactionDirectionIncoming
      = "StarTransactionDirectionIncoming"
  shortShow StarTransactionDirectionOutgoing
      = "StarTransactionDirectionOutgoing"

instance AT.FromJSON StarTransactionDirection where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransactionDirectionIncoming" -> pure StarTransactionDirectionIncoming
      "starTransactionDirectionOutgoing" -> pure StarTransactionDirectionOutgoing
      _                                  -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON StarTransactionDirection where
  toJSON StarTransactionDirectionIncoming
      = A.object
        [ "@type" A..= AT.String "starTransactionDirectionIncoming"
        ]
  toJSON StarTransactionDirectionOutgoing
      = A.object
        [ "@type" A..= AT.String "starTransactionDirectionOutgoing"
        ]

