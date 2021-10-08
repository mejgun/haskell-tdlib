-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputThumbnail where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- A thumbnail to be sent along with a file; must be in JPEG or WEBP format for stickers, and less than 200 KB in size
-- 
-- __thumbnail__ Thumbnail file to send. Sending thumbnails by file_id is currently not supported
-- 
-- __width__ Thumbnail width, usually shouldn't exceed 320. Use 0 if unknown
-- 
-- __height__ Thumbnail height, usually shouldn't exceed 320. Use 0 if unknown
data InputThumbnail = 

 InputThumbnail { height :: Maybe Int, width :: Maybe Int, thumbnail :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show InputThumbnail where
 show InputThumbnail { height=height, width=width, thumbnail=thumbnail } =
  "InputThumbnail" ++ cc [p "height" height, p "width" width, p "thumbnail" thumbnail ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputThumbnail where
 toJSON InputThumbnail { height = height, width = width, thumbnail = thumbnail } =
  A.object [ "@type" A..= T.String "inputThumbnail", "height" A..= height, "width" A..= width, "thumbnail" A..= thumbnail ]

instance T.FromJSON InputThumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputThumbnail" -> parseInputThumbnail v
   _ -> mempty
  where
   parseInputThumbnail :: A.Value -> T.Parser InputThumbnail
   parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail <- o A..:? "thumbnail"
    return $ InputThumbnail { height = height, width = width, thumbnail = thumbnail }
 parseJSON _ = mempty
