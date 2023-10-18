module TD.Query.GetThemeParametersJsonString
  (GetThemeParametersJsonString(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ThemeParameters as ThemeParameters

-- | Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously. Returns 'TD.Data.Text.Text'
data GetThemeParametersJsonString
  = GetThemeParametersJsonString
    { theme :: Maybe ThemeParameters.ThemeParameters -- ^ Theme parameters to convert to JSON
    }
  deriving (Eq, Show)

instance I.ShortShow GetThemeParametersJsonString where
  shortShow
    GetThemeParametersJsonString
      { theme = theme_
      }
        = "GetThemeParametersJsonString"
          ++ I.cc
          [ "theme" `I.p` theme_
          ]

instance AT.ToJSON GetThemeParametersJsonString where
  toJSON
    GetThemeParametersJsonString
      { theme = theme_
      }
        = A.object
          [ "@type" A..= AT.String "getThemeParametersJsonString"
          , "theme" A..= theme_
          ]

