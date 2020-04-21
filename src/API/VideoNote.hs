-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VideoNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

data VideoNote = 
 VideoNote { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, _length :: Int, duration :: Int }  deriving (Show)

instance T.ToJSON VideoNote where
 toJSON (VideoNote { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, _length = _length, duration = duration }) =
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
    video <- o A..: "video"
    thumbnail <- o A..: "thumbnail"
    minithumbnail <- o A..: "minithumbnail"
    _length <- o A..: "length"
    duration <- o A..: "duration"
    return $ VideoNote { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, _length = _length, duration = duration }