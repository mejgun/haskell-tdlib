module TD.Data.StarRevenueStatus
  (StarRevenueStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StarAmount as StarAmount

data StarRevenueStatus
  = StarRevenueStatus -- ^ Contains information about Telegram Stars earned by a bot or a chat
    { total_amount       :: Maybe StarAmount.StarAmount -- ^ Total amount of Telegram Stars earned
    , current_amount     :: Maybe StarAmount.StarAmount -- ^ The amount of Telegram Stars that aren't withdrawn yet
    , available_amount   :: Maybe StarAmount.StarAmount -- ^ The amount of Telegram Stars that are available for withdrawal
    , withdrawal_enabled :: Maybe Bool                  -- ^ True, if Telegram Stars can be withdrawn now or later
    , next_withdrawal_in :: Maybe Int                   -- ^ Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now
    }
  deriving (Eq, Show)

instance I.ShortShow StarRevenueStatus where
  shortShow StarRevenueStatus
    { total_amount       = total_amount_
    , current_amount     = current_amount_
    , available_amount   = available_amount_
    , withdrawal_enabled = withdrawal_enabled_
    , next_withdrawal_in = next_withdrawal_in_
    }
      = "StarRevenueStatus"
        ++ I.cc
        [ "total_amount"       `I.p` total_amount_
        , "current_amount"     `I.p` current_amount_
        , "available_amount"   `I.p` available_amount_
        , "withdrawal_enabled" `I.p` withdrawal_enabled_
        , "next_withdrawal_in" `I.p` next_withdrawal_in_
        ]

instance AT.FromJSON StarRevenueStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starRevenueStatus" -> parseStarRevenueStatus v
      _                   -> mempty
    
    where
      parseStarRevenueStatus :: A.Value -> AT.Parser StarRevenueStatus
      parseStarRevenueStatus = A.withObject "StarRevenueStatus" $ \o -> do
        total_amount_       <- o A..:?  "total_amount"
        current_amount_     <- o A..:?  "current_amount"
        available_amount_   <- o A..:?  "available_amount"
        withdrawal_enabled_ <- o A..:?  "withdrawal_enabled"
        next_withdrawal_in_ <- o A..:?  "next_withdrawal_in"
        pure $ StarRevenueStatus
          { total_amount       = total_amount_
          , current_amount     = current_amount_
          , available_amount   = available_amount_
          , withdrawal_enabled = withdrawal_enabled_
          , next_withdrawal_in = next_withdrawal_in_
          }
  parseJSON _ = mempty

