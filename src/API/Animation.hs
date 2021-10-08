-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes an animation file. The animation must be encoded in GIF or MPEG4 format 
-- 
-- __duration__ Duration of the animation, in seconds; as defined by the sender
-- 
-- __width__ Width of the animation
-- 
-- __height__ Height of the animation
-- 
-- __file_name__ Original name of the file; as defined by the sender
-- 
-- __mime_type__ MIME type of the file, usually "image/gif" or "video/mp4"
-- 
-- __has_stickers__ True, if stickers were added to the animation. The list of corresponding sticker set can be received using getAttachedStickerSets
-- 
-- __minithumbnail__ Animation minithumbnail; may be null
-- 
-- __thumbnail__ Animation thumbnail in JPEG or MPEG4 format; may be null
-- 
-- __animation__ File containing the animation
data Animation = 

 Animation { animation :: Maybe File.File, thumbnail :: Maybe Thumbnail.Thumbnail, minithumbnail :: Maybe Minithumbnail.Minithumbnail, has_stickers :: Maybe Bool, mime_type :: Maybe String, file_name :: Maybe String, height :: Maybe Int, width :: Maybe Int, duration :: Maybe Int }  deriving (Eq)

instance Show Animation where
 show Animation { animation=animation, thumbnail=thumbnail, minithumbnail=minithumbnail, has_stickers=has_stickers, mime_type=mime_type, file_name=file_name, height=height, width=width, duration=duration } =
  "Animation" ++ cc [p "animation" animation, p "thumbnail" thumbnail, p "minithumbnail" minithumbnail, p "has_stickers" has_stickers, p "mime_type" mime_type, p "file_name" file_name, p "height" height, p "width" width, p "duration" duration ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Animation where
 toJSON Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration } =
  A.object [ "@type" A..= T.String "animation", "animation" A..= animation, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "has_stickers" A..= has_stickers, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]

instance T.FromJSON Animation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animation" -> parseAnimation v
   _ -> mempty
  where
   parseAnimation :: A.Value -> T.Parser Animation
   parseAnimation = A.withObject "Animation" $ \o -> do
    animation <- o A..:? "animation"
    thumbnail <- o A..:? "thumbnail"
    minithumbnail <- o A..:? "minithumbnail"
    has_stickers <- o A..:? "has_stickers"
    mime_type <- o A..:? "mime_type"
    file_name <- o A..:? "file_name"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, has_stickers = has_stickers, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }
 parseJSON _ = mempty
