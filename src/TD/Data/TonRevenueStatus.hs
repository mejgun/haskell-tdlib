module TD.Data.TonRevenueStatus
  (TonRevenueStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data TonRevenueStatus
  = TonRevenueStatus -- ^ Contains information about Toncoins earned by the current user
    { total_amount       :: Maybe Int  -- ^ Total amount of Toncoins earned; in the smallest units of the cryptocurrency
    , balance_amount     :: Maybe Int  -- ^ Amount of Toncoins that aren't withdrawn yet; in the smallest units of the cryptocurrency
    , available_amount   :: Maybe Int  -- ^ Amount of Toncoins that are available for withdrawal; in the smallest units of the cryptocurrency
    , withdrawal_enabled :: Maybe Bool -- ^ True, if Toncoins can be withdrawn
    }
  deriving (Eq, Show)

instance I.ShortShow TonRevenueStatus where
  shortShow TonRevenueStatus
    { total_amount       = total_amount_
    , balance_amount     = balance_amount_
    , available_amount   = available_amount_
    , withdrawal_enabled = withdrawal_enabled_
    }
      = "TonRevenueStatus"
        ++ I.cc
        [ "total_amount"       `I.p` total_amount_
        , "balance_amount"     `I.p` balance_amount_
        , "available_amount"   `I.p` available_amount_
        , "withdrawal_enabled" `I.p` withdrawal_enabled_
        ]

instance AT.FromJSON TonRevenueStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonRevenueStatus" -> parseTonRevenueStatus v
      _                  -> mempty
    
    where
      parseTonRevenueStatus :: A.Value -> AT.Parser TonRevenueStatus
      parseTonRevenueStatus = A.withObject "TonRevenueStatus" $ \o -> do
        total_amount_       <- fmap I.readInt64 <$> o A..:?  "total_amount"
        balance_amount_     <- fmap I.readInt64 <$> o A..:?  "balance_amount"
        available_amount_   <- fmap I.readInt64 <$> o A..:?  "available_amount"
        withdrawal_enabled_ <- o A..:?                       "withdrawal_enabled"
        pure $ TonRevenueStatus
          { total_amount       = total_amount_
          , balance_amount     = balance_amount_
          , available_amount   = available_amount_
          , withdrawal_enabled = withdrawal_enabled_
          }
  parseJSON _ = mempty

