module TD.Data.TonTransactions
  (TonTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonTransaction as TonTransaction
import qualified Data.Text as T

data TonTransactions
  = TonTransactions -- ^ Represents a list of Toncoin transactions
    { ton_amount   :: Maybe Int                             -- ^ The total amount of owned Toncoins
    , transactions :: Maybe [TonTransaction.TonTransaction] -- ^ List of Toncoin transactions
    , next_offset  :: Maybe T.Text                          -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow TonTransactions where
  shortShow TonTransactions
    { ton_amount   = ton_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "TonTransactions"
        ++ I.cc
        [ "ton_amount"   `I.p` ton_amount_
        , "transactions" `I.p` transactions_
        , "next_offset"  `I.p` next_offset_
        ]

instance AT.FromJSON TonTransactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonTransactions" -> parseTonTransactions v
      _                 -> mempty
    
    where
      parseTonTransactions :: A.Value -> AT.Parser TonTransactions
      parseTonTransactions = A.withObject "TonTransactions" $ \o -> do
        ton_amount_   <- o A..:?  "ton_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ TonTransactions
          { ton_amount   = ton_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

