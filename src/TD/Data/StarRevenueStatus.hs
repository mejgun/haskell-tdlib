module TD.Data.StarRevenueStatus
  (StarRevenueStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StarRevenueStatus
  = StarRevenueStatus -- ^ Contains information about Telegram stars earned by a bot or a chat
    { total_count        :: Maybe Int  -- ^ Total number of the stars earned
    , current_count      :: Maybe Int  -- ^ The number of Telegram stars that aren't withdrawn yet
    , available_count    :: Maybe Int  -- ^ The number of Telegram stars that are available for withdrawal
    , withdrawal_enabled :: Maybe Bool -- ^ True, if Telegram stars can be withdrawn now or later
    , next_withdrawal_in :: Maybe Int  -- ^ Time left before the next withdrawal can be started, in seconds; 0 if withdrawal can be started now
    }
  deriving (Eq, Show)

instance I.ShortShow StarRevenueStatus where
  shortShow StarRevenueStatus
    { total_count        = total_count_
    , current_count      = current_count_
    , available_count    = available_count_
    , withdrawal_enabled = withdrawal_enabled_
    , next_withdrawal_in = next_withdrawal_in_
    }
      = "StarRevenueStatus"
        ++ I.cc
        [ "total_count"        `I.p` total_count_
        , "current_count"      `I.p` current_count_
        , "available_count"    `I.p` available_count_
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
        total_count_        <- o A..:?  "total_count"
        current_count_      <- o A..:?  "current_count"
        available_count_    <- o A..:?  "available_count"
        withdrawal_enabled_ <- o A..:?  "withdrawal_enabled"
        next_withdrawal_in_ <- o A..:?  "next_withdrawal_in"
        pure $ StarRevenueStatus
          { total_count        = total_count_
          , current_count      = current_count_
          , available_count    = available_count_
          , withdrawal_enabled = withdrawal_enabled_
          , next_withdrawal_in = next_withdrawal_in_
          }
  parseJSON _ = mempty

