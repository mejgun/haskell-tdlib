{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.CountryInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

data CountryInfo = -- | Contains information about a country
  CountryInfo
  { -- | List of country calling codes
    calling_codes :: Maybe [String],
    -- | True, if the country must be hidden from the list of all countries
    is_hidden :: Maybe Bool,
    -- | English name of the country
    english_name :: Maybe String,
    -- | Native name of the country
    name :: Maybe String,
    -- | A two-letter ISO 3166-1 alpha-2 country code
    country_code :: Maybe String
  }
  deriving (Eq)

instance Show CountryInfo where
  show
    CountryInfo
      { calling_codes = calling_codes,
        is_hidden = is_hidden,
        english_name = english_name,
        name = name,
        country_code = country_code
      } =
      "CountryInfo"
        ++ U.cc
          [ U.p "calling_codes" calling_codes,
            U.p "is_hidden" is_hidden,
            U.p "english_name" english_name,
            U.p "name" name,
            U.p "country_code" country_code
          ]

instance T.FromJSON CountryInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "countryInfo" -> parseCountryInfo v
      _ -> fail ""
    where
      parseCountryInfo :: A.Value -> T.Parser CountryInfo
      parseCountryInfo = A.withObject "CountryInfo" $ \o -> do
        calling_codes_ <- o A..:? "calling_codes"
        is_hidden_ <- o A..:? "is_hidden"
        english_name_ <- o A..:? "english_name"
        name_ <- o A..:? "name"
        country_code_ <- o A..:? "country_code"
        return $ CountryInfo {calling_codes = calling_codes_, is_hidden = is_hidden_, english_name = english_name_, name = name_, country_code = country_code_}
  parseJSON _ = fail ""

instance T.ToJSON CountryInfo where
  toJSON
    CountryInfo
      { calling_codes = calling_codes,
        is_hidden = is_hidden,
        english_name = english_name,
        name = name,
        country_code = country_code
      } =
      A.object
        [ "@type" A..= T.String "countryInfo",
          "calling_codes" A..= calling_codes,
          "is_hidden" A..= is_hidden,
          "english_name" A..= english_name,
          "name" A..= name,
          "country_code" A..= country_code
        ]
