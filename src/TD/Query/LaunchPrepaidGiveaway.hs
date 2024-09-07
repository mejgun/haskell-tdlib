module TD.Query.LaunchPrepaidGiveaway
  (LaunchPrepaidGiveaway(..)
  , defaultLaunchPrepaidGiveaway
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.GiveawayParameters as GiveawayParameters

-- | Launches a prepaid giveaway. Returns 'TD.Data.Ok.Ok'
data LaunchPrepaidGiveaway
  = LaunchPrepaidGiveaway
    { giveaway_id  :: Maybe Int                                   -- ^ Unique identifier of the prepaid giveaway
    , parameters   :: Maybe GiveawayParameters.GiveawayParameters -- ^ Giveaway parameters
    , winner_count :: Maybe Int                                   -- ^ The number of users to receive giveaway prize
    , star_count   :: Maybe Int                                   -- ^ The number of Telegram Stars to be distributed through the giveaway; pass 0 for Telegram Premium giveaways
    }
  deriving (Eq, Show)

instance I.ShortShow LaunchPrepaidGiveaway where
  shortShow
    LaunchPrepaidGiveaway
      { giveaway_id  = giveaway_id_
      , parameters   = parameters_
      , winner_count = winner_count_
      , star_count   = star_count_
      }
        = "LaunchPrepaidGiveaway"
          ++ I.cc
          [ "giveaway_id"  `I.p` giveaway_id_
          , "parameters"   `I.p` parameters_
          , "winner_count" `I.p` winner_count_
          , "star_count"   `I.p` star_count_
          ]

instance AT.ToJSON LaunchPrepaidGiveaway where
  toJSON
    LaunchPrepaidGiveaway
      { giveaway_id  = giveaway_id_
      , parameters   = parameters_
      , winner_count = winner_count_
      , star_count   = star_count_
      }
        = A.object
          [ "@type"        A..= AT.String "launchPrepaidGiveaway"
          , "giveaway_id"  A..= fmap I.writeInt64  giveaway_id_
          , "parameters"   A..= parameters_
          , "winner_count" A..= winner_count_
          , "star_count"   A..= star_count_
          ]

defaultLaunchPrepaidGiveaway :: LaunchPrepaidGiveaway
defaultLaunchPrepaidGiveaway =
  LaunchPrepaidGiveaway
    { giveaway_id  = Nothing
    , parameters   = Nothing
    , winner_count = Nothing
    , star_count   = Nothing
    }

