-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMapThumbnailFile where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Location as Location

data GetMapThumbnailFile = 
 GetMapThumbnailFile { chat_id :: Maybe Int, scale :: Maybe Int, height :: Maybe Int, width :: Maybe Int, zoom :: Maybe Int, location :: Maybe Location.Location }  deriving (Show)

instance T.ToJSON GetMapThumbnailFile where
 toJSON (GetMapThumbnailFile { chat_id = chat_id, scale = scale, height = height, width = width, zoom = zoom, location = location }) =
  A.object [ "@type" A..= T.String "getMapThumbnailFile", "chat_id" A..= chat_id, "scale" A..= scale, "height" A..= height, "width" A..= width, "zoom" A..= zoom, "location" A..= location ]

instance T.FromJSON GetMapThumbnailFile where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMapThumbnailFile" -> parseGetMapThumbnailFile v
   _ -> mempty
  where
   parseGetMapThumbnailFile :: A.Value -> T.Parser GetMapThumbnailFile
   parseGetMapThumbnailFile = A.withObject "GetMapThumbnailFile" $ \o -> do
    chat_id <- optional $ o A..: "chat_id"
    scale <- optional $ o A..: "scale"
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    zoom <- optional $ o A..: "zoom"
    location <- optional $ o A..: "location"
    return $ GetMapThumbnailFile { chat_id = chat_id, scale = scale, height = height, width = width, zoom = zoom, location = location }