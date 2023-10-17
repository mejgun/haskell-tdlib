module TD.Data.PassportElementErrorSource
  (PassportElementErrorSource(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains the description of an error in a Telegram Passport element
data PassportElementErrorSource
  = PassportElementErrorSourceUnspecified -- ^ The element contains an error in an unspecified place. The error will be considered resolved when new data is added
  | PassportElementErrorSourceDataField -- ^ One of the data fields contains an error. The error will be considered resolved when the value of the field changes
    { field_name :: Maybe T.Text -- ^ Field name
    }
  | PassportElementErrorSourceFrontSide -- ^ The front side of the document contains an error. The error will be considered resolved when the file with the front side changes
  | PassportElementErrorSourceReverseSide -- ^ The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes
  | PassportElementErrorSourceSelfie -- ^ The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes
  | PassportElementErrorSourceTranslationFile -- ^ One of files with the translation of the document contains an error. The error will be considered resolved when the file changes
    { file_index :: Maybe Int -- ^ Index of a file with the error
    }
  | PassportElementErrorSourceTranslationFiles -- ^ The translation of the document contains an error. The error will be considered resolved when the list of translation files changes
  | PassportElementErrorSourceFile -- ^ The file contains an error. The error will be considered resolved when the file changes
    { file_index :: Maybe Int -- ^ Index of a file with the error
    }
  | PassportElementErrorSourceFiles -- ^ The list of attached files contains an error. The error will be considered resolved when the list of files changes
  deriving (Eq, Show)

instance I.ShortShow PassportElementErrorSource where
  shortShow PassportElementErrorSourceUnspecified
      = "PassportElementErrorSourceUnspecified"
  shortShow PassportElementErrorSourceDataField
    { field_name = field_name_
    }
      = "PassportElementErrorSourceDataField"
        ++ I.cc
        [ "field_name" `I.p` field_name_
        ]
  shortShow PassportElementErrorSourceFrontSide
      = "PassportElementErrorSourceFrontSide"
  shortShow PassportElementErrorSourceReverseSide
      = "PassportElementErrorSourceReverseSide"
  shortShow PassportElementErrorSourceSelfie
      = "PassportElementErrorSourceSelfie"
  shortShow PassportElementErrorSourceTranslationFile
    { file_index = file_index_
    }
      = "PassportElementErrorSourceTranslationFile"
        ++ I.cc
        [ "file_index" `I.p` file_index_
        ]
  shortShow PassportElementErrorSourceTranslationFiles
      = "PassportElementErrorSourceTranslationFiles"
  shortShow PassportElementErrorSourceFile
    { file_index = file_index_
    }
      = "PassportElementErrorSourceFile"
        ++ I.cc
        [ "file_index" `I.p` file_index_
        ]
  shortShow PassportElementErrorSourceFiles
      = "PassportElementErrorSourceFiles"

instance AT.FromJSON PassportElementErrorSource where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "passportElementErrorSourceUnspecified"      -> pure PassportElementErrorSourceUnspecified
      "passportElementErrorSourceDataField"        -> parsePassportElementErrorSourceDataField v
      "passportElementErrorSourceFrontSide"        -> pure PassportElementErrorSourceFrontSide
      "passportElementErrorSourceReverseSide"      -> pure PassportElementErrorSourceReverseSide
      "passportElementErrorSourceSelfie"           -> pure PassportElementErrorSourceSelfie
      "passportElementErrorSourceTranslationFile"  -> parsePassportElementErrorSourceTranslationFile v
      "passportElementErrorSourceTranslationFiles" -> pure PassportElementErrorSourceTranslationFiles
      "passportElementErrorSourceFile"             -> parsePassportElementErrorSourceFile v
      "passportElementErrorSourceFiles"            -> pure PassportElementErrorSourceFiles
      _                                            -> mempty
    
    where
      parsePassportElementErrorSourceDataField :: A.Value -> AT.Parser PassportElementErrorSource
      parsePassportElementErrorSourceDataField = A.withObject "PassportElementErrorSourceDataField" $ \o -> do
        field_name_ <- o A..:?  "field_name"
        pure $ PassportElementErrorSourceDataField
          { field_name = field_name_
          }
      parsePassportElementErrorSourceTranslationFile :: A.Value -> AT.Parser PassportElementErrorSource
      parsePassportElementErrorSourceTranslationFile = A.withObject "PassportElementErrorSourceTranslationFile" $ \o -> do
        file_index_ <- o A..:?  "file_index"
        pure $ PassportElementErrorSourceTranslationFile
          { file_index = file_index_
          }
      parsePassportElementErrorSourceFile :: A.Value -> AT.Parser PassportElementErrorSource
      parsePassportElementErrorSourceFile = A.withObject "PassportElementErrorSourceFile" $ \o -> do
        file_index_ <- o A..:?  "file_index"
        pure $ PassportElementErrorSourceFile
          { file_index = file_index_
          }
  parseJSON _ = mempty

