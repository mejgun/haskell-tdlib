module TD.Data.GramRevenueStatus
  (GramRevenueStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GramRevenueStatus
  = GramRevenueStatus -- ^ Contains information about TON Grams earned by the current user
    { total_amount       :: Maybe Int  -- ^ Total Gram amount earned; in the smallest units of the cryptocurrency
    , balance_amount     :: Maybe Int  -- ^ The Gram amount that isn't withdrawn yet; in the smallest units of the cryptocurrency
    , available_amount   :: Maybe Int  -- ^ The Gram amount that is available for withdrawal; in the smallest units of the cryptocurrency
    , withdrawal_enabled :: Maybe Bool -- ^ True, if Grams can be withdrawn
    }
  deriving (Eq, Show)

instance I.ShortShow GramRevenueStatus where
  shortShow GramRevenueStatus
    { total_amount       = total_amount_
    , balance_amount     = balance_amount_
    , available_amount   = available_amount_
    , withdrawal_enabled = withdrawal_enabled_
    }
      = "GramRevenueStatus"
        ++ I.cc
        [ "total_amount"       `I.p` total_amount_
        , "balance_amount"     `I.p` balance_amount_
        , "available_amount"   `I.p` available_amount_
        , "withdrawal_enabled" `I.p` withdrawal_enabled_
        ]

instance AT.FromJSON GramRevenueStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gramRevenueStatus" -> parseGramRevenueStatus v
      _                   -> mempty
    
    where
      parseGramRevenueStatus :: A.Value -> AT.Parser GramRevenueStatus
      parseGramRevenueStatus = A.withObject "GramRevenueStatus" $ \o -> do
        total_amount_       <- fmap I.readInt64 <$> o A..:?  "total_amount"
        balance_amount_     <- fmap I.readInt64 <$> o A..:?  "balance_amount"
        available_amount_   <- fmap I.readInt64 <$> o A..:?  "available_amount"
        withdrawal_enabled_ <- o A..:?                       "withdrawal_enabled"
        pure $ GramRevenueStatus
          { total_amount       = total_amount_
          , balance_amount     = balance_amount_
          , available_amount   = available_amount_
          , withdrawal_enabled = withdrawal_enabled_
          }
  parseJSON _ = mempty

