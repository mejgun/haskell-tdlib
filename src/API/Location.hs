-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Location where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data Location = 
 Location { longitude :: Float, latitude :: Float }  -- deriving (Show)

instance T.ToJSON Location where
 toJSON (Location { longitude = longitude, latitude = latitude }) =
  A.object [ "@type" A..= T.String "location", "longitude" A..= longitude, "latitude" A..= latitude ]
-- location Location  { longitude :: Float, latitude :: Float } 

