-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.VideoNote where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data VideoNote = 
 VideoNote { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, _length :: Int, duration :: Int }  -- deriving (Show)

instance T.ToJSON VideoNote where
 toJSON (VideoNote { video = video, thumbnail = thumbnail, minithumbnail = minithumbnail, _length = _length, duration = duration }) =
  A.object [ "@type" A..= T.String "videoNote", "video" A..= video, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "length" A..= _length, "duration" A..= duration ]
-- videoNote VideoNote  { video :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, _length :: Int, duration :: Int } 

