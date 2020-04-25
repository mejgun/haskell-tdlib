-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhotoSize where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

data PhotoSize = 
 PhotoSize { height :: Maybe Int, width :: Maybe Int, photo :: Maybe File.File, _type :: Maybe String }  deriving (Show, Eq)

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
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo <- o A..:? "photo"
    _type <- o A..:? "type"
    return $ PhotoSize { height = height, width = width, photo = photo, _type = _type }