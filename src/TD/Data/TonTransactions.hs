module TD.Data.TonTransactions
  (TonTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonTransaction as TonTransaction
import qualified Data.Text as T

data TonTransactions
  = TonTransactions -- ^ Represents a list of TON Gram transactions
    { gram_amount  :: Maybe Int                             -- ^ The total amount of owned Grams, in the smallest units of the cryptocurrency
    , transactions :: Maybe [TonTransaction.TonTransaction] -- ^ List of Gram transactions
    , next_offset  :: Maybe T.Text                          -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow TonTransactions where
  shortShow TonTransactions
    { gram_amount  = gram_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "TonTransactions"
        ++ I.cc
        [ "gram_amount"  `I.p` gram_amount_
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
        gram_amount_  <- o A..:?  "gram_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ TonTransactions
          { gram_amount  = gram_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

