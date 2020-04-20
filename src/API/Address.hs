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

