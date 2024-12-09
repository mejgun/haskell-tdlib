module TD.Data.StarTransactions
  (StarTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarAmount as StarAmount
import qualified TD.Data.StarTransaction as StarTransaction
import qualified Data.Text as T

data StarTransactions
  = StarTransactions -- ^ Represents a list of Telegram Star transactions
    { star_amount  :: Maybe StarAmount.StarAmount             -- ^ The amount of owned Telegram Stars
    , transactions :: Maybe [StarTransaction.StarTransaction] -- ^ List of transactions with Telegram Stars
    , next_offset  :: Maybe T.Text                            -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StarTransactions where
  shortShow StarTransactions
    { star_amount  = star_amount_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "StarTransactions"
        ++ I.cc
        [ "star_amount"  `I.p` star_amount_
        , "transactions" `I.p` transactions_
        , "next_offset"  `I.p` next_offset_
        ]

instance AT.FromJSON StarTransactions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starTransactions" -> parseStarTransactions v
      _                  -> mempty
    
    where
      parseStarTransactions :: A.Value -> AT.Parser StarTransactions
      parseStarTransactions = A.withObject "StarTransactions" $ \o -> do
        star_amount_  <- o A..:?  "star_amount"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ StarTransactions
          { star_amount  = star_amount_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

