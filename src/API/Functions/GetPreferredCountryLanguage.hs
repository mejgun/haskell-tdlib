-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPreferredCountryLanguage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns an IETF language tag of the language preferred in the country, which must be used to fill native fields in Telegram Passport personal details. Returns a 404 error if unknown 
-- 
-- __country_code__ A two-letter ISO 3166-1 alpha-2 country code
data GetPreferredCountryLanguage = 

 GetPreferredCountryLanguage { country_code :: Maybe String }  deriving (Eq)

instance Show GetPreferredCountryLanguage where
 show GetPreferredCountryLanguage { country_code=country_code } =
  "GetPreferredCountryLanguage" ++ cc [p "country_code" country_code ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetPreferredCountryLanguage where
 toJSON GetPreferredCountryLanguage { country_code = country_code } =
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
 parseJSON _ = mempty
