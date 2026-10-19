module TD.Data.TonWalletTransactions
  (TonWalletTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonWalletTransaction as TonWalletTransaction
import qualified Data.Text as T

data TonWalletTransactions
  = TonWalletTransactions -- ^ Represents a list of TON Gram transactions
    { gram_amount  :: Maybe Int                                         -- ^ The total amount of owned TON Grams, in the smallest units of the cryptocurrency
    , transactions :: Maybe [TonWalletTransaction.TonWalletTransaction] -- ^ List of transactions
    , next_offset  :: Maybe T.Text                                      -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow TonWalletTransactions where
  shortShow TonWalletTransactions
    { gram_amount  = gram_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "TonWalletTransactions"
        ++ I.cc
        [ "gram_amount"  `I.p` gram_amount_
        , "transactions" `I.p` transactions_
        , "next_offset"  `I.p` next_offset_
        ]

instance AT.FromJSON TonWalletTransactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonWalletTransactions" -> parseTonWalletTransactions v
      _                       -> mempty
    
    where
      parseTonWalletTransactions :: A.Value -> AT.Parser TonWalletTransactions
      parseTonWalletTransactions = A.withObject "TonWalletTransactions" $ \o -> do
        gram_amount_  <- o A..:?  "gram_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ TonWalletTransactions
          { gram_amount  = gram_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

