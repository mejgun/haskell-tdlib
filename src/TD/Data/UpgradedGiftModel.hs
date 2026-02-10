module TD.Data.UpgradedGiftModel
  (UpgradedGiftModel(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.UpgradedGiftAttributeRarity as UpgradedGiftAttributeRarity

data UpgradedGiftModel
  = UpgradedGiftModel -- ^ Describes a model of an upgraded gift
    { name       :: Maybe T.Text                                                  -- ^ Name of the model
    , sticker    :: Maybe Sticker.Sticker                                         -- ^ The sticker representing the upgraded gift
    , rarity     :: Maybe UpgradedGiftAttributeRarity.UpgradedGiftAttributeRarity -- ^ The rarity of the model
    , is_crafted :: Maybe Bool                                                    -- ^ True, if the model can be obtained only through gift crafting
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftModel where
  shortShow UpgradedGiftModel
    { name       = name_
    , sticker    = sticker_
    , rarity     = rarity_
    , is_crafted = is_crafted_
    }
      = "UpgradedGiftModel"
        ++ I.cc
        [ "name"       `I.p` name_
        , "sticker"    `I.p` sticker_
        , "rarity"     `I.p` rarity_
        , "is_crafted" `I.p` is_crafted_
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
        name_       <- o A..:?  "name"
        sticker_    <- o A..:?  "sticker"
        rarity_     <- o A..:?  "rarity"
        is_crafted_ <- o A..:?  "is_crafted"
        pure $ UpgradedGiftModel
          { name       = name_
          , sticker    = sticker_
          , rarity     = rarity_
          , is_crafted = is_crafted_
          }
  parseJSON _ = mempty

