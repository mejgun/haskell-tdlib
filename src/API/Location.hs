-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Location where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a location on planet Earth 
-- 
-- __latitude__ Latitude of the location in degrees; as defined by the sender
-- 
-- __longitude__ Longitude of the location, in degrees; as defined by the sender
data Location = 

 Location { longitude :: Maybe Float, latitude :: Maybe Float }  deriving (Show, Eq)

instance T.ToJSON Location where
 toJSON (Location { longitude = longitude, latitude = latitude }) =
  A.object [ "@type" A..= T.String "location", "longitude" A..= longitude, "latitude" A..= latitude ]

instance T.FromJSON Location where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "location" -> parseLocation v
   _ -> mempty
  where
   parseLocation :: A.Value -> T.Parser Location
   parseLocation = A.withObject "Location" $ \o -> do
    longitude <- o A..:? "longitude"
    latitude <- o A..:? "latitude"
    return $ Location { longitude = longitude, latitude = latitude }