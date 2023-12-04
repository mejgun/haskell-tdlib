module TD.Data.ProfileAccentColor
  (ProfileAccentColor(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProfileAccentColors as ProfileAccentColors

data ProfileAccentColor
  = ProfileAccentColor -- ^ Contains information about supported accent color for user profile photo background
    { _id                :: Maybe Int                                     -- ^ Profile accent color identifier
    , light_theme_colors :: Maybe ProfileAccentColors.ProfileAccentColors -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in light themes
    , dark_theme_colors  :: Maybe ProfileAccentColors.ProfileAccentColors -- ^ The list of 1-3 colors in RGB format, describing the accent color, as expected to be shown in dark themes
    }
  deriving (Eq, Show)

instance I.ShortShow ProfileAccentColor where
  shortShow ProfileAccentColor
    { _id                = _id_
    , light_theme_colors = light_theme_colors_
    , dark_theme_colors  = dark_theme_colors_
    }
      = "ProfileAccentColor"
        ++ I.cc
        [ "_id"                `I.p` _id_
        , "light_theme_colors" `I.p` light_theme_colors_
        , "dark_theme_colors"  `I.p` dark_theme_colors_
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
        _id_                <- o A..:?  "id"
        light_theme_colors_ <- o A..:?  "light_theme_colors"
        dark_theme_colors_  <- o A..:?  "dark_theme_colors"
        pure $ ProfileAccentColor
          { _id                = _id_
          , light_theme_colors = light_theme_colors_
          , dark_theme_colors  = dark_theme_colors_
          }
  parseJSON _ = mempty

