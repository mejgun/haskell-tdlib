module TD.Data.ProfileAccentColor
  (ProfileAccentColor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProfileAccentColors as ProfileAccentColors

data ProfileAccentColor
  = ProfileAccentColor -- ^ Contains information about supported accent color for user profile photo background
    { _id                             :: Maybe Int                                     -- ^ Profile accent color identifier
    , light_theme_colors              :: Maybe ProfileAccentColors.ProfileAccentColors -- ^ Accent colors expected to be used in light themes
    , dark_theme_colors               :: Maybe ProfileAccentColors.ProfileAccentColors -- ^ Accent colors expected to be used in dark themes
    , min_supergroup_chat_boost_level :: Maybe Int                                     -- ^ The minimum chat boost level required to use the color in a supergroup chat
    , min_channel_chat_boost_level    :: Maybe Int                                     -- ^ The minimum chat boost level required to use the color in a channel chat
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileAccentColor where
  shortShow ProfileAccentColor
    { _id                             = _id_
    , light_theme_colors              = light_theme_colors_
    , dark_theme_colors               = dark_theme_colors_
    , min_supergroup_chat_boost_level = min_supergroup_chat_boost_level_
    , min_channel_chat_boost_level    = min_channel_chat_boost_level_
    }
      = "ProfileAccentColor"
        ++ I.cc
        [ "_id"                             `I.p` _id_
        , "light_theme_colors"              `I.p` light_theme_colors_
        , "dark_theme_colors"               `I.p` dark_theme_colors_
        , "min_supergroup_chat_boost_level" `I.p` min_supergroup_chat_boost_level_
        , "min_channel_chat_boost_level"    `I.p` min_channel_chat_boost_level_
        ]

instance AT.FromJSON ProfileAccentColor where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "profileAccentColor" -> parseProfileAccentColor v
      _                    -> mempty
    
    where
      parseProfileAccentColor :: A.Value -> AT.Parser ProfileAccentColor
      parseProfileAccentColor = A.withObject "ProfileAccentColor" $ \o -> do
        _id_                             <- o A..:?  "id"
        light_theme_colors_              <- o A..:?  "light_theme_colors"
        dark_theme_colors_               <- o A..:?  "dark_theme_colors"
        min_supergroup_chat_boost_level_ <- o A..:?  "min_supergroup_chat_boost_level"
        min_channel_chat_boost_level_    <- o A..:?  "min_channel_chat_boost_level"
        pure $ ProfileAccentColor
          { _id                             = _id_
          , light_theme_colors              = light_theme_colors_
          , dark_theme_colors               = dark_theme_colors_
          , min_supergroup_chat_boost_level = min_supergroup_chat_boost_level_
          , min_channel_chat_boost_level    = min_channel_chat_boost_level_
          }
  parseJSON _ = mempty

