module TD.Data.GiftUpgradePreview
  (GiftUpgradePreview(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGiftModel as UpgradedGiftModel
import qualified TD.Data.UpgradedGiftSymbol as UpgradedGiftSymbol
import qualified TD.Data.UpgradedGiftBackdrop as UpgradedGiftBackdrop
import qualified TD.Data.GiftUpgradePrice as GiftUpgradePrice

data GiftUpgradePreview
  = GiftUpgradePreview -- ^ Contains examples of possible upgraded gifts for the given regular gift
    { models      :: Maybe [UpgradedGiftModel.UpgradedGiftModel]       -- ^ Examples of possible models that can be chosen for the gift after upgrade
    , symbols     :: Maybe [UpgradedGiftSymbol.UpgradedGiftSymbol]     -- ^ Examples of possible symbols that can be chosen for the gift after upgrade
    , backdrops   :: Maybe [UpgradedGiftBackdrop.UpgradedGiftBackdrop] -- ^ Examples of possible backdrops that can be chosen for the gift after upgrade
    , prices      :: Maybe [GiftUpgradePrice.GiftUpgradePrice]         -- ^ Examples of price for gift upgrade from the maximum price to the minimum price
    , next_prices :: Maybe [GiftUpgradePrice.GiftUpgradePrice]         -- ^ Next changes for the price for gift upgrade with more granularity than in prices
    }
  deriving (Eq, Show)

instance I.ShortShow GiftUpgradePreview where
  shortShow GiftUpgradePreview
    { models      = models_
    , symbols     = symbols_
    , backdrops   = backdrops_
    , prices      = prices_
    , next_prices = next_prices_
    }
      = "GiftUpgradePreview"
        ++ I.cc
        [ "models"      `I.p` models_
        , "symbols"     `I.p` symbols_
        , "backdrops"   `I.p` backdrops_
        , "prices"      `I.p` prices_
        , "next_prices" `I.p` next_prices_
        ]

instance AT.FromJSON GiftUpgradePreview where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftUpgradePreview" -> parseGiftUpgradePreview v
      _                    -> mempty
    
    where
      parseGiftUpgradePreview :: A.Value -> AT.Parser GiftUpgradePreview
      parseGiftUpgradePreview = A.withObject "GiftUpgradePreview" $ \o -> do
        models_      <- o A..:?  "models"
        symbols_     <- o A..:?  "symbols"
        backdrops_   <- o A..:?  "backdrops"
        prices_      <- o A..:?  "prices"
        next_prices_ <- o A..:?  "next_prices"
        pure $ GiftUpgradePreview
          { models      = models_
          , symbols     = symbols_
          , backdrops   = backdrops_
          , prices      = prices_
          , next_prices = next_prices_
          }
  parseJSON _ = mempty

