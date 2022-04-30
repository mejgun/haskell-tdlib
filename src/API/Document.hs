-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Document where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.File as File
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail
import {-# SOURCE #-} qualified API.Minithumbnail as Minithumbnail

-- |
-- 
-- Describes a document of any type 
-- 
-- __file_name__ Original name of the file; as defined by the sender
-- 
-- __mime_type__ MIME type of the file; as defined by the sender
-- 
-- __minithumbnail__ Document minithumbnail; may be null
-- 
-- __thumbnail__ Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null
-- 
-- __document__ File containing the document
data Document = 

 Document { document :: Maybe File.File, thumbnail :: Maybe Thumbnail.Thumbnail, minithumbnail :: Maybe Minithumbnail.Minithumbnail, mime_type :: Maybe String, file_name :: Maybe String }  deriving (Eq)

instance Show Document where
 show Document { document=document, thumbnail=thumbnail, minithumbnail=minithumbnail, mime_type=mime_type, file_name=file_name } =
  "Document" ++ U.cc [U.p "document" document, U.p "thumbnail" thumbnail, U.p "minithumbnail" minithumbnail, U.p "mime_type" mime_type, U.p "file_name" file_name ]

instance T.ToJSON Document where
 toJSON Document { document = document, thumbnail = thumbnail, minithumbnail = minithumbnail, mime_type = mime_type, file_name = file_name } =
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
 parseJSON _ = mempty
