module TD.Query.GetInstalledBackgrounds
  (GetInstalledBackgrounds(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns backgrounds installed by the user. Returns 'TD.Data.Backgrounds.Backgrounds'
data GetInstalledBackgrounds
  = GetInstalledBackgrounds
    { for_dark_theme :: Maybe Bool -- ^ Pass true to order returned backgrounds for a dark theme
    }
  deriving (Eq, Show)

instance I.ShortShow GetInstalledBackgrounds where
  shortShow
    GetInstalledBackgrounds
      { for_dark_theme = for_dark_theme_
      }
        = "GetInstalledBackgrounds"
          ++ I.cc
          [ "for_dark_theme" `I.p` for_dark_theme_
          ]

instance AT.ToJSON GetInstalledBackgrounds where
  toJSON
    GetInstalledBackgrounds
      { for_dark_theme = for_dark_theme_
      }
        = A.object
          [ "@type"          A..= AT.String "getInstalledBackgrounds"
          , "for_dark_theme" A..= for_dark_theme_
          ]

