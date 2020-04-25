-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Document where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.PhotoSize as PhotoSize
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

data Document = 
 Document { document :: Maybe File.File, thumbnail :: Maybe PhotoSize.PhotoSize, minithumbnail :: Maybe Minithumbnail.Minithumbnail, mime_type :: Maybe String, file_name :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON Document where
 toJSON (Document { document = document, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name }) =
  A.object [ "@type" A..= T.String "document", "document" A..= document, "thumbnail" A..= thumbnail, "minithumbnail" A..= minithumbnail, "mime_type" A..= mime_type, "file_name" A..= file_name ]

instance T.FromJSON Document where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "document" -> parseDocument v
   _ -> mempty
  where
   parseDocument :: A.Value -> T.Parser Document
   parseDocument = A.withObject "Document" $ \o -> do
    document <- o A..:? "document"
    thumbnail <- o A..:? "thumbnail"
    minithumbnail <- o A..:? "minithumbnail"
    mime_type <- o A..:? "mime_type"
    file_name <- o A..:? "file_name"
    return $ Document { document = document, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name }