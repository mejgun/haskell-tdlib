module TD.Data.StarTransactions
  (StarTransactions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarTransaction as StarTransaction
import qualified Data.Text as T

data StarTransactions
  = StarTransactions -- ^ Represents a list of Telegram star transactions
    { star_count   :: Maybe Int                               -- ^ The amount of owned Telegram stars
    , transactions :: Maybe [StarTransaction.StarTransaction] -- ^ List of transactions with Telegram stars
    , next_offset  :: Maybe T.Text                            -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StarTransactions where
  shortShow StarTransactions
    { star_count   = star_count_
    , transactions = transactions_
    , next_offset  = next_offset_
    }
      = "StarTransactions"
        ++ I.cc
        [ "star_count"   `I.p` star_count_
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
        star_count_   <- o A..:?  "star_count"
        transactions_ <- o A..:?  "transactions"
        next_offset_  <- o A..:?  "next_offset"
        pure $ StarTransactions
          { star_count   = star_count_
          , transactions = transactions_
          , next_offset  = next_offset_
          }
  parseJSON _ = mempty

