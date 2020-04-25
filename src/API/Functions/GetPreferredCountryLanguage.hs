-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPreferredCountryLanguage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPreferredCountryLanguage = 
 GetPreferredCountryLanguage { country_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON GetPreferredCountryLanguage where
 toJSON (GetPreferredCountryLanguage { country_code = country_code }) =
  A.object [ "@type" A..= T.String "getPreferredCountryLanguage", "country_code" A..= country_code ]

instance T.FromJSON GetPreferredCountryLanguage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPreferredCountryLanguage" -> parseGetPreferredCountryLanguage v
   _ -> mempty
  where
   parseGetPreferredCountryLanguage :: A.Value -> T.Parser GetPreferredCountryLanguage
   parseGetPreferredCountryLanguage = A.withObject "GetPreferredCountryLanguage" $ \o -> do
    country_code <- o A..:? "country_code"
    return $ GetPreferredCountryLanguage { country_code = country_code }