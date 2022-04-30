-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Minithumbnail where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Thumbnail image of a very poor quality and low resolution 
-- 
-- __width__ Thumbnail width, usually doesn't exceed 40
-- 
-- __height__ Thumbnail height, usually doesn't exceed 40
-- 
-- __data__ The thumbnail in JPEG format
data Minithumbnail = 

 Minithumbnail { _data :: Maybe String, height :: Maybe Int, width :: Maybe Int }  deriving (Eq)

instance Show Minithumbnail where
 show Minithumbnail { _data=_data, height=height, width=width } =
  "Minithumbnail" ++ U.cc [U.p "_data" _data, U.p "height" height, U.p "width" width ]

instance T.ToJSON Minithumbnail where
 toJSON Minithumbnail { _data = _data, height = height, width = width } =
  A.object [ "@type" A..= T.String "minithumbnail", "data" A..= _data, "height" A..= height, "width" A..= width ]

instance T.FromJSON Minithumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "minithumbnail" -> parseMinithumbnail v
   _ -> mempty
  where
   parseMinithumbnail :: A.Value -> T.Parser Minithumbnail
   parseMinithumbnail = A.withObject "Minithumbnail" $ \o -> do
    _data <- o A..:? "data"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Minithumbnail { _data = _data, height = height, width = width }
 parseJSON _ = mempty
