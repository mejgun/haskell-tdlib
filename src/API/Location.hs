-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Location where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    longitude <- optional $ o A..: "longitude"
    latitude <- optional $ o A..: "latitude"
    return $ Location { longitude = longitude, latitude = latitude }