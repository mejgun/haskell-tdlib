module TD.Data.UpgradedGiftBackdrop
  (UpgradedGiftBackdrop(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data UpgradedGiftBackdrop
  = UpgradedGiftBackdrop -- ^ Describes a backdrop of an upgraded gift
    { name             :: Maybe T.Text -- ^ Name of the backdrop
    , center_color     :: Maybe Int    -- ^ A color in the center of the backdrop in the RGB format
    , edge_color       :: Maybe Int    -- ^ A color on the edges of the backdrop in the RGB format
    , symbol_color     :: Maybe Int    -- ^ A color to be applied for the symbol in the RGB format
    , text_color       :: Maybe Int    -- ^ A color for the text on the backdrop in the RGB format
    , rarity_per_mille :: Maybe Int    -- ^ The number of upgraded gift that receive this backdrop for each 1000 gifts upgraded
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftBackdrop where
  shortShow UpgradedGiftBackdrop
    { name             = name_
    , center_color     = center_color_
    , edge_color       = edge_color_
    , symbol_color     = symbol_color_
    , text_color       = text_color_
    , rarity_per_mille = rarity_per_mille_
    }
      = "UpgradedGiftBackdrop"
        ++ I.cc
        [ "name"             `I.p` name_
        , "center_color"     `I.p` center_color_
        , "edge_color"       `I.p` edge_color_
        , "symbol_color"     `I.p` symbol_color_
        , "text_color"       `I.p` text_color_
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
        name_             <- o A..:?  "name"
        center_color_     <- o A..:?  "center_color"
        edge_color_       <- o A..:?  "edge_color"
        symbol_color_     <- o A..:?  "symbol_color"
        text_color_       <- o A..:?  "text_color"
        rarity_per_mille_ <- o A..:?  "rarity_per_mille"
        pure $ UpgradedGiftBackdrop
          { name             = name_
          , center_color     = center_color_
          , edge_color       = edge_color_
          , symbol_color     = symbol_color_
          , text_color       = text_color_
          , rarity_per_mille = rarity_per_mille_
          }
  parseJSON _ = mempty

