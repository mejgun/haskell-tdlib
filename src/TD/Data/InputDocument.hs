module TD.Data.InputDocument
  ( InputDocument(..)    
  , defaultInputDocument 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputDocument
  = InputDocument -- ^ A document (general file) to be sent
    { document                       :: Maybe InputFile.InputFile           -- ^ File to be sent
    , thumbnail                      :: Maybe InputThumbnail.InputThumbnail -- ^ Document thumbnail; pass null to skip thumbnail uploading
    , disable_content_type_detection :: Maybe Bool                          -- ^ Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats
    }
  deriving (Eq, Show)

instance I.ShortShow InputDocument where
  shortShow InputDocument
    { document                       = document_
    , thumbnail                      = thumbnail_
    , disable_content_type_detection = disable_content_type_detection_
    }
      = "InputDocument"
        ++ I.cc
        [ "document"                       `I.p` document_
        , "thumbnail"                      `I.p` thumbnail_
        , "disable_content_type_detection" `I.p` disable_content_type_detection_
        ]

instance AT.FromJSON InputDocument where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputDocument" -> parseInputDocument v
      _               -> mempty
    
    where
      parseInputDocument :: A.Value -> AT.Parser InputDocument
      parseInputDocument = A.withObject "InputDocument" $ \o -> do
        document_                       <- o A..:?  "document"
        thumbnail_                      <- o A..:?  "thumbnail"
        disable_content_type_detection_ <- o A..:?  "disable_content_type_detection"
        pure $ InputDocument
          { document                       = document_
          , thumbnail                      = thumbnail_
          , disable_content_type_detection = disable_content_type_detection_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputDocument where
  toJSON InputDocument
    { document                       = document_
    , thumbnail                      = thumbnail_
    , disable_content_type_detection = disable_content_type_detection_
    }
      = A.object
        [ "@type"                          A..= AT.String "inputDocument"
        , "document"                       A..= document_
        , "thumbnail"                      A..= thumbnail_
        , "disable_content_type_detection" A..= disable_content_type_detection_
        ]

defaultInputDocument :: InputDocument
defaultInputDocument =
  InputDocument
    { document                       = Nothing
    , thumbnail                      = Nothing
    , disable_content_type_detection = Nothing
    }

