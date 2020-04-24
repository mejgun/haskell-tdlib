-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputThumbnail where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data InputThumbnail = 
 InputThumbnail { height :: Maybe Int, width :: Maybe Int, thumbnail :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON InputThumbnail where
 toJSON (InputThumbnail { height = height, width = width, thumbnail = thumbnail }) =
  A.object [ "@type" A..= T.String "inputThumbnail", "height" A..= height, "width" A..= width, "thumbnail" A..= thumbnail ]

instance T.FromJSON InputThumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputThumbnail" -> parseInputThumbnail v
   _ -> mempty
  where
   parseInputThumbnail :: A.Value -> T.Parser InputThumbnail
   parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
    height <- optional $ o A..: "height"
    width <- optional $ o A..: "width"
    thumbnail <- optional $ o A..: "thumbnail"
    return $ InputThumbnail { height = height, width = width, thumbnail = thumbnail }