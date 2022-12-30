{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Document where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.File as File
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified Utils as U

-- |
data Document = -- | Describes a document of any type
  Document
  { -- | File containing the document
    document :: Maybe File.File,
    -- | Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Document minithumbnail; may be null
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- | MIME type of the file; as defined by the sender
    mime_type :: Maybe String,
    -- | Original name of the file; as defined by the sender
    file_name :: Maybe String
  }
  deriving (Eq)

instance Show Document where
  show
    Document
      { document = document_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        mime_type = mime_type_,
        file_name = file_name_
      } =
      "Document"
        ++ U.cc
          [ U.p "document" document_,
            U.p "thumbnail" thumbnail_,
            U.p "minithumbnail" minithumbnail_,
            U.p "mime_type" mime_type_,
            U.p "file_name" file_name_
          ]

instance T.FromJSON Document where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "document" -> parseDocument v
      _ -> mempty
    where
      parseDocument :: A.Value -> T.Parser Document
      parseDocument = A.withObject "Document" $ \o -> do
        document_ <- o A..:? "document"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        mime_type_ <- o A..:? "mime_type"
        file_name_ <- o A..:? "file_name"
        return $ Document {document = document_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, mime_type = mime_type_, file_name = file_name_}
  parseJSON _ = mempty

instance T.ToJSON Document where
  toJSON
    Document
      { document = document_,
        thumbnail = thumbnail_,
        minithumbnail = minithumbnail_,
        mime_type = mime_type_,
        file_name = file_name_
      } =
      A.object
        [ "@type" A..= T.String "document",
          "document" A..= document_,
          "thumbnail" A..= thumbnail_,
          "minithumbnail" A..= minithumbnail_,
          "mime_type" A..= mime_type_,
          "file_name" A..= file_name_
        ]
