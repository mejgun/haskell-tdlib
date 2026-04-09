module TD.Data.UpgradedGiftAttributeRarity
  (UpgradedGiftAttributeRarity(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes rarity of an upgraded gift attribute
data UpgradedGiftAttributeRarity
  = UpgradedGiftAttributeRarityPerMille -- ^ The rarity is represented as the numeric frequency of the model
    { per_mille :: Maybe Int -- ^ The number of upgraded gifts that receive this attribute for each 1000 gifts upgraded; if 0, then it can be shown as "<0.1%"
    }
  | UpgradedGiftAttributeRarityUncommon -- ^ The attribute is uncommon
  | UpgradedGiftAttributeRarityRare -- ^ The attribute is rare
  | UpgradedGiftAttributeRarityEpic -- ^ The attribute is epic
  | UpgradedGiftAttributeRarityLegendary -- ^ The attribute is legendary
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftAttributeRarity where
  shortShow UpgradedGiftAttributeRarityPerMille
    { per_mille = per_mille_
    }
      = "UpgradedGiftAttributeRarityPerMille"
        ++ I.cc
        [ "per_mille" `I.p` per_mille_
        ]
  shortShow UpgradedGiftAttributeRarityUncommon
      = "UpgradedGiftAttributeRarityUncommon"
  shortShow UpgradedGiftAttributeRarityRare
      = "UpgradedGiftAttributeRarityRare"
  shortShow UpgradedGiftAttributeRarityEpic
      = "UpgradedGiftAttributeRarityEpic"
  shortShow UpgradedGiftAttributeRarityLegendary
      = "UpgradedGiftAttributeRarityLegendary"

instance AT.FromJSON UpgradedGiftAttributeRarity where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftAttributeRarityPerMille"  -> parseUpgradedGiftAttributeRarityPerMille v
      "upgradedGiftAttributeRarityUncommon"  -> pure UpgradedGiftAttributeRarityUncommon
      "upgradedGiftAttributeRarityRare"      -> pure UpgradedGiftAttributeRarityRare
      "upgradedGiftAttributeRarityEpic"      -> pure UpgradedGiftAttributeRarityEpic
      "upgradedGiftAttributeRarityLegendary" -> pure UpgradedGiftAttributeRarityLegendary
      _                                      -> mempty
    
    where
      parseUpgradedGiftAttributeRarityPerMille :: A.Value -> AT.Parser UpgradedGiftAttributeRarity
      parseUpgradedGiftAttributeRarityPerMille = A.withObject "UpgradedGiftAttributeRarityPerMille" $ \o -> do
        per_mille_ <- o A..:?  "per_mille"
        pure $ UpgradedGiftAttributeRarityPerMille
          { per_mille = per_mille_
          }
  parseJSON _ = mempty

