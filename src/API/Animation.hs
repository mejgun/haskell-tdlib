-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Animation where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

data Animation = 
 Animation { animation :: Maybe File.File, thumbnail :: Maybe PhotoSize.PhotoSize, minithumbnail :: Maybe Minithumbnail.Minithumbnail, mime_type :: Maybe String, file_name :: Maybe String, height :: Maybe Int, width :: Maybe Int, duration :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Animation where
 toJSON (Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }) =
  A.object [ "@type" A..= T.String "animation", "animation" A..= animation, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name, "height" A..= height, "width" A..= width, "duration" A..= duration ]

instance T.FromJSON Animation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "animation" -> parseAnimation v
   _ -> mempty
  where
   parseAnimation :: A.Value -> T.Parser Animation
   parseAnimation = A.withObject "Animation" $ \o -> do
    animation <- optional $ o A..: "animation"
    thumbnail <- optional $ o A..: "thumbnail"
    minithumbnail <- optional $ o A..: "minithumbnail"
    mime_type <- optional $ o A..: "mime_type"
    file_name <- optional $ o A..: "file_name"
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    duration <- optional $ o A..: "duration"
    return $ Animation { animation = animation, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name, height = height, width = width, duration = duration }