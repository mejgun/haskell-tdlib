module TD.Data.UpgradedGiftBackdropColors
  ( UpgradedGiftBackdropColors(..)    
  , defaultUpgradedGiftBackdropColors 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data UpgradedGiftBackdropColors
  = UpgradedGiftBackdropColors -- ^ Describes colors of a backdrop of an upgraded gift
    { center_color :: Maybe Int -- ^ A color in the center of the backdrop in the RGB format
    , edge_color   :: Maybe Int -- ^ A color on the edges of the backdrop in the RGB format
    , symbol_color :: Maybe Int -- ^ A color to be applied for the symbol in the RGB format
    , text_color   :: Maybe Int -- ^ A color for the text on the backdrop in the RGB format
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftBackdropColors where
  shortShow UpgradedGiftBackdropColors
    { center_color = center_color_
    , edge_color   = edge_color_
    , symbol_color = symbol_color_
    , text_color   = text_color_
    }
      = "UpgradedGiftBackdropColors"
        ++ I.cc
        [ "center_color" `I.p` center_color_
        , "edge_color"   `I.p` edge_color_
        , "symbol_color" `I.p` symbol_color_
        , "text_color"   `I.p` text_color_
        ]

instance AT.FromJSON UpgradedGiftBackdropColors where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftBackdropColors" -> parseUpgradedGiftBackdropColors v
      _                            -> mempty
    
    where
      parseUpgradedGiftBackdropColors :: A.Value -> AT.Parser UpgradedGiftBackdropColors
      parseUpgradedGiftBackdropColors = A.withObject "UpgradedGiftBackdropColors" $ \o -> do
        center_color_ <- o A..:?  "center_color"
        edge_color_   <- o A..:?  "edge_color"
        symbol_color_ <- o A..:?  "symbol_color"
        text_color_   <- o A..:?  "text_color"
        pure $ UpgradedGiftBackdropColors
          { center_color = center_color_
          , edge_color   = edge_color_
          , symbol_color = symbol_color_
          , text_color   = text_color_
          }
  parseJSON _ = mempty

instance AT.ToJSON UpgradedGiftBackdropColors where
  toJSON UpgradedGiftBackdropColors
    { center_color = center_color_
    , edge_color   = edge_color_
    , symbol_color = symbol_color_
    , text_color   = text_color_
    }
      = A.object
        [ "@type"        A..= AT.String "upgradedGiftBackdropColors"
        , "center_color" A..= center_color_
        , "edge_color"   A..= edge_color_
        , "symbol_color" A..= symbol_color_
        , "text_color"   A..= text_color_
        ]

defaultUpgradedGiftBackdropColors :: UpgradedGiftBackdropColors
defaultUpgradedGiftBackdropColors =
  UpgradedGiftBackdropColors
    { center_color = Nothing
    , edge_color   = Nothing
    , symbol_color = Nothing
    , text_color   = Nothing
    }

