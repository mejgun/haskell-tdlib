-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhotoSize where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

data PhotoSize = 
 PhotoSize { height :: Int, width :: Int, photo :: File.File, _type :: String }  deriving (Show)

instance T.ToJSON PhotoSize where
 toJSON (PhotoSize { height = height, width = width, photo = photo, _type = _type }) =
  A.object [ "@type" A..= T.String "photoSize", "height" A..= height, "width" A..= width, "photo" A..= photo, "type" A..= _type ]

instance T.FromJSON PhotoSize where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "photoSize" -> parsePhotoSize v
   _ -> mempty
  where
   parsePhotoSize :: A.Value -> T.Parser PhotoSize
   parsePhotoSize = A.withObject "PhotoSize" $ \o -> do
    height <- o A..: "height"
    width <- o A..: "width"
    photo <- o A..: "photo"
    _type <- o A..: "type"
    return $ PhotoSize { height = height, width = width, photo = photo, _type = _type }