-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMapThumbnailFile where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.Location as Location

-- |
-- 
-- Returns information about a file with a map thumbnail in PNG format. Only map thumbnail files with size less than 1MB can be downloaded 
-- 
-- __location__ Location of the map center
-- 
-- __zoom__ Map zoom level; 13-20
-- 
-- __width__ Map width in pixels before applying scale; 16-1024
-- 
-- __height__ Map height in pixels before applying scale; 16-1024
-- 
-- __scale__ Map scale; 1-3
-- 
-- __chat_id__ Identifier of a chat, in which the thumbnail will be shown. Use 0 if unknown
data GetMapThumbnailFile = 

 GetMapThumbnailFile { chat_id :: Maybe Int, scale :: Maybe Int, height :: Maybe Int, width :: Maybe Int, zoom :: Maybe Int, location :: Maybe Location.Location }  deriving (Eq)

instance Show GetMapThumbnailFile where
 show GetMapThumbnailFile { chat_id=chat_id, scale=scale, height=height, width=width, zoom=zoom, location=location } =
  "GetMapThumbnailFile" ++ cc [p "chat_id" chat_id, p "scale" scale, p "height" height, p "width" width, p "zoom" zoom, p "location" location ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMapThumbnailFile where
 toJSON GetMapThumbnailFile { chat_id = chat_id, scale = scale, height = height, width = width, zoom = zoom, location = location } =
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
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    scale <- mconcat [ o A..:? "scale", readMaybe <$> (o A..: "scale" :: T.Parser String)] :: T.Parser (Maybe Int)
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    zoom <- mconcat [ o A..:? "zoom", readMaybe <$> (o A..: "zoom" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    return $ GetMapThumbnailFile { chat_id = chat_id, scale = scale, height = height, width = width, zoom = zoom, location = location }
 parseJSON _ = mempty
