{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetBackgrounds where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns backgrounds installed by the user @for_dark_theme Pass true to order returned backgrounds for a dark theme
data GetBackgrounds = GetBackgrounds
  { -- |
    for_dark_theme :: Maybe Bool
  }
  deriving (Eq)

instance Show GetBackgrounds where
  show
    GetBackgrounds
      { for_dark_theme = for_dark_theme_
      } =
      "GetBackgrounds"
        ++ U.cc
          [ U.p "for_dark_theme" for_dark_theme_
          ]

instance T.ToJSON GetBackgrounds where
  toJSON
    GetBackgrounds
      { for_dark_theme = for_dark_theme_
      } =
      A.object
        [ "@type" A..= T.String "getBackgrounds",
          "for_dark_theme" A..= for_dark_theme_
        ]
