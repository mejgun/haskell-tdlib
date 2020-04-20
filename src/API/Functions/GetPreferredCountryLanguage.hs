-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPreferredCountryLanguage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPreferredCountryLanguage = 
 GetPreferredCountryLanguage { country_code :: String }  -- deriving (Show)

instance T.ToJSON GetPreferredCountryLanguage where
 toJSON (GetPreferredCountryLanguage { country_code = country_code }) =
  A.object [ "@type" A..= T.String "getPreferredCountryLanguage", "country_code" A..= country_code ]
-- getPreferredCountryLanguage GetPreferredCountryLanguage  { country_code :: String } 

