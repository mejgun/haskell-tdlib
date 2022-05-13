{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPreferredCountryLanguage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown @country_code A two-letter ISO 3166-1 alpha-2 country code
data GetPreferredCountryLanguage = GetPreferredCountryLanguage
  { -- |
    country_code :: Maybe String
  }
  deriving (Eq)

instance Show GetPreferredCountryLanguage where
  show
    GetPreferredCountryLanguage
      { country_code = country_code_
      } =
      "GetPreferredCountryLanguage"
        ++ U.cc
          [ U.p "country_code" country_code_
          ]

instance T.ToJSON GetPreferredCountryLanguage where
  toJSON
    GetPreferredCountryLanguage
      { country_code = country_code_
      } =
      A.object
        [ "@type" A..= T.String "getPreferredCountryLanguage",
          "country_code" A..= country_code_
        ]
