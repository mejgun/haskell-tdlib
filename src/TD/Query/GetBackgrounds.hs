module TD.Query.GetBackgrounds(GetBackgrounds(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetBackgrounds -- ^ Returns backgrounds installed by the user
  = GetBackgrounds
    { for_dark_theme :: Maybe Bool -- ^ Pass true to order returned backgrounds for a dark theme
    }
  deriving (Eq)

instance Show GetBackgrounds where
  show
    GetBackgrounds
      { for_dark_theme = for_dark_theme_
      }
        = "GetBackgrounds"
          ++ I.cc
          [ "for_dark_theme" `I.p` for_dark_theme_
          ]

instance AT.ToJSON GetBackgrounds where
  toJSON
    GetBackgrounds
      { for_dark_theme = for_dark_theme_
      }
        = A.object
          [ "@type"          A..= AT.String "getBackgrounds"
          , "for_dark_theme" A..= for_dark_theme_
          ]
