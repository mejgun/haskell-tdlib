module TD.Data.TransactionDirection
  (TransactionDirection(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes direction of transactions in a transaction list
data TransactionDirection
  = TransactionDirectionIncoming -- ^ The transaction is incoming and increases the amount of owned currency
  | TransactionDirectionOutgoing -- ^ The transaction is outgoing and decreases the amount of owned currency
  deriving (Eq, Show)

instance I.ShortShow TransactionDirection where
  shortShow TransactionDirectionIncoming
      = "TransactionDirectionIncoming"
  shortShow TransactionDirectionOutgoing
      = "TransactionDirectionOutgoing"

instance AT.FromJSON TransactionDirection where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "transactionDirectionIncoming" -> pure TransactionDirectionIncoming
      "transactionDirectionOutgoing" -> pure TransactionDirectionOutgoing
      _                              -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON TransactionDirection where
  toJSON TransactionDirectionIncoming
      = A.object
        [ "@type" A..= AT.String "transactionDirectionIncoming"
        ]
  toJSON TransactionDirectionOutgoing
      = A.object
        [ "@type" A..= AT.String "transactionDirectionOutgoing"
        ]

