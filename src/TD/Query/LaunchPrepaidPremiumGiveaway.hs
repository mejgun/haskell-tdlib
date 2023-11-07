module TD.Query.LaunchPrepaidPremiumGiveaway
  (LaunchPrepaidPremiumGiveaway(..)
  , defaultLaunchPrepaidPremiumGiveaway
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PremiumGiveawayParameters as PremiumGiveawayParameters

-- | Launches a prepaid Telegram Premium giveaway for subscribers of channel chats; requires can_post_messages rights in the channels. Returns 'TD.Data.Ok.Ok'
data LaunchPrepaidPremiumGiveaway
  = LaunchPrepaidPremiumGiveaway
    { giveaway_id :: Maybe Int                                                 -- ^ Unique identifier of the prepaid giveaway
    , parameters  :: Maybe PremiumGiveawayParameters.PremiumGiveawayParameters -- ^ Giveaway parameters
    }
  deriving (Eq, Show)

instance I.ShortShow LaunchPrepaidPremiumGiveaway where
  shortShow
    LaunchPrepaidPremiumGiveaway
      { giveaway_id = giveaway_id_
      , parameters  = parameters_
      }
        = "LaunchPrepaidPremiumGiveaway"
          ++ I.cc
          [ "giveaway_id" `I.p` giveaway_id_
          , "parameters"  `I.p` parameters_
          ]

instance AT.ToJSON LaunchPrepaidPremiumGiveaway where
  toJSON
    LaunchPrepaidPremiumGiveaway
      { giveaway_id = giveaway_id_
      , parameters  = parameters_
      }
        = A.object
          [ "@type"       A..= AT.String "launchPrepaidPremiumGiveaway"
          , "giveaway_id" A..= fmap I.writeInt64  giveaway_id_
          , "parameters"  A..= parameters_
          ]

defaultLaunchPrepaidPremiumGiveaway :: LaunchPrepaidPremiumGiveaway
defaultLaunchPrepaidPremiumGiveaway =
  LaunchPrepaidPremiumGiveaway
    { giveaway_id = Nothing
    , parameters  = Nothing
    }

