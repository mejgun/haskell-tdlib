module TD.Data.InputFile
  (InputFile(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Points to a file
data InputFile
  = InputFileId -- ^ A file defined by its unique identifier
    { _id :: Maybe Int -- ^ Unique file identifier
    }
  | InputFileRemote -- ^ A file defined by its remote identifier. The remote identifier is guaranteed to be usable only if the corresponding file is still accessible to the user and known to TDLib. For example, if the file is from a message, then the message must be not deleted and accessible to the user. If the file database is disabled, then the corresponding object with the file must be preloaded by the application
    { __id :: Maybe T.Text -- ^ Remote file identifier
    }
  | InputFileLocal -- ^ A file defined by a local path
    { path :: Maybe T.Text -- ^ Local path to the file
    }
  | InputFileGenerated -- ^ A file generated by the application. The application must handle updates updateFileGenerationStart and updateFileGenerationStop to generate the file when asked by TDLib
    { original_path :: Maybe T.Text -- ^ Local path to a file from which the file is generated. The path doesn't have to be a valid path and is used by TDLib only to detect name and MIME type of the generated file
    , conversion    :: Maybe T.Text -- ^ String specifying the conversion applied to the original file; must be persistent across application restarts. Conversions beginning with '#' are reserved for internal TDLib usage
    , expected_size :: Maybe Int    -- ^ Expected size of the generated file, in bytes; pass 0 if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow InputFile where
  shortShow InputFileId
    { _id = _id_
    }
      = "InputFileId"
        ++ I.cc
        [ "_id" `I.p` _id_
        ]
  shortShow InputFileRemote
    { __id = __id_
    }
      = "InputFileRemote"
        ++ I.cc
        [ "__id" `I.p` __id_
        ]
  shortShow InputFileLocal
    { path = path_
    }
      = "InputFileLocal"
        ++ I.cc
        [ "path" `I.p` path_
        ]
  shortShow InputFileGenerated
    { original_path = original_path_
    , conversion    = conversion_
    , expected_size = expected_size_
    }
      = "InputFileGenerated"
        ++ I.cc
        [ "original_path" `I.p` original_path_
        , "conversion"    `I.p` conversion_
        , "expected_size" `I.p` expected_size_
        ]

instance AT.FromJSON InputFile where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputFileId"        -> parseInputFileId v
      "inputFileRemote"    -> parseInputFileRemote v
      "inputFileLocal"     -> parseInputFileLocal v
      "inputFileGenerated" -> parseInputFileGenerated v
      _                    -> mempty
    
    where
      parseInputFileId :: A.Value -> AT.Parser InputFile
      parseInputFileId = A.withObject "InputFileId" $ \o -> do
        _id_ <- o A..:?  "id"
        pure $ InputFileId
          { _id = _id_
          }
      parseInputFileRemote :: A.Value -> AT.Parser InputFile
      parseInputFileRemote = A.withObject "InputFileRemote" $ \o -> do
        __id_ <- o A..:?  "id"
        pure $ InputFileRemote
          { __id = __id_
          }
      parseInputFileLocal :: A.Value -> AT.Parser InputFile
      parseInputFileLocal = A.withObject "InputFileLocal" $ \o -> do
        path_ <- o A..:?  "path"
        pure $ InputFileLocal
          { path = path_
          }
      parseInputFileGenerated :: A.Value -> AT.Parser InputFile
      parseInputFileGenerated = A.withObject "InputFileGenerated" $ \o -> do
        original_path_ <- o A..:?  "original_path"
        conversion_    <- o A..:?  "conversion"
        expected_size_ <- o A..:?  "expected_size"
        pure $ InputFileGenerated
          { original_path = original_path_
          , conversion    = conversion_
          , expected_size = expected_size_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputFile where
  toJSON InputFileId
    { _id = _id_
    }
      = A.object
        [ "@type" A..= AT.String "inputFileId"
        , "id"    A..= _id_
        ]
  toJSON InputFileRemote
    { __id = __id_
    }
      = A.object
        [ "@type" A..= AT.String "inputFileRemote"
        , "id"    A..= __id_
        ]
  toJSON InputFileLocal
    { path = path_
    }
      = A.object
        [ "@type" A..= AT.String "inputFileLocal"
        , "path"  A..= path_
        ]
  toJSON InputFileGenerated
    { original_path = original_path_
    , conversion    = conversion_
    , expected_size = expected_size_
    }
      = A.object
        [ "@type"         A..= AT.String "inputFileGenerated"
        , "original_path" A..= original_path_
        , "conversion"    A..= conversion_
        , "expected_size" A..= expected_size_
        ]

