module TD.Data.GiveawayPrize
  (GiveawayPrize(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Contains information about a giveaway prize
data GiveawayPrize
  = GiveawayPrizePremium -- ^ The giveaway sends Telegram Premium subscriptions to the winners
    { month_count :: Maybe Int -- ^ Number of months the Telegram Premium subscription will be active after code activation
    }
  | GiveawayPrizeStars -- ^ The giveaway sends Telegram Stars to the winners
    { star_count :: Maybe Int -- ^ Number of Telegram Stars that will be shared by all winners
    }
  deriving (Eq, Show)

instance I.ShortShow GiveawayPrize where
  shortShow GiveawayPrizePremium
    { month_count = month_count_
    }
      = "GiveawayPrizePremium"
        ++ I.cc
        [ "month_count" `I.p` month_count_
        ]
  shortShow GiveawayPrizeStars
    { star_count = star_count_
    }
      = "GiveawayPrizeStars"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]

instance AT.FromJSON GiveawayPrize where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giveawayPrizePremium" -> parseGiveawayPrizePremium v
      "giveawayPrizeStars"   -> parseGiveawayPrizeStars v
      _                      -> mempty
    
    where
      parseGiveawayPrizePremium :: A.Value -> AT.Parser GiveawayPrize
      parseGiveawayPrizePremium = A.withObject "GiveawayPrizePremium" $ \o -> do
        month_count_ <- o A..:?  "month_count"
        pure $ GiveawayPrizePremium
          { month_count = month_count_
          }
      parseGiveawayPrizeStars :: A.Value -> AT.Parser GiveawayPrize
      parseGiveawayPrizeStars = A.withObject "GiveawayPrizeStars" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ GiveawayPrizeStars
          { star_count = star_count_
          }
  parseJSON _ = mempty

