module TD.Data.GiftUpgradePrice
  (GiftUpgradePrice(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GiftUpgradePrice
  = GiftUpgradePrice -- ^ Describes a price required to pay to upgrade a gift
    { date       :: Maybe Int -- ^ Point in time (Unix timestamp) when the price will be in effect
    , star_count :: Maybe Int -- ^ The amount of Telegram Stars required to pay to upgrade the gift
    }
  deriving (Eq, Show)

instance I.ShortShow GiftUpgradePrice where
  shortShow GiftUpgradePrice
    { date       = date_
    , star_count = star_count_
    }
      = "GiftUpgradePrice"
        ++ I.cc
        [ "date"       `I.p` date_
        , "star_count" `I.p` star_count_
        ]

instance AT.FromJSON GiftUpgradePrice where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftUpgradePrice" -> parseGiftUpgradePrice v
      _                  -> mempty
    
    where
      parseGiftUpgradePrice :: A.Value -> AT.Parser GiftUpgradePrice
      parseGiftUpgradePrice = A.withObject "GiftUpgradePrice" $ \o -> do
        date_       <- o A..:?  "date"
        star_count_ <- o A..:?  "star_count"
        pure $ GiftUpgradePrice
          { date       = date_
          , star_count = star_count_
          }
  parseJSON _ = mempty

