-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Address where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Address = 
 Address { postal_code :: String, street_line2 :: String, street_line1 :: String, city :: String, state :: String, country_code :: String }  -- deriving (Show)

instance T.ToJSON Address where
 toJSON (Address { postal_code = postal_code, street_line2 = street_line2, street_line1 = street_line1, city = city, state = state, country_code = country_code }) =
  A.object [ "@type" A..= T.String "address", "postal_code" A..= postal_code, "street_line2" A..= street_line2, "street_line1" A..= street_line1, "city" A..= city, "state" A..= state, "country_code" A..= country_code ]
-- address Address  { postal_code :: String, street_line2 :: String, street_line1 :: String, city :: String, state :: String, country_code :: String } 



instance T.FromJSON Address where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "address" -> parseAddress v
  where
   parseAddress :: A.Value -> T.Parser Address
   parseAddress = A.withObject "Address" $ \o -> do
    postal_code <- o A..: "postal_code"
    street_line2 <- o A..: "street_line2"
    street_line1 <- o A..: "street_line1"
    city <- o A..: "city"
    state <- o A..: "state"
    country_code <- o A..: "country_code"
    return $ Address { postal_code = postal_code, street_line2 = street_line2, street_line1 = street_line1, city = city, state = state, country_code = country_code }