-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PhotoSize where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.File as File

-- |
-- 
-- Describes an image in JPEG format 
-- 
-- __type__ Image type (see https://core.telegram.org/constructor/photoSize)
-- 
-- __photo__ Information about the image file
-- 
-- __width__ Image width
-- 
-- __height__ Image height
-- 
-- __progressive_sizes__ Sizes of progressive JPEG file prefixes, which can be used to preliminarily show the image; in bytes
data PhotoSize = 

 PhotoSize { progressive_sizes :: Maybe [Int], height :: Maybe Int, width :: Maybe Int, photo :: Maybe File.File, _type :: Maybe String }  deriving (Eq)

instance Show PhotoSize where
 show PhotoSize { progressive_sizes=progressive_sizes, height=height, width=width, photo=photo, _type=_type } =
  "PhotoSize" ++ cc [p "progressive_sizes" progressive_sizes, p "height" height, p "width" width, p "photo" photo, p "_type" _type ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PhotoSize where
 toJSON PhotoSize { progressive_sizes = progressive_sizes, height = height, width = width, photo = photo, _type = _type } =
  A.object [ "@type" A..= T.String "photoSize", "progressive_sizes" A..= progressive_sizes, "height" A..= height, "width" A..= width, "photo" A..= photo, "type" A..= _type ]

instance T.FromJSON PhotoSize where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "photoSize" -> parsePhotoSize v
   _ -> mempty
  where
   parsePhotoSize :: A.Value -> T.Parser PhotoSize
   parsePhotoSize = A.withObject "PhotoSize" $ \o -> do
    progressive_sizes <- o A..:? "progressive_sizes"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo <- o A..:? "photo"
    _type <- o A..:? "type"
    return $ PhotoSize { progressive_sizes = progressive_sizes, height = height, width = width, photo = photo, _type = _type }
 parseJSON _ = mempty
