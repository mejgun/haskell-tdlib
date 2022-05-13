{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PassportElementErrorSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains the description of an error in a Telegram Passport element
data PassportElementErrorSource
  = -- | The element contains an error in an unspecified place. The error will be considered resolved when new data is added
    PassportElementErrorSourceUnspecified
  | -- | One of the data fields contains an error. The error will be considered resolved when the value of the field changes @field_name Field name
    PassportElementErrorSourceDataField
      { -- |
        field_name :: Maybe String
      }
  | -- | The front side of the document contains an error. The error will be considered resolved when the file with the front side changes
    PassportElementErrorSourceFrontSide
  | -- | The reverse side of the document contains an error. The error will be considered resolved when the file with the reverse side changes
    PassportElementErrorSourceReverseSide
  | -- | The selfie with the document contains an error. The error will be considered resolved when the file with the selfie changes
    PassportElementErrorSourceSelfie
  | -- | One of files with the translation of the document contains an error. The error will be considered resolved when the file changes @file_index Index of a file with the error
    PassportElementErrorSourceTranslationFile
      { -- |
        file_index :: Maybe Int
      }
  | -- | The translation of the document contains an error. The error will be considered resolved when the list of translation files changes
    PassportElementErrorSourceTranslationFiles
  | -- | The file contains an error. The error will be considered resolved when the file changes @file_index Index of a file with the error
    PassportElementErrorSourceFile
      { -- |
        file_index :: Maybe Int
      }
  | -- | The list of attached files contains an error. The error will be considered resolved when the list of files changes
    PassportElementErrorSourceFiles
  deriving (Eq)

instance Show PassportElementErrorSource where
  show PassportElementErrorSourceUnspecified =
    "PassportElementErrorSourceUnspecified"
      ++ U.cc
        []
  show
    PassportElementErrorSourceDataField
      { field_name = field_name_
      } =
      "PassportElementErrorSourceDataField"
        ++ U.cc
          [ U.p "field_name" field_name_
          ]
  show PassportElementErrorSourceFrontSide =
    "PassportElementErrorSourceFrontSide"
      ++ U.cc
        []
  show PassportElementErrorSourceReverseSide =
    "PassportElementErrorSourceReverseSide"
      ++ U.cc
        []
  show PassportElementErrorSourceSelfie =
    "PassportElementErrorSourceSelfie"
      ++ U.cc
        []
  show
    PassportElementErrorSourceTranslationFile
      { file_index = file_index_
      } =
      "PassportElementErrorSourceTranslationFile"
        ++ U.cc
          [ U.p "file_index" file_index_
          ]
  show PassportElementErrorSourceTranslationFiles =
    "PassportElementErrorSourceTranslationFiles"
      ++ U.cc
        []
  show
    PassportElementErrorSourceFile
      { file_index = file_index_
      } =
      "PassportElementErrorSourceFile"
        ++ U.cc
          [ U.p "file_index" file_index_
          ]
  show PassportElementErrorSourceFiles =
    "PassportElementErrorSourceFiles"
      ++ U.cc
        []

instance T.FromJSON PassportElementErrorSource where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "passportElementErrorSourceUnspecified" -> parsePassportElementErrorSourceUnspecified v
      "passportElementErrorSourceDataField" -> parsePassportElementErrorSourceDataField v
      "passportElementErrorSourceFrontSide" -> parsePassportElementErrorSourceFrontSide v
      "passportElementErrorSourceReverseSide" -> parsePassportElementErrorSourceReverseSide v
      "passportElementErrorSourceSelfie" -> parsePassportElementErrorSourceSelfie v
      "passportElementErrorSourceTranslationFile" -> parsePassportElementErrorSourceTranslationFile v
      "passportElementErrorSourceTranslationFiles" -> parsePassportElementErrorSourceTranslationFiles v
      "passportElementErrorSourceFile" -> parsePassportElementErrorSourceFile v
      "passportElementErrorSourceFiles" -> parsePassportElementErrorSourceFiles v
      _ -> mempty
    where
      parsePassportElementErrorSourceUnspecified :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceUnspecified = A.withObject "PassportElementErrorSourceUnspecified" $ \_ -> return PassportElementErrorSourceUnspecified

      parsePassportElementErrorSourceDataField :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceDataField = A.withObject "PassportElementErrorSourceDataField" $ \o -> do
        field_name_ <- o A..:? "field_name"
        return $ PassportElementErrorSourceDataField {field_name = field_name_}

      parsePassportElementErrorSourceFrontSide :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceFrontSide = A.withObject "PassportElementErrorSourceFrontSide" $ \_ -> return PassportElementErrorSourceFrontSide

      parsePassportElementErrorSourceReverseSide :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceReverseSide = A.withObject "PassportElementErrorSourceReverseSide" $ \_ -> return PassportElementErrorSourceReverseSide

      parsePassportElementErrorSourceSelfie :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceSelfie = A.withObject "PassportElementErrorSourceSelfie" $ \_ -> return PassportElementErrorSourceSelfie

      parsePassportElementErrorSourceTranslationFile :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceTranslationFile = A.withObject "PassportElementErrorSourceTranslationFile" $ \o -> do
        file_index_ <- mconcat [o A..:? "file_index", U.rm <$> (o A..: "file_index" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PassportElementErrorSourceTranslationFile {file_index = file_index_}

      parsePassportElementErrorSourceTranslationFiles :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceTranslationFiles = A.withObject "PassportElementErrorSourceTranslationFiles" $ \_ -> return PassportElementErrorSourceTranslationFiles

      parsePassportElementErrorSourceFile :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceFile = A.withObject "PassportElementErrorSourceFile" $ \o -> do
        file_index_ <- mconcat [o A..:? "file_index", U.rm <$> (o A..: "file_index" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PassportElementErrorSourceFile {file_index = file_index_}

      parsePassportElementErrorSourceFiles :: A.Value -> T.Parser PassportElementErrorSource
      parsePassportElementErrorSourceFiles = A.withObject "PassportElementErrorSourceFiles" $ \_ -> return PassportElementErrorSourceFiles
  parseJSON _ = mempty

instance T.ToJSON PassportElementErrorSource where
  toJSON PassportElementErrorSourceUnspecified =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceUnspecified"
      ]
  toJSON
    PassportElementErrorSourceDataField
      { field_name = field_name_
      } =
      A.object
        [ "@type" A..= T.String "passportElementErrorSourceDataField",
          "field_name" A..= field_name_
        ]
  toJSON PassportElementErrorSourceFrontSide =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceFrontSide"
      ]
  toJSON PassportElementErrorSourceReverseSide =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceReverseSide"
      ]
  toJSON PassportElementErrorSourceSelfie =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceSelfie"
      ]
  toJSON
    PassportElementErrorSourceTranslationFile
      { file_index = file_index_
      } =
      A.object
        [ "@type" A..= T.String "passportElementErrorSourceTranslationFile",
          "file_index" A..= file_index_
        ]
  toJSON PassportElementErrorSourceTranslationFiles =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceTranslationFiles"
      ]
  toJSON
    PassportElementErrorSourceFile
      { file_index = file_index_
      } =
      A.object
        [ "@type" A..= T.String "passportElementErrorSourceFile",
          "file_index" A..= file_index_
        ]
  toJSON PassportElementErrorSourceFiles =
    A.object
      [ "@type" A..= T.String "passportElementErrorSourceFiles"
      ]
