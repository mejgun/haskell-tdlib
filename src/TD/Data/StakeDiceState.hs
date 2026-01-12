module TD.Data.StakeDiceState
  (StakeDiceState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data StakeDiceState
  = StakeDiceState -- ^ Describes state of the stake dice
    { state_hash                      :: Maybe T.Text -- ^ Hash of the state to use for sending the next dice; may be empty if the stake dice can't be sent by the current user
    , stake_toncoin_amount            :: Maybe Int    -- ^ The Toncoin amount that was staked in the previous roll; in the smallest units of the currency
    , suggested_stake_toncoin_amounts :: Maybe [Int]  -- ^ The amounts of Toncoins that are suggested to be staked; in the smallest units of the currency
    , current_streak                  :: Maybe Int    -- ^ The number of rolled sixes towards the streak; 0-2
    , prize_per_mille                 :: Maybe [Int]  -- ^ The number of Toncoins received by the user for each 1000 Toncoins staked if the dice outcome is 1-6 correspondingly; may be empty if the stake dice can't be sent by the current user
    , streak_prize_per_mille          :: Maybe Int    -- ^ The number of Toncoins received by the user for each 1000 Toncoins staked if the dice outcome is 6 three times in a row with the same stake
    }
  deriving (Eq, Show)

instance I.ShortShow StakeDiceState where
  shortShow StakeDiceState
    { state_hash                      = state_hash_
    , stake_toncoin_amount            = stake_toncoin_amount_
    , suggested_stake_toncoin_amounts = suggested_stake_toncoin_amounts_
    , current_streak                  = current_streak_
    , prize_per_mille                 = prize_per_mille_
    , streak_prize_per_mille          = streak_prize_per_mille_
    }
      = "StakeDiceState"
        ++ I.cc
        [ "state_hash"                      `I.p` state_hash_
        , "stake_toncoin_amount"            `I.p` stake_toncoin_amount_
        , "suggested_stake_toncoin_amounts" `I.p` suggested_stake_toncoin_amounts_
        , "current_streak"                  `I.p` current_streak_
        , "prize_per_mille"                 `I.p` prize_per_mille_
        , "streak_prize_per_mille"          `I.p` streak_prize_per_mille_
        ]

instance AT.FromJSON StakeDiceState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stakeDiceState" -> parseStakeDiceState v
      _                -> mempty
    
    where
      parseStakeDiceState :: A.Value -> AT.Parser StakeDiceState
      parseStakeDiceState = A.withObject "StakeDiceState" $ \o -> do
        state_hash_                      <- o A..:?  "state_hash"
        stake_toncoin_amount_            <- o A..:?  "stake_toncoin_amount"
        suggested_stake_toncoin_amounts_ <- o A..:?  "suggested_stake_toncoin_amounts"
        current_streak_                  <- o A..:?  "current_streak"
        prize_per_mille_                 <- o A..:?  "prize_per_mille"
        streak_prize_per_mille_          <- o A..:?  "streak_prize_per_mille"
        pure $ StakeDiceState
          { state_hash                      = state_hash_
          , stake_toncoin_amount            = stake_toncoin_amount_
          , suggested_stake_toncoin_amounts = suggested_stake_toncoin_amounts_
          , current_streak                  = current_streak_
          , prize_per_mille                 = prize_per_mille_
          , streak_prize_per_mille          = streak_prize_per_mille_
          }
  parseJSON _ = mempty

