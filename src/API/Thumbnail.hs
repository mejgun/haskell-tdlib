-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Thumbnail where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.ThumbnailFormat as ThumbnailFormat

-- |
-- 
-- Represents a thumbnail 
-- 
-- __format__ Thumbnail format
-- 
-- __width__ Thumbnail width
-- 
-- __height__ Thumbnail height
-- 
-- __file__ The thumbnail
data Thumbnail = 

 Thumbnail { file :: Maybe File.File, height :: Maybe Int, width :: Maybe Int, format :: Maybe ThumbnailFormat.ThumbnailFormat }  deriving (Eq)

instance Show Thumbnail where
 show Thumbnail { file=file, height=height, width=width, format=format } =
  "Thumbnail" ++ U.cc [U.p "file" file, U.p "height" height, U.p "width" width, U.p "format" format ]

instance T.ToJSON Thumbnail where
 toJSON Thumbnail { file = file, height = height, width = width, format = format } =
  A.object [ "@type" A..= T.String "thumbnail", "file" A..= file, "height" A..= height, "width" A..= width, "format" A..= format ]

instance T.FromJSON Thumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "thumbnail" -> parseThumbnail v
   _ -> mempty
  where
   parseThumbnail :: A.Value -> T.Parser Thumbnail
   parseThumbnail = A.withObject "Thumbnail" $ \o -> do
    file <- o A..:? "file"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    format <- o A..:? "format"
    return $ Thumbnail { file = file, height = height, width = width, format = format }
 parseJSON _ = mempty
