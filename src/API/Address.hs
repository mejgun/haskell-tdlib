-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Address where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes an address 
-- 
-- __country_code__ A two-letter ISO 3166-1 alpha-2 country code
-- 
-- __state__ State, if applicable
-- 
-- __city__ City
-- 
-- __street_line1__ First line of the address
-- 
-- __street_line2__ Second line of the address
-- 
-- __postal_code__ Address postal code
data Address = 

 Address { postal_code :: Maybe String, street_line2 :: Maybe String, street_line1 :: Maybe String, city :: Maybe String, state :: Maybe String, country_code :: Maybe String }  deriving (Eq)

instance Show Address where
 show Address { postal_code=postal_code, street_line2=street_line2, street_line1=street_line1, city=city, state=state, country_code=country_code } =
  "Address" ++ U.cc [U.p "postal_code" postal_code, U.p "street_line2" street_line2, U.p "street_line1" street_line1, U.p "city" city, U.p "state" state, U.p "country_code" country_code ]

instance T.ToJSON Address where
 toJSON Address { postal_code = postal_code, street_line2 = street_line2, street_line1 = street_line1, city = city, state = state, country_code = country_code } =
  A.object [ "@type" A..= T.String "address", "postal_code" A..= postal_code, "street_line2" A..= street_line2, "street_line1" A..= street_line1, "city" A..= city, "state" A..= state, "country_code" A..= country_code ]

instance T.FromJSON Address where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "address" -> parseAddress v
   _ -> mempty
  where
   parseAddress :: A.Value -> T.Parser Address
   parseAddress = A.withObject "Address" $ \o -> do
    postal_code <- o A..:? "postal_code"
    street_line2 <- o A..:? "street_line2"
    street_line1 <- o A..:? "street_line1"
    city <- o A..:? "city"
    state <- o A..:? "state"
    country_code <- o A..:? "country_code"
    return $ Address { postal_code = postal_code, street_line2 = street_line2, street_line1 = street_line1, city = city, state = state, country_code = country_code }
 parseJSON _ = mempty
