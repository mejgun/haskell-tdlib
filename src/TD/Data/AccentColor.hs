module TD.Data.AccentColor
  (AccentColor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data AccentColor
  = AccentColor -- ^ Contains information about supported accent color for user/chat name, background of empty chat photo, replies to messages and link previews
    { _id                          :: Maybe Int   -- ^ Accent color identifier
    , built_in_accent_color_id     :: Maybe Int   -- ^ Identifier of a built-in color to use in places, where only one color is needed; 0-6
    , light_theme_colors           :: Maybe [Int] -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
    , dark_theme_colors            :: Maybe [Int] -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
    , min_channel_chat_boost_level :: Maybe Int   -- ^ The minimum chat boost level required to use the color in a channel chat
    }
  deriving (Eq, Show)

instance I.ShortShow AccentColor where
  shortShow AccentColor
    { _id                          = _id_
    , built_in_accent_color_id     = built_in_accent_color_id_
    , light_theme_colors           = light_theme_colors_
    , dark_theme_colors            = dark_theme_colors_
    , min_channel_chat_boost_level = min_channel_chat_boost_level_
    }
      = "AccentColor"
        ++ I.cc
        [ "_id"                          `I.p` _id_
        , "built_in_accent_color_id"     `I.p` built_in_accent_color_id_
        , "light_theme_colors"           `I.p` light_theme_colors_
        , "dark_theme_colors"            `I.p` dark_theme_colors_
        , "min_channel_chat_boost_level" `I.p` min_channel_chat_boost_level_
        ]

instance AT.FromJSON AccentColor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "accentColor" -> parseAccentColor v
      _             -> mempty
    
    where
      parseAccentColor :: A.Value -> AT.Parser AccentColor
      parseAccentColor = A.withObject "AccentColor" $ \o -> do
        _id_                          <- o A..:?  "id"
        built_in_accent_color_id_     <- o A..:?  "built_in_accent_color_id"
        light_theme_colors_           <- o A..:?  "light_theme_colors"
        dark_theme_colors_            <- o A..:?  "dark_theme_colors"
        min_channel_chat_boost_level_ <- o A..:?  "min_channel_chat_boost_level"
        pure $ AccentColor
          { _id                          = _id_
          , built_in_accent_color_id     = built_in_accent_color_id_
          , light_theme_colors           = light_theme_colors_
          , dark_theme_colors            = dark_theme_colors_
          , min_channel_chat_boost_level = min_channel_chat_boost_level_
          }
  parseJSON _ = mempty

