-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Address where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Address = 
 Address { postal_code :: Maybe String, street_line2 :: Maybe String, street_line1 :: Maybe String, city :: Maybe String, state :: Maybe String, country_code :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON Address where
 toJSON (Address { postal_code = postal_code, street_line2 = street_line2, street_line1 = street_line1, city = city, state = state, country_code = country_code }) =
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