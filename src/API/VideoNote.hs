-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VideoNote where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes a video note. The video must be equal in width and height, cropped to a circle, and stored in MPEG4 format 
-- 
-- __duration__ Duration of the video, in seconds; as defined by the sender
-- 
-- __length__ Video width and height; as defined by the sender
-- 
-- __minithumbnail__ Video minithumbnail; may be null
-- 
-- __thumbnail__ Video thumbnail in JPEG format; as defined by the sender; may be null
-- 
-- __video__ File containing the video
data VideoNote = 

 VideoNote { video :: Maybe File.File, thumbnail :: Maybe Thumbnail.Thumbnail, minithumbnail :: Maybe Minithumbnail.Minithumbnail, _length :: Maybe Int, duration :: Maybe Int }  deriving (Eq)

instance Show VideoNote where
 show VideoNote { video=video, thumbnail=thumbnail, minithumbnail=minithumbnail, _length=_length, duration=duration } =
  "VideoNote" ++ cc [p "video" video, p "thumbnail" thumbnail, p "minithumbnail" minithumbnail, p "_length" _length, p "duration" duration ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON VideoNote where
 toJSON VideoNote { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, _length = _length, duration = duration } =
  A.object [ "@type" A..= T.String "videoNote", "video" A..= video, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "length" A..= _length, "duration" A..= duration ]

instance T.FromJSON VideoNote where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "videoNote" -> parseVideoNote v
   _ -> mempty
  where
   parseVideoNote :: A.Value -> T.Parser VideoNote
   parseVideoNote = A.withObject "VideoNote" $ \o -> do
    video <- o A..:? "video"
    thumbnail <- o A..:? "thumbnail"
    minithumbnail <- o A..:? "minithumbnail"
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ VideoNote { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, _length = _length, duration = duration }
 parseJSON _ = mempty
