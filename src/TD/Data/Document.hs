module TD.Data.Document
  ( Document(..)    
  , defaultDocument 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Minithumbnail as Minithumbnail
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.File as File

data Document
  = Document -- ^ Describes a document of any type
    { file_name     :: Maybe T.Text                      -- ^ Original name of the file; as defined by the sender
    , mime_type     :: Maybe T.Text                      -- ^ MIME type of the file; as defined by the sender
    , minithumbnail :: Maybe Minithumbnail.Minithumbnail -- ^ Document minithumbnail; may be null
    , thumbnail     :: Maybe Thumbnail.Thumbnail         -- ^ Document thumbnail in JPEG or PNG format (PNG will be used only for background patterns); as defined by the sender; may be null
    , document      :: Maybe File.File                   -- ^ File containing the document
    }
  deriving (Eq)

instance Show Document where
  show Document
    { file_name     = file_name_
    , mime_type     = mime_type_
    , minithumbnail = minithumbnail_
    , thumbnail     = thumbnail_
    , document      = document_
    }
      = "Document"
        ++ I.cc
        [ "file_name"     `I.p` file_name_
        , "mime_type"     `I.p` mime_type_
        , "minithumbnail" `I.p` minithumbnail_
        , "thumbnail"     `I.p` thumbnail_
        , "document"      `I.p` document_
        ]

instance AT.FromJSON Document where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "document" -> parseDocument v
      _          -> mempty
    
    where
      parseDocument :: A.Value -> AT.Parser Document
      parseDocument = A.withObject "Document" $ \o -> do
        file_name_     <- o A..:?  "file_name"
        mime_type_     <- o A..:?  "mime_type"
        minithumbnail_ <- o A..:?  "minithumbnail"
        thumbnail_     <- o A..:?  "thumbnail"
        document_      <- o A..:?  "document"
        pure $ Document
          { file_name     = file_name_
          , mime_type     = mime_type_
          , minithumbnail = minithumbnail_
          , thumbnail     = thumbnail_
          , document      = document_
          }
  parseJSON _ = mempty

instance AT.ToJSON Document where
  toJSON Document
    { file_name     = file_name_
    , mime_type     = mime_type_
    , minithumbnail = minithumbnail_
    , thumbnail     = thumbnail_
    , document      = document_
    }
      = A.object
        [ "@type"         A..= AT.String "document"
        , "file_name"     A..= file_name_
        , "mime_type"     A..= mime_type_
        , "minithumbnail" A..= minithumbnail_
        , "thumbnail"     A..= thumbnail_
        , "document"      A..= document_
        ]

defaultDocument :: Document
defaultDocument =
  Document
    { file_name     = Nothing
    , mime_type     = Nothing
    , minithumbnail = Nothing
    , thumbnail     = Nothing
    , document      = Nothing
    }

