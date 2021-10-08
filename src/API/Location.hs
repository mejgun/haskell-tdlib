-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Location where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Describes a location on planet Earth 
-- 
-- __latitude__ Latitude of the location in degrees; as defined by the sender
-- 
-- __longitude__ Longitude of the location, in degrees; as defined by the sender
-- 
-- __horizontal_accuracy__ The estimated horizontal accuracy of the location, in meters; as defined by the sender. 0 if unknown
data Location = 

 Location { horizontal_accuracy :: Maybe Float, longitude :: Maybe Float, latitude :: Maybe Float }  deriving (Eq)

instance Show Location where
 show Location { horizontal_accuracy=horizontal_accuracy, longitude=longitude, latitude=latitude } =
  "Location" ++ cc [p "horizontal_accuracy" horizontal_accuracy, p "longitude" longitude, p "latitude" latitude ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Location where
 toJSON Location { horizontal_accuracy = horizontal_accuracy, longitude = longitude, latitude = latitude } =
  A.object [ "@type" A..= T.String "location", "horizontal_accuracy" A..= horizontal_accuracy, "longitude" A..= longitude, "latitude" A..= latitude ]

instance T.FromJSON Location where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "location" -> parseLocation v
   _ -> mempty
  where
   parseLocation :: A.Value -> T.Parser Location
   parseLocation = A.withObject "Location" $ \o -> do
    horizontal_accuracy <- o A..:? "horizontal_accuracy"
    longitude <- o A..:? "longitude"
    latitude <- o A..:? "latitude"
    return $ Location { horizontal_accuracy = horizontal_accuracy, longitude = longitude, latitude = latitude }
 parseJSON _ = mempty
