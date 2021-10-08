-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Countries where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.CountryInfo as CountryInfo

-- |
-- 
-- Contains information about countries 
-- 
-- __countries__ The list of countries
data Countries = 

 Countries { countries :: Maybe [CountryInfo.CountryInfo] }  deriving (Eq)

instance Show Countries where
 show Countries { countries=countries } =
  "Countries" ++ cc [p "countries" countries ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Countries where
 toJSON Countries { countries = countries } =
  A.object [ "@type" A..= T.String "countries", "countries" A..= countries ]

instance T.FromJSON Countries where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "countries" -> parseCountries v
   _ -> mempty
  where
   parseCountries :: A.Value -> T.Parser Countries
   parseCountries = A.withObject "Countries" $ \o -> do
    countries <- o A..:? "countries"
    return $ Countries { countries = countries }
 parseJSON _ = mempty
