module TD.Data.InputPassportElementErrorSource
  (InputPassportElementErrorSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.ByteString as BS
import qualified Data.Text as T

-- | Contains the description of an error in a Telegram Passport element; for bots only
data InputPassportElementErrorSource
  = InputPassportElementErrorSourceUnspecified -- ^ The element contains an error in an unspecified place. The error will be considered resolved when new data is added
    { element_hash :: Maybe BS.ByteString -- ^ Current hash of the entire element
    }
  | InputPassportElementErrorSourceDataField -- ^ A data field contains an error. The error is considered resolved when the field's value changes
    { field_name :: Maybe T.Text        -- ^ Field name
    , data_hash  :: Maybe BS.ByteString -- ^ Current data hash
    }
  | InputPassportElementErrorSourceFrontSide -- ^ The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes
    { file_hash :: Maybe BS.ByteString -- ^ Current hash of the file containing the front side
    }
  | InputPassportElementErrorSourceReverseSide -- ^ The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes
    { file_hash :: Maybe BS.ByteString -- ^ Current hash of the file containing the reverse side
    }
  | InputPassportElementErrorSourceSelfie -- ^ The selfie contains an error. The error is considered resolved when the file with the selfie changes
    { file_hash :: Maybe BS.ByteString -- ^ Current hash of the file containing the selfie
    }
  | InputPassportElementErrorSourceTranslationFile -- ^ One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes
    { file_hash :: Maybe BS.ByteString -- ^ Current hash of the file containing the translation
    }
  | InputPassportElementErrorSourceTranslationFiles -- ^ The translation of the document contains an error. The error is considered resolved when the list of files changes
    { file_hashes :: Maybe [BS.ByteString] -- ^ Current hashes of all files with the translation
    }
  | InputPassportElementErrorSourceFile -- ^ The file contains an error. The error is considered resolved when the file changes
    { file_hash :: Maybe BS.ByteString -- ^ Current hash of the file which has the error
    }
  | InputPassportElementErrorSourceFiles -- ^ The list of attached files contains an error. The error is considered resolved when the file list changes
    { file_hashes :: Maybe [BS.ByteString] -- ^ Current hashes of all attached files
    }
  deriving (Eq, Show)

instance I.ShortShow InputPassportElementErrorSource where
  shortShow InputPassportElementErrorSourceUnspecified
    { element_hash = element_hash_
    }
      = "InputPassportElementErrorSourceUnspecified"
        ++ I.cc
        [ "element_hash" `I.p` element_hash_
        ]
  shortShow InputPassportElementErrorSourceDataField
    { field_name = field_name_
    , data_hash  = data_hash_
    }
      = "InputPassportElementErrorSourceDataField"
        ++ I.cc
        [ "field_name" `I.p` field_name_
        , "data_hash"  `I.p` data_hash_
        ]
  shortShow InputPassportElementErrorSourceFrontSide
    { file_hash = file_hash_
    }
      = "InputPassportElementErrorSourceFrontSide"
        ++ I.cc
        [ "file_hash" `I.p` file_hash_
        ]
  shortShow InputPassportElementErrorSourceReverseSide
    { file_hash = file_hash_
    }
      = "InputPassportElementErrorSourceReverseSide"
        ++ I.cc
        [ "file_hash" `I.p` file_hash_
        ]
  shortShow InputPassportElementErrorSourceSelfie
    { file_hash = file_hash_
    }
      = "InputPassportElementErrorSourceSelfie"
        ++ I.cc
        [ "file_hash" `I.p` file_hash_
        ]
  shortShow InputPassportElementErrorSourceTranslationFile
    { file_hash = file_hash_
    }
      = "InputPassportElementErrorSourceTranslationFile"
        ++ I.cc
        [ "file_hash" `I.p` file_hash_
        ]
  shortShow InputPassportElementErrorSourceTranslationFiles
    { file_hashes = file_hashes_
    }
      = "InputPassportElementErrorSourceTranslationFiles"
        ++ I.cc
        [ "file_hashes" `I.p` file_hashes_
        ]
  shortShow InputPassportElementErrorSourceFile
    { file_hash = file_hash_
    }
      = "InputPassportElementErrorSourceFile"
        ++ I.cc
        [ "file_hash" `I.p` file_hash_
        ]
  shortShow InputPassportElementErrorSourceFiles
    { file_hashes = file_hashes_
    }
      = "InputPassportElementErrorSourceFiles"
        ++ I.cc
        [ "file_hashes" `I.p` file_hashes_
        ]

instance AT.FromJSON InputPassportElementErrorSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPassportElementErrorSourceUnspecified"      -> parseInputPassportElementErrorSourceUnspecified v
      "inputPassportElementErrorSourceDataField"        -> parseInputPassportElementErrorSourceDataField v
      "inputPassportElementErrorSourceFrontSide"        -> parseInputPassportElementErrorSourceFrontSide v
      "inputPassportElementErrorSourceReverseSide"      -> parseInputPassportElementErrorSourceReverseSide v
      "inputPassportElementErrorSourceSelfie"           -> parseInputPassportElementErrorSourceSelfie v
      "inputPassportElementErrorSourceTranslationFile"  -> parseInputPassportElementErrorSourceTranslationFile v
      "inputPassportElementErrorSourceTranslationFiles" -> parseInputPassportElementErrorSourceTranslationFiles v
      "inputPassportElementErrorSourceFile"             -> parseInputPassportElementErrorSourceFile v
      "inputPassportElementErrorSourceFiles"            -> parseInputPassportElementErrorSourceFiles v
      _                                                 -> mempty
    
    where
      parseInputPassportElementErrorSourceUnspecified :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceUnspecified = A.withObject "InputPassportElementErrorSourceUnspecified" $ \o -> do
        element_hash_ <- fmap I.readBytes <$> o A..:?  "element_hash"
        pure $ InputPassportElementErrorSourceUnspecified
          { element_hash = element_hash_
          }
      parseInputPassportElementErrorSourceDataField :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceDataField = A.withObject "InputPassportElementErrorSourceDataField" $ \o -> do
        field_name_ <- o A..:?                       "field_name"
        data_hash_  <- fmap I.readBytes <$> o A..:?  "data_hash"
        pure $ InputPassportElementErrorSourceDataField
          { field_name = field_name_
          , data_hash  = data_hash_
          }
      parseInputPassportElementErrorSourceFrontSide :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFrontSide = A.withObject "InputPassportElementErrorSourceFrontSide" $ \o -> do
        file_hash_ <- fmap I.readBytes <$> o A..:?  "file_hash"
        pure $ InputPassportElementErrorSourceFrontSide
          { file_hash = file_hash_
          }
      parseInputPassportElementErrorSourceReverseSide :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceReverseSide = A.withObject "InputPassportElementErrorSourceReverseSide" $ \o -> do
        file_hash_ <- fmap I.readBytes <$> o A..:?  "file_hash"
        pure $ InputPassportElementErrorSourceReverseSide
          { file_hash = file_hash_
          }
      parseInputPassportElementErrorSourceSelfie :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceSelfie = A.withObject "InputPassportElementErrorSourceSelfie" $ \o -> do
        file_hash_ <- fmap I.readBytes <$> o A..:?  "file_hash"
        pure $ InputPassportElementErrorSourceSelfie
          { file_hash = file_hash_
          }
      parseInputPassportElementErrorSourceTranslationFile :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceTranslationFile = A.withObject "InputPassportElementErrorSourceTranslationFile" $ \o -> do
        file_hash_ <- fmap I.readBytes <$> o A..:?  "file_hash"
        pure $ InputPassportElementErrorSourceTranslationFile
          { file_hash = file_hash_
          }
      parseInputPassportElementErrorSourceTranslationFiles :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceTranslationFiles = A.withObject "InputPassportElementErrorSourceTranslationFiles" $ \o -> do
        file_hashes_ <- fmap (fmap I.readBytes) <$> o A..:?  "file_hashes"
        pure $ InputPassportElementErrorSourceTranslationFiles
          { file_hashes = file_hashes_
          }
      parseInputPassportElementErrorSourceFile :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFile = A.withObject "InputPassportElementErrorSourceFile" $ \o -> do
        file_hash_ <- fmap I.readBytes <$> o A..:?  "file_hash"
        pure $ InputPassportElementErrorSourceFile
          { file_hash = file_hash_
          }
      parseInputPassportElementErrorSourceFiles :: A.Value -> AT.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFiles = A.withObject "InputPassportElementErrorSourceFiles" $ \o -> do
        file_hashes_ <- fmap (fmap I.readBytes) <$> o A..:?  "file_hashes"
        pure $ InputPassportElementErrorSourceFiles
          { file_hashes = file_hashes_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPassportElementErrorSource where
  toJSON InputPassportElementErrorSourceUnspecified
    { element_hash = element_hash_
    }
      = A.object
        [ "@type"        A..= AT.String "inputPassportElementErrorSourceUnspecified"
        , "element_hash" A..= fmap I.writeBytes  element_hash_
        ]
  toJSON InputPassportElementErrorSourceDataField
    { field_name = field_name_
    , data_hash  = data_hash_
    }
      = A.object
        [ "@type"      A..= AT.String "inputPassportElementErrorSourceDataField"
        , "field_name" A..= field_name_
        , "data_hash"  A..= fmap I.writeBytes  data_hash_
        ]
  toJSON InputPassportElementErrorSourceFrontSide
    { file_hash = file_hash_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPassportElementErrorSourceFrontSide"
        , "file_hash" A..= fmap I.writeBytes  file_hash_
        ]
  toJSON InputPassportElementErrorSourceReverseSide
    { file_hash = file_hash_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPassportElementErrorSourceReverseSide"
        , "file_hash" A..= fmap I.writeBytes  file_hash_
        ]
  toJSON InputPassportElementErrorSourceSelfie
    { file_hash = file_hash_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPassportElementErrorSourceSelfie"
        , "file_hash" A..= fmap I.writeBytes  file_hash_
        ]
  toJSON InputPassportElementErrorSourceTranslationFile
    { file_hash = file_hash_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPassportElementErrorSourceTranslationFile"
        , "file_hash" A..= fmap I.writeBytes  file_hash_
        ]
  toJSON InputPassportElementErrorSourceTranslationFiles
    { file_hashes = file_hashes_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPassportElementErrorSourceTranslationFiles"
        , "file_hashes" A..= fmap (fmap I.writeBytes ) file_hashes_
        ]
  toJSON InputPassportElementErrorSourceFile
    { file_hash = file_hash_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPassportElementErrorSourceFile"
        , "file_hash" A..= fmap I.writeBytes  file_hash_
        ]
  toJSON InputPassportElementErrorSourceFiles
    { file_hashes = file_hashes_
    }
      = A.object
        [ "@type"       A..= AT.String "inputPassportElementErrorSourceFiles"
        , "file_hashes" A..= fmap (fmap I.writeBytes ) file_hashes_
        ]

