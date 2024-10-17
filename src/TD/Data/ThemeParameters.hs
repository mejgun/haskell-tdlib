module TD.Data.ThemeParameters
  ( ThemeParameters(..)    
  , defaultThemeParameters 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ThemeParameters
  = ThemeParameters -- ^ Contains parameters of the application theme
    { background_color            :: Maybe Int -- ^ A color of the background in the RGB format
    , secondary_background_color  :: Maybe Int -- ^ A secondary color for the background in the RGB format
    , header_background_color     :: Maybe Int -- ^ A color of the header background in the RGB format
    , bottom_bar_background_color :: Maybe Int -- ^ A color of the bottom bar background in the RGB format
    , section_background_color    :: Maybe Int -- ^ A color of the section background in the RGB format
    , section_separator_color     :: Maybe Int -- ^ A color of the section separator in the RGB format
    , text_color                  :: Maybe Int -- ^ A color of text in the RGB format
    , accent_text_color           :: Maybe Int -- ^ An accent color of the text in the RGB format
    , section_header_text_color   :: Maybe Int -- ^ A color of text on the section headers in the RGB format
    , subtitle_text_color         :: Maybe Int -- ^ A color of the subtitle text in the RGB format
    , destructive_text_color      :: Maybe Int -- ^ A color of the text for destructive actions in the RGB format
    , hint_color                  :: Maybe Int -- ^ A color of hints in the RGB format
    , link_color                  :: Maybe Int -- ^ A color of links in the RGB format
    , button_color                :: Maybe Int -- ^ A color of the buttons in the RGB format
    , button_text_color           :: Maybe Int -- ^ A color of text on the buttons in the RGB format
    }
  deriving (Eq, Show)

instance I.ShortShow ThemeParameters where
  shortShow ThemeParameters
    { background_color            = background_color_
    , secondary_background_color  = secondary_background_color_
    , header_background_color     = header_background_color_
    , bottom_bar_background_color = bottom_bar_background_color_
    , section_background_color    = section_background_color_
    , section_separator_color     = section_separator_color_
    , text_color                  = text_color_
    , accent_text_color           = accent_text_color_
    , section_header_text_color   = section_header_text_color_
    , subtitle_text_color         = subtitle_text_color_
    , destructive_text_color      = destructive_text_color_
    , hint_color                  = hint_color_
    , link_color                  = link_color_
    , button_color                = button_color_
    , button_text_color           = button_text_color_
    }
      = "ThemeParameters"
        ++ I.cc
        [ "background_color"            `I.p` background_color_
        , "secondary_background_color"  `I.p` secondary_background_color_
        , "header_background_color"     `I.p` header_background_color_
        , "bottom_bar_background_color" `I.p` bottom_bar_background_color_
        , "section_background_color"    `I.p` section_background_color_
        , "section_separator_color"     `I.p` section_separator_color_
        , "text_color"                  `I.p` text_color_
        , "accent_text_color"           `I.p` accent_text_color_
        , "section_header_text_color"   `I.p` section_header_text_color_
        , "subtitle_text_color"         `I.p` subtitle_text_color_
        , "destructive_text_color"      `I.p` destructive_text_color_
        , "hint_color"                  `I.p` hint_color_
        , "link_color"                  `I.p` link_color_
        , "button_color"                `I.p` button_color_
        , "button_text_color"           `I.p` button_text_color_
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
        background_color_            <- o A..:?  "background_color"
        secondary_background_color_  <- o A..:?  "secondary_background_color"
        header_background_color_     <- o A..:?  "header_background_color"
        bottom_bar_background_color_ <- o A..:?  "bottom_bar_background_color"
        section_background_color_    <- o A..:?  "section_background_color"
        section_separator_color_     <- o A..:?  "section_separator_color"
        text_color_                  <- o A..:?  "text_color"
        accent_text_color_           <- o A..:?  "accent_text_color"
        section_header_text_color_   <- o A..:?  "section_header_text_color"
        subtitle_text_color_         <- o A..:?  "subtitle_text_color"
        destructive_text_color_      <- o A..:?  "destructive_text_color"
        hint_color_                  <- o A..:?  "hint_color"
        link_color_                  <- o A..:?  "link_color"
        button_color_                <- o A..:?  "button_color"
        button_text_color_           <- o A..:?  "button_text_color"
        pure $ ThemeParameters
          { background_color            = background_color_
          , secondary_background_color  = secondary_background_color_
          , header_background_color     = header_background_color_
          , bottom_bar_background_color = bottom_bar_background_color_
          , section_background_color    = section_background_color_
          , section_separator_color     = section_separator_color_
          , text_color                  = text_color_
          , accent_text_color           = accent_text_color_
          , section_header_text_color   = section_header_text_color_
          , subtitle_text_color         = subtitle_text_color_
          , destructive_text_color      = destructive_text_color_
          , hint_color                  = hint_color_
          , link_color                  = link_color_
          , button_color                = button_color_
          , button_text_color           = button_text_color_
          }
  parseJSON _ = mempty

instance AT.ToJSON ThemeParameters where
  toJSON ThemeParameters
    { background_color            = background_color_
    , secondary_background_color  = secondary_background_color_
    , header_background_color     = header_background_color_
    , bottom_bar_background_color = bottom_bar_background_color_
    , section_background_color    = section_background_color_
    , section_separator_color     = section_separator_color_
    , text_color                  = text_color_
    , accent_text_color           = accent_text_color_
    , section_header_text_color   = section_header_text_color_
    , subtitle_text_color         = subtitle_text_color_
    , destructive_text_color      = destructive_text_color_
    , hint_color                  = hint_color_
    , link_color                  = link_color_
    , button_color                = button_color_
    , button_text_color           = button_text_color_
    }
      = A.object
        [ "@type"                       A..= AT.String "themeParameters"
        , "background_color"            A..= background_color_
        , "secondary_background_color"  A..= secondary_background_color_
        , "header_background_color"     A..= header_background_color_
        , "bottom_bar_background_color" A..= bottom_bar_background_color_
        , "section_background_color"    A..= section_background_color_
        , "section_separator_color"     A..= section_separator_color_
        , "text_color"                  A..= text_color_
        , "accent_text_color"           A..= accent_text_color_
        , "section_header_text_color"   A..= section_header_text_color_
        , "subtitle_text_color"         A..= subtitle_text_color_
        , "destructive_text_color"      A..= destructive_text_color_
        , "hint_color"                  A..= hint_color_
        , "link_color"                  A..= link_color_
        , "button_color"                A..= button_color_
        , "button_text_color"           A..= button_text_color_
        ]

defaultThemeParameters :: ThemeParameters
defaultThemeParameters =
  ThemeParameters
    { background_color            = Nothing
    , secondary_background_color  = Nothing
    , header_background_color     = Nothing
    , bottom_bar_background_color = Nothing
    , section_background_color    = Nothing
    , section_separator_color     = Nothing
    , text_color                  = Nothing
    , accent_text_color           = Nothing
    , section_header_text_color   = Nothing
    , subtitle_text_color         = Nothing
    , destructive_text_color      = Nothing
    , hint_color                  = Nothing
    , link_color                  = Nothing
    , button_color                = Nothing
    , button_text_color           = Nothing
    }

