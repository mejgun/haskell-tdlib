{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InputPassportElementErrorSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains the description of an error in a Telegram Passport element; for bots only
data InputPassportElementErrorSource
  = -- | The element contains an error in an unspecified place. The error will be considered resolved when new data is added @element_hash Current hash of the entire element
    InputPassportElementErrorSourceUnspecified
      { -- |
        element_hash :: Maybe String
      }
  | -- | A data field contains an error. The error is considered resolved when the field's value changes @field_name Field name @data_hash Current data hash
    InputPassportElementErrorSourceDataField
      { -- |
        data_hash :: Maybe String,
        -- |
        field_name :: Maybe String
      }
  | -- | The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes @file_hash Current hash of the file containing the front side
    InputPassportElementErrorSourceFrontSide
      { -- |
        file_hash :: Maybe String
      }
  | -- | The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes @file_hash Current hash of the file containing the reverse side
    InputPassportElementErrorSourceReverseSide
      { -- |
        file_hash :: Maybe String
      }
  | -- | The selfie contains an error. The error is considered resolved when the file with the selfie changes @file_hash Current hash of the file containing the selfie
    InputPassportElementErrorSourceSelfie
      { -- |
        file_hash :: Maybe String
      }
  | -- | One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes @file_hash Current hash of the file containing the translation
    InputPassportElementErrorSourceTranslationFile
      { -- |
        file_hash :: Maybe String
      }
  | -- | The translation of the document contains an error. The error is considered resolved when the list of files changes @file_hashes Current hashes of all files with the translation
    InputPassportElementErrorSourceTranslationFiles
      { -- |
        file_hashes :: Maybe [String]
      }
  | -- | The file contains an error. The error is considered resolved when the file changes @file_hash Current hash of the file which has the error
    InputPassportElementErrorSourceFile
      { -- |
        file_hash :: Maybe String
      }
  | -- | The list of attached files contains an error. The error is considered resolved when the file list changes @file_hashes Current hashes of all attached files
    InputPassportElementErrorSourceFiles
      { -- |
        file_hashes :: Maybe [String]
      }
  deriving (Eq)

instance Show InputPassportElementErrorSource where
  show
    InputPassportElementErrorSourceUnspecified
      { element_hash = element_hash_
      } =
      "InputPassportElementErrorSourceUnspecified"
        ++ U.cc
          [ U.p "element_hash" element_hash_
          ]
  show
    InputPassportElementErrorSourceDataField
      { data_hash = data_hash_,
        field_name = field_name_
      } =
      "InputPassportElementErrorSourceDataField"
        ++ U.cc
          [ U.p "data_hash" data_hash_,
            U.p "field_name" field_name_
          ]
  show
    InputPassportElementErrorSourceFrontSide
      { file_hash = file_hash_
      } =
      "InputPassportElementErrorSourceFrontSide"
        ++ U.cc
          [ U.p "file_hash" file_hash_
          ]
  show
    InputPassportElementErrorSourceReverseSide
      { file_hash = file_hash_
      } =
      "InputPassportElementErrorSourceReverseSide"
        ++ U.cc
          [ U.p "file_hash" file_hash_
          ]
  show
    InputPassportElementErrorSourceSelfie
      { file_hash = file_hash_
      } =
      "InputPassportElementErrorSourceSelfie"
        ++ U.cc
          [ U.p "file_hash" file_hash_
          ]
  show
    InputPassportElementErrorSourceTranslationFile
      { file_hash = file_hash_
      } =
      "InputPassportElementErrorSourceTranslationFile"
        ++ U.cc
          [ U.p "file_hash" file_hash_
          ]
  show
    InputPassportElementErrorSourceTranslationFiles
      { file_hashes = file_hashes_
      } =
      "InputPassportElementErrorSourceTranslationFiles"
        ++ U.cc
          [ U.p "file_hashes" file_hashes_
          ]
  show
    InputPassportElementErrorSourceFile
      { file_hash = file_hash_
      } =
      "InputPassportElementErrorSourceFile"
        ++ U.cc
          [ U.p "file_hash" file_hash_
          ]
  show
    InputPassportElementErrorSourceFiles
      { file_hashes = file_hashes_
      } =
      "InputPassportElementErrorSourceFiles"
        ++ U.cc
          [ U.p "file_hashes" file_hashes_
          ]

instance T.FromJSON InputPassportElementErrorSource where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inputPassportElementErrorSourceUnspecified" -> parseInputPassportElementErrorSourceUnspecified v
      "inputPassportElementErrorSourceDataField" -> parseInputPassportElementErrorSourceDataField v
      "inputPassportElementErrorSourceFrontSide" -> parseInputPassportElementErrorSourceFrontSide v
      "inputPassportElementErrorSourceReverseSide" -> parseInputPassportElementErrorSourceReverseSide v
      "inputPassportElementErrorSourceSelfie" -> parseInputPassportElementErrorSourceSelfie v
      "inputPassportElementErrorSourceTranslationFile" -> parseInputPassportElementErrorSourceTranslationFile v
      "inputPassportElementErrorSourceTranslationFiles" -> parseInputPassportElementErrorSourceTranslationFiles v
      "inputPassportElementErrorSourceFile" -> parseInputPassportElementErrorSourceFile v
      "inputPassportElementErrorSourceFiles" -> parseInputPassportElementErrorSourceFiles v
      _ -> mempty
    where
      parseInputPassportElementErrorSourceUnspecified :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceUnspecified = A.withObject "InputPassportElementErrorSourceUnspecified" $ \o -> do
        element_hash_ <- o A..:? "element_hash"
        return $ InputPassportElementErrorSourceUnspecified {element_hash = element_hash_}

      parseInputPassportElementErrorSourceDataField :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceDataField = A.withObject "InputPassportElementErrorSourceDataField" $ \o -> do
        data_hash_ <- o A..:? "data_hash"
        field_name_ <- o A..:? "field_name"
        return $ InputPassportElementErrorSourceDataField {data_hash = data_hash_, field_name = field_name_}

      parseInputPassportElementErrorSourceFrontSide :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFrontSide = A.withObject "InputPassportElementErrorSourceFrontSide" $ \o -> do
        file_hash_ <- o A..:? "file_hash"
        return $ InputPassportElementErrorSourceFrontSide {file_hash = file_hash_}

      parseInputPassportElementErrorSourceReverseSide :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceReverseSide = A.withObject "InputPassportElementErrorSourceReverseSide" $ \o -> do
        file_hash_ <- o A..:? "file_hash"
        return $ InputPassportElementErrorSourceReverseSide {file_hash = file_hash_}

      parseInputPassportElementErrorSourceSelfie :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceSelfie = A.withObject "InputPassportElementErrorSourceSelfie" $ \o -> do
        file_hash_ <- o A..:? "file_hash"
        return $ InputPassportElementErrorSourceSelfie {file_hash = file_hash_}

      parseInputPassportElementErrorSourceTranslationFile :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceTranslationFile = A.withObject "InputPassportElementErrorSourceTranslationFile" $ \o -> do
        file_hash_ <- o A..:? "file_hash"
        return $ InputPassportElementErrorSourceTranslationFile {file_hash = file_hash_}

      parseInputPassportElementErrorSourceTranslationFiles :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceTranslationFiles = A.withObject "InputPassportElementErrorSourceTranslationFiles" $ \o -> do
        file_hashes_ <- o A..:? "file_hashes"
        return $ InputPassportElementErrorSourceTranslationFiles {file_hashes = file_hashes_}

      parseInputPassportElementErrorSourceFile :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFile = A.withObject "InputPassportElementErrorSourceFile" $ \o -> do
        file_hash_ <- o A..:? "file_hash"
        return $ InputPassportElementErrorSourceFile {file_hash = file_hash_}

      parseInputPassportElementErrorSourceFiles :: A.Value -> T.Parser InputPassportElementErrorSource
      parseInputPassportElementErrorSourceFiles = A.withObject "InputPassportElementErrorSourceFiles" $ \o -> do
        file_hashes_ <- o A..:? "file_hashes"
        return $ InputPassportElementErrorSourceFiles {file_hashes = file_hashes_}
  parseJSON _ = mempty

instance T.ToJSON InputPassportElementErrorSource where
  toJSON
    InputPassportElementErrorSourceUnspecified
      { element_hash = element_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceUnspecified",
          "element_hash" A..= element_hash_
        ]
  toJSON
    InputPassportElementErrorSourceDataField
      { data_hash = data_hash_,
        field_name = field_name_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceDataField",
          "data_hash" A..= data_hash_,
          "field_name" A..= field_name_
        ]
  toJSON
    InputPassportElementErrorSourceFrontSide
      { file_hash = file_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceFrontSide",
          "file_hash" A..= file_hash_
        ]
  toJSON
    InputPassportElementErrorSourceReverseSide
      { file_hash = file_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceReverseSide",
          "file_hash" A..= file_hash_
        ]
  toJSON
    InputPassportElementErrorSourceSelfie
      { file_hash = file_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceSelfie",
          "file_hash" A..= file_hash_
        ]
  toJSON
    InputPassportElementErrorSourceTranslationFile
      { file_hash = file_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFile",
          "file_hash" A..= file_hash_
        ]
  toJSON
    InputPassportElementErrorSourceTranslationFiles
      { file_hashes = file_hashes_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFiles",
          "file_hashes" A..= file_hashes_
        ]
  toJSON
    InputPassportElementErrorSourceFile
      { file_hash = file_hash_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceFile",
          "file_hash" A..= file_hash_
        ]
  toJSON
    InputPassportElementErrorSourceFiles
      { file_hashes = file_hashes_
      } =
      A.object
        [ "@type" A..= T.String "inputPassportElementErrorSourceFiles",
          "file_hashes" A..= file_hashes_
        ]
