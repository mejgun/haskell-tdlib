-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data Animation = 
 Animation { animation :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String, height :: Int, width :: Int, duration :: Int }  -- deriving (Show)

instance T.ToJSON Animation where
 toJSON (Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }) =
  A.object [ "@type" A..= T.String "animation", "animation" A..= animation, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]
-- animation Animation  { animation :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String, height :: Int, width :: Int, duration :: Int } 



instance T.FromJSON Animation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animation" -> parseAnimation v
  where
   parseAnimation :: A.Value -> T.Parser Animation
   parseAnimation = A.withObject "Animation" $ \o -> do
    animation <- o A..: "animation"
    thumbnail <- o A..: "thumbnail"
    minithumbnail <- o A..: "minithumbnail"
    mime_type <- o A..: "mime_type"
    file_name <- o A..: "file_name"
    height <- o A..: "height"
    width <- o A..: "width"
    duration <- o A..: "duration"
    return $ Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }