module TD.Data.ThemeParameters (ThemeParameters(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ThemeParameters
  = ThemeParameters -- ^ Contains parameters of the application theme
    { background_color           :: Maybe Int -- ^ A color of the background in the RGB24 format
    , secondary_background_color :: Maybe Int -- ^ A secondary color for the background in the RGB24 format
    , text_color                 :: Maybe Int -- ^ A color of text in the RGB24 format
    , hint_color                 :: Maybe Int -- ^ A color of hints in the RGB24 format
    , link_color                 :: Maybe Int -- ^ A color of links in the RGB24 format
    , button_color               :: Maybe Int -- ^ A color of the buttons in the RGB24 format
    , button_text_color          :: Maybe Int -- ^ A color of text on the buttons in the RGB24 format
    }
  deriving (Eq)

instance Show ThemeParameters where
  show ThemeParameters
    { background_color           = background_color_
    , secondary_background_color = secondary_background_color_
    , text_color                 = text_color_
    , hint_color                 = hint_color_
    , link_color                 = link_color_
    , button_color               = button_color_
    , button_text_color          = button_text_color_
    }
      = "ThemeParameters"
        ++ I.cc
        [ "background_color"           `I.p` background_color_
        , "secondary_background_color" `I.p` secondary_background_color_
        , "text_color"                 `I.p` text_color_
        , "hint_color"                 `I.p` hint_color_
        , "link_color"                 `I.p` link_color_
        , "button_color"               `I.p` button_color_
        , "button_text_color"          `I.p` button_text_color_
        ]

instance AT.FromJSON ThemeParameters where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "themeParameters" -> parseThemeParameters v
      _                 -> mempty
    
    where
      parseThemeParameters :: A.Value -> AT.Parser ThemeParameters
      parseThemeParameters = A.withObject "ThemeParameters" $ \o -> do
        background_color_           <- o A..:?  "background_color"
        secondary_background_color_ <- o A..:?  "secondary_background_color"
        text_color_                 <- o A..:?  "text_color"
        hint_color_                 <- o A..:?  "hint_color"
        link_color_                 <- o A..:?  "link_color"
        button_color_               <- o A..:?  "button_color"
        button_text_color_          <- o A..:?  "button_text_color"
        pure $ ThemeParameters
          { background_color           = background_color_
          , secondary_background_color = secondary_background_color_
          , text_color                 = text_color_
          , hint_color                 = hint_color_
          , link_color                 = link_color_
          , button_color               = button_color_
          , button_text_color          = button_text_color_
          }
  parseJSON _ = mempty

instance AT.ToJSON ThemeParameters where
  toJSON ThemeParameters
    { background_color           = background_color_
    , secondary_background_color = secondary_background_color_
    , text_color                 = text_color_
    , hint_color                 = hint_color_
    , link_color                 = link_color_
    , button_color               = button_color_
    , button_text_color          = button_text_color_
    }
      = A.object
        [ "@type"                      A..= AT.String "themeParameters"
        , "background_color"           A..= background_color_
        , "secondary_background_color" A..= secondary_background_color_
        , "text_color"                 A..= text_color_
        , "hint_color"                 A..= hint_color_
        , "link_color"                 A..= link_color_
        , "button_color"               A..= button_color_
        , "button_text_color"          A..= button_text_color_
        ]
