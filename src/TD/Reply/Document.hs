{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Document where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.File as File
import qualified TD.Reply.Minithumbnail as Minithumbnail
import qualified TD.Reply.Thumbnail as Thumbnail
import qualified Utils as U

data Document = -- | Describes a document of any type @file_name Original name of the file; as defined by the sender @mime_type MIME type of the file; as defined by the sender
  Document
  { -- |
    document :: Maybe File.File,
    -- |
    thumbnail :: Maybe Thumbnail.Thumbnail,
    -- | Document minithumbnail; may be null @thumbnail Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null @document File containing the document
    minithumbnail :: Maybe Minithumbnail.Minithumbnail,
    -- |
    mime_type :: Maybe String,
    -- |
    file_name :: Maybe String
  }
  deriving (Eq)

instance Show Document where
  show
    Document
      { document = document,
        thumbnail = thumbnail,
        minithumbnail = minithumbnail,
        mime_type = mime_type,
        file_name = file_name
      } =
      "Document"
        ++ U.cc
          [ U.p "document" document,
            U.p "thumbnail" thumbnail,
            U.p "minithumbnail" minithumbnail,
            U.p "mime_type" mime_type,
            U.p "file_name" file_name
          ]

instance T.FromJSON Document where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "document" -> parseDocument v
      _ -> fail ""
    where
      parseDocument :: A.Value -> T.Parser Document
      parseDocument = A.withObject "Document" $ \o -> do
        document_ <- o A..:? "document"
        thumbnail_ <- o A..:? "thumbnail"
        minithumbnail_ <- o A..:? "minithumbnail"
        mime_type_ <- o A..:? "mime_type"
        file_name_ <- o A..:? "file_name"
        return $ Document {document = document_, thumbnail = thumbnail_, minithumbnail = minithumbnail_, mime_type = mime_type_, file_name = file_name_}
  parseJSON _ = fail ""

instance T.ToJSON Document where
  toJSON
    Document
      { document = document,
        thumbnail = thumbnail,
        minithumbnail = minithumbnail,
        mime_type = mime_type,
        file_name = file_name
      } =
      A.object
        [ "@type" A..= T.String "document",
          "document" A..= document,
          "thumbnail" A..= thumbnail,
          "minithumbnail" A..= minithumbnail,
          "mime_type" A..= mime_type,
          "file_name" A..= file_name
        ]
