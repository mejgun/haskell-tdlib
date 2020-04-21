-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Minithumbnail where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Minithumbnail = 
 Minithumbnail { _data :: String, height :: Int, width :: Int }  deriving (Show)

instance T.ToJSON Minithumbnail where
 toJSON (Minithumbnail { _data = _data, height = height, width = width }) =
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
    _data <- o A..: "data"
    height <- o A..: "height"
    width <- o A..: "width"
    return $ Minithumbnail { _data = _data, height = height, width = width }