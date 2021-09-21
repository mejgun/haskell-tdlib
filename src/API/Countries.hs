-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Countries where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.CountryInfo as CountryInfo

-- |
-- 
-- Contains information about countries 
-- 
-- __countries__ The list of countries
data Countries = 

 Countries { countries :: Maybe [CountryInfo.CountryInfo] }  deriving (Show, Eq)

instance T.ToJSON Countries where
 toJSON (Countries { countries = countries }) =
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