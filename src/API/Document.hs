-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Document where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

--main = putStrLn "ok"

data Document = 
 Document { document :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String }  -- deriving (Show)

instance T.ToJSON Document where
 toJSON (Document { document = document, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name }) =
  A.object [ "@type" A..= T.String "document", "document" A..= document, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name ]
-- document Document  { document :: File.File, thumbnail :: PhotoSize.PhotoSize, minithumbnail :: Minithumbnail.Minithumbnail, mime_type :: String, file_name :: String } 

