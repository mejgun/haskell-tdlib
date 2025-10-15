module TD.Data.UpgradedGiftColors
  (UpgradedGiftColors(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data UpgradedGiftColors
  = UpgradedGiftColors -- ^ Contains information about color scheme for user's name, background of empty chat photo, replies to messages and link previews
    { _id                      :: Maybe Int   -- ^ Unique identifier of the upgraded gift colors
    , model_custom_emoji_id    :: Maybe Int   -- ^ Custom emoji identifier of the model of the upgraded gift
    , symbol_custom_emoji_id   :: Maybe Int   -- ^ Custom emoji identifier of the symbol of the upgraded gift
    , light_theme_accent_color :: Maybe Int   -- ^ Accent color to use in light themes in RGB format
    , light_theme_colors       :: Maybe [Int] -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
    , dark_theme_accent_color  :: Maybe Int   -- ^ Accent color to use in dark themes in RGB format
    , dark_theme_colors        :: Maybe [Int] -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
    }
  deriving (Eq, Show)

instance I.ShortShow UpgradedGiftColors where
  shortShow UpgradedGiftColors
    { _id                      = _id_
    , model_custom_emoji_id    = model_custom_emoji_id_
    , symbol_custom_emoji_id   = symbol_custom_emoji_id_
    , light_theme_accent_color = light_theme_accent_color_
    , light_theme_colors       = light_theme_colors_
    , dark_theme_accent_color  = dark_theme_accent_color_
    , dark_theme_colors        = dark_theme_colors_
    }
      = "UpgradedGiftColors"
        ++ I.cc
        [ "_id"                      `I.p` _id_
        , "model_custom_emoji_id"    `I.p` model_custom_emoji_id_
        , "symbol_custom_emoji_id"   `I.p` symbol_custom_emoji_id_
        , "light_theme_accent_color" `I.p` light_theme_accent_color_
        , "light_theme_colors"       `I.p` light_theme_colors_
        , "dark_theme_accent_color"  `I.p` dark_theme_accent_color_
        , "dark_theme_colors"        `I.p` dark_theme_colors_
        ]

instance AT.FromJSON UpgradedGiftColors where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "upgradedGiftColors" -> parseUpgradedGiftColors v
      _                    -> mempty
    
    where
      parseUpgradedGiftColors :: A.Value -> AT.Parser UpgradedGiftColors
      parseUpgradedGiftColors = A.withObject "UpgradedGiftColors" $ \o -> do
        _id_                      <- fmap I.readInt64 <$> o A..:?  "id"
        model_custom_emoji_id_    <- fmap I.readInt64 <$> o A..:?  "model_custom_emoji_id"
        symbol_custom_emoji_id_   <- fmap I.readInt64 <$> o A..:?  "symbol_custom_emoji_id"
        light_theme_accent_color_ <- o A..:?                       "light_theme_accent_color"
        light_theme_colors_       <- o A..:?                       "light_theme_colors"
        dark_theme_accent_color_  <- o A..:?                       "dark_theme_accent_color"
        dark_theme_colors_        <- o A..:?                       "dark_theme_colors"
        pure $ UpgradedGiftColors
          { _id                      = _id_
          , model_custom_emoji_id    = model_custom_emoji_id_
          , symbol_custom_emoji_id   = symbol_custom_emoji_id_
          , light_theme_accent_color = light_theme_accent_color_
          , light_theme_colors       = light_theme_colors_
          , dark_theme_accent_color  = dark_theme_accent_color_
          , dark_theme_colors        = dark_theme_colors_
          }
  parseJSON _ = mempty

