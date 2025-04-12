module TD.Data.UpgradedGiftModel
  (UpgradedGiftModel(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker

data UpgradedGiftModel
  = UpgradedGiftModel -- ^ Describes a model of an upgraded gift
    { name             :: Maybe T.Text          -- ^ Name of the model
    , sticker          :: Maybe Sticker.Sticker -- ^ The sticker representing the upgraded gift
    , rarity_per_mille :: Maybe Int             -- ^ The number of upgraded gifts that receive this model for each 1000 gifts upgraded
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftModel where
  shortShow UpgradedGiftModel
    { name             = name_
    , sticker          = sticker_
    , rarity_per_mille = rarity_per_mille_
    }
      = "UpgradedGiftModel"
        ++ I.cc
        [ "name"             `I.p` name_
        , "sticker"          `I.p` sticker_
        , "rarity_per_mille" `I.p` rarity_per_mille_
        ]

instance AT.FromJSON UpgradedGiftModel where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftModel" -> parseUpgradedGiftModel v
      _                   -> mempty
    
    where
      parseUpgradedGiftModel :: A.Value -> AT.Parser UpgradedGiftModel
      parseUpgradedGiftModel = A.withObject "UpgradedGiftModel" $ \o -> do
        name_             <- o A..:?  "name"
        sticker_          <- o A..:?  "sticker"
        rarity_per_mille_ <- o A..:?  "rarity_per_mille"
        pure $ UpgradedGiftModel
          { name             = name_
          , sticker          = sticker_
          , rarity_per_mille = rarity_per_mille_
          }
  parseJSON _ = mempty

