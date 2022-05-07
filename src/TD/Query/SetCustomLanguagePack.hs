{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetCustomLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified Utils as U

-- |
-- Adds or changes a custom local language pack to the current localization target @info Information about the language pack. Language pack ID must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization @strings Strings of the new language pack
data SetCustomLanguagePack = SetCustomLanguagePack
  { -- |
    strings :: Maybe [LanguagePackString.LanguagePackString],
    -- |
    info :: Maybe LanguagePackInfo.LanguagePackInfo
  }
  deriving (Eq)

instance Show SetCustomLanguagePack where
  show
    SetCustomLanguagePack
      { strings = strings,
        info = info
      } =
      "SetCustomLanguagePack"
        ++ U.cc
          [ U.p "strings" strings,
            U.p "info" info
          ]

instance T.ToJSON SetCustomLanguagePack where
  toJSON
    SetCustomLanguagePack
      { strings = strings,
        info = info
      } =
      A.object
        [ "@type" A..= T.String "setCustomLanguagePack",
          "strings" A..= strings,
          "info" A..= info
        ]
