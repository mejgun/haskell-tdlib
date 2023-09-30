{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetCustomLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified Utils as U

-- |
-- Adds or changes a custom local language pack to the current localization target
data SetCustomLanguagePack = SetCustomLanguagePack
  { -- | Strings of the new language pack
    strings :: Maybe [LanguagePackString.LanguagePackString],
    -- | Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
    info :: Maybe LanguagePackInfo.LanguagePackInfo
  }
  deriving (Eq)

instance Show SetCustomLanguagePack where
  show
    SetCustomLanguagePack
      { strings = strings_,
        info = info_
      } =
      "SetCustomLanguagePack"
        ++ U.cc
          [ U.p "strings" strings_,
            U.p "info" info_
          ]

instance T.ToJSON SetCustomLanguagePack where
  toJSON
    SetCustomLanguagePack
      { strings = strings_,
        info = info_
      } =
      A.object
        [ "@type" A..= T.String "setCustomLanguagePack",
          "strings" A..= strings_,
          "info" A..= info_
        ]
