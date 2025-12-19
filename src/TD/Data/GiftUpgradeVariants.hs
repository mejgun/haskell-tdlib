module TD.Data.GiftUpgradeVariants
  (GiftUpgradeVariants(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.UpgradedGiftModel as UpgradedGiftModel
import qualified TD.Data.UpgradedGiftSymbol as UpgradedGiftSymbol
import qualified TD.Data.UpgradedGiftBackdrop as UpgradedGiftBackdrop

data GiftUpgradeVariants
  = GiftUpgradeVariants -- ^ Contains all possible variants of upgraded gifts for the given regular gift
    { models    :: Maybe [UpgradedGiftModel.UpgradedGiftModel]       -- ^ Models that can be chosen for the gift after upgrade
    , symbols   :: Maybe [UpgradedGiftSymbol.UpgradedGiftSymbol]     -- ^ Symbols that can be chosen for the gift after upgrade
    , backdrops :: Maybe [UpgradedGiftBackdrop.UpgradedGiftBackdrop] -- ^ Backdrops that can be chosen for the gift after upgrade
    }
  deriving (Eq, Show)

instance I.ShortShow GiftUpgradeVariants where
  shortShow GiftUpgradeVariants
    { models    = models_
    , symbols   = symbols_
    , backdrops = backdrops_
    }
      = "GiftUpgradeVariants"
        ++ I.cc
        [ "models"    `I.p` models_
        , "symbols"   `I.p` symbols_
        , "backdrops" `I.p` backdrops_
        ]

instance AT.FromJSON GiftUpgradeVariants where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "giftUpgradeVariants" -> parseGiftUpgradeVariants v
      _                     -> mempty
    
    where
      parseGiftUpgradeVariants :: A.Value -> AT.Parser GiftUpgradeVariants
      parseGiftUpgradeVariants = A.withObject "GiftUpgradeVariants" $ \o -> do
        models_    <- o A..:?  "models"
        symbols_   <- o A..:?  "symbols"
        backdrops_ <- o A..:?  "backdrops"
        pure $ GiftUpgradeVariants
          { models    = models_
          , symbols   = symbols_
          , backdrops = backdrops_
          }
  parseJSON _ = mempty

