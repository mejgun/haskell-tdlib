-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.CountryInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about a country
-- 
-- __country_code__ A two-letter ISO 3166-1 alpha-2 country code
-- 
-- __name__ Native name of the country
-- 
-- __english_name__ English name of the country
-- 
-- __is_hidden__ True, if the country must be hidden from the list of all countries
-- 
-- __calling_codes__ List of country calling codes
data CountryInfo = 

 CountryInfo { calling_codes :: Maybe [String], is_hidden :: Maybe Bool, english_name :: Maybe String, name :: Maybe String, country_code :: Maybe String }  deriving (Eq)

instance Show CountryInfo where
 show CountryInfo { calling_codes=calling_codes, is_hidden=is_hidden, english_name=english_name, name=name, country_code=country_code } =
  "CountryInfo" ++ U.cc [U.p "calling_codes" calling_codes, U.p "is_hidden" is_hidden, U.p "english_name" english_name, U.p "name" name, U.p "country_code" country_code ]

instance T.ToJSON CountryInfo where
 toJSON CountryInfo { calling_codes = calling_codes, is_hidden = is_hidden, english_name = english_name, name = name, country_code = country_code } =
  A.object [ "@type" A..= T.String "countryInfo", "calling_codes" A..= calling_codes, "is_hidden" A..= is_hidden, "english_name" A..= english_name, "name" A..= name, "country_code" A..= country_code ]

instance T.FromJSON CountryInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "countryInfo" -> parseCountryInfo v
   _ -> mempty
  where
   parseCountryInfo :: A.Value -> T.Parser CountryInfo
   parseCountryInfo = A.withObject "CountryInfo" $ \o -> do
    calling_codes <- o A..:? "calling_codes"
    is_hidden <- o A..:? "is_hidden"
    english_name <- o A..:? "english_name"
    name <- o A..:? "name"
    country_code <- o A..:? "country_code"
    return $ CountryInfo { calling_codes = calling_codes, is_hidden = is_hidden, english_name = english_name, name = name, country_code = country_code }
 parseJSON _ = mempty
