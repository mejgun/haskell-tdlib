{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetThemeParametersJsonString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Converts a themeParameters object to corresponding JSON-serialized string. Can be called synchronously @theme Theme parameters to convert to JSON
data GetThemeParametersJsonString = GetThemeParametersJsonString
  { -- |
    theme :: Maybe ThemeParameters.ThemeParameters
  }
  deriving (Eq)

instance Show GetThemeParametersJsonString where
  show
    GetThemeParametersJsonString
      { theme = theme_
      } =
      "GetThemeParametersJsonString"
        ++ U.cc
          [ U.p "theme" theme_
          ]

instance T.ToJSON GetThemeParametersJsonString where
  toJSON
    GetThemeParametersJsonString
      { theme = theme_
      } =
      A.object
        [ "@type" A..= T.String "getThemeParametersJsonString",
          "theme" A..= theme_
        ]
