-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputThumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data InputThumbnail = 
 InputThumbnail { height :: Int, width :: Int, thumbnail :: InputFile.InputFile }  deriving (Show)

instance T.ToJSON InputThumbnail where
 toJSON (InputThumbnail { height = height, width = width, thumbnail = thumbnail }) =
  A.object [ "@type" A..= T.String "inputThumbnail", "height" A..= height, "width" A..= width, "thumbnail" A..= thumbnail ]



instance T.FromJSON InputThumbnail where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputThumbnail" -> parseInputThumbnail v

   _ -> mempty ""
  where
   parseInputThumbnail :: A.Value -> T.Parser InputThumbnail
   parseInputThumbnail = A.withObject "InputThumbnail" $ \o -> do
    height <- o A..: "height"
    width <- o A..: "width"
    thumbnail <- o A..: "thumbnail"
    return $ InputThumbnail { height = height, width = width, thumbnail = thumbnail }