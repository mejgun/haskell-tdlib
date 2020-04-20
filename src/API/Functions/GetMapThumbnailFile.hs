-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMapThumbnailFile where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

--main = putStrLn "ok"

data GetMapThumbnailFile = 
 GetMapThumbnailFile { chat_id :: Int, scale :: Int, height :: Int, width :: Int, zoom :: Int, location :: Location.Location }  -- deriving (Show)

instance T.ToJSON GetMapThumbnailFile where
 toJSON (GetMapThumbnailFile { chat_id = chat_id, scale = scale, height = height, width = width, zoom = zoom, location = location }) =
  A.object [ "@type" A..= T.String "getMapThumbnailFile", "chat_id" A..= chat_id, "scale" A..= scale, "height" A..= height, "width" A..= width, "zoom" A..= zoom, "location" A..= location ]
-- getMapThumbnailFile GetMapThumbnailFile  { chat_id :: Int, scale :: Int, height :: Int, width :: Int, zoom :: Int, location :: Location.Location } 

