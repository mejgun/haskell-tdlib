-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Text where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data Text = 
 Text { text :: String }  deriving (Show)

instance T.ToJSON Text where
 toJSON (Text { text = text }) =
  A.object [ "@type" A..= T.String "text", "text" A..= text ]

instance T.FromJSON Text where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "text" -> parseText v
   _ -> mempty
  where
   parseText :: A.Value -> T.Parser Text
   parseText = A.withObject "Text" $ \o -> do
    text <- o A..: "text"
    return $ Text { text = text }