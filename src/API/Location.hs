-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Location where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Location = 
 Location { longitude :: Float, latitude :: Float }  deriving (Show)

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
    longitude <- o A..: "longitude"
    latitude <- o A..: "latitude"
    return $ Location { longitude = longitude, latitude = latitude }