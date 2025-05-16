module TD.Data.UpgradedGiftBackdrop
  (UpgradedGiftBackdrop(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.UpgradedGiftBackdropColors as UpgradedGiftBackdropColors

data UpgradedGiftBackdrop
  = UpgradedGiftBackdrop -- ^ Describes a backdrop of an upgraded gift
    { _id              :: Maybe Int                                                   -- ^ Unique identifier of the backdrop
    , name             :: Maybe T.Text                                                -- ^ Name of the backdrop
    , colors           :: Maybe UpgradedGiftBackdropColors.UpgradedGiftBackdropColors -- ^ Colors of the backdrop
    , rarity_per_mille :: Maybe Int                                                   -- ^ The number of upgraded gifts that receive this backdrop for each 1000 gifts upgraded
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftBackdrop where
  shortShow UpgradedGiftBackdrop
    { _id              = _id_
    , name             = name_
    , colors           = colors_
    , rarity_per_mille = rarity_per_mille_
    }
      = "UpgradedGiftBackdrop"
        ++ I.cc
        [ "_id"              `I.p` _id_
        , "name"             `I.p` name_
        , "colors"           `I.p` colors_
        , "rarity_per_mille" `I.p` rarity_per_mille_
        ]

instance AT.FromJSON UpgradedGiftBackdrop where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftBackdrop" -> parseUpgradedGiftBackdrop v
      _                      -> mempty
    
    where
      parseUpgradedGiftBackdrop :: A.Value -> AT.Parser UpgradedGiftBackdrop
      parseUpgradedGiftBackdrop = A.withObject "UpgradedGiftBackdrop" $ \o -> do
        _id_              <- o A..:?  "id"
        name_             <- o A..:?  "name"
        colors_           <- o A..:?  "colors"
        rarity_per_mille_ <- o A..:?  "rarity_per_mille"
        pure $ UpgradedGiftBackdrop
          { _id              = _id_
          , name             = name_
          , colors           = colors_
          , rarity_per_mille = rarity_per_mille_
          }
  parseJSON _ = mempty

