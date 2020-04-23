-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementErrorSource where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PassportElementErrorSource = 
 PassportElementErrorSourceUnspecified 
 | PassportElementErrorSourceDataField { field_name :: Maybe String }  
 | PassportElementErrorSourceFrontSide 
 | PassportElementErrorSourceReverseSide 
 | PassportElementErrorSourceSelfie 
 | PassportElementErrorSourceTranslationFile { file_index :: Maybe Int }  
 | PassportElementErrorSourceTranslationFiles 
 | PassportElementErrorSourceFile { file_index :: Maybe Int }  
 | PassportElementErrorSourceFiles deriving (Show)

instance T.ToJSON PassportElementErrorSource where
 toJSON (PassportElementErrorSourceUnspecified {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceUnspecified" ]

 toJSON (PassportElementErrorSourceDataField { field_name = field_name }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceDataField", "field_name" A..= field_name ]

 toJSON (PassportElementErrorSourceFrontSide {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceFrontSide" ]

 toJSON (PassportElementErrorSourceReverseSide {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceReverseSide" ]

 toJSON (PassportElementErrorSourceSelfie {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceSelfie" ]

 toJSON (PassportElementErrorSourceTranslationFile { file_index = file_index }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceTranslationFile", "file_index" A..= file_index ]

 toJSON (PassportElementErrorSourceTranslationFiles {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceTranslationFiles" ]

 toJSON (PassportElementErrorSourceFile { file_index = file_index }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceFile", "file_index" A..= file_index ]

 toJSON (PassportElementErrorSourceFiles {  }) =
  A.object [ "@type" A..= T.String "passportElementErrorSourceFiles" ]

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
   parsePassportElementErrorSourceUnspecified = A.withObject "PassportElementErrorSourceUnspecified" $ \o -> do
    return $ PassportElementErrorSourceUnspecified {  }

   parsePassportElementErrorSourceDataField :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceDataField = A.withObject "PassportElementErrorSourceDataField" $ \o -> do
    field_name <- optional $ o A..: "field_name"
    return $ PassportElementErrorSourceDataField { field_name = field_name }

   parsePassportElementErrorSourceFrontSide :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceFrontSide = A.withObject "PassportElementErrorSourceFrontSide" $ \o -> do
    return $ PassportElementErrorSourceFrontSide {  }

   parsePassportElementErrorSourceReverseSide :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceReverseSide = A.withObject "PassportElementErrorSourceReverseSide" $ \o -> do
    return $ PassportElementErrorSourceReverseSide {  }

   parsePassportElementErrorSourceSelfie :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceSelfie = A.withObject "PassportElementErrorSourceSelfie" $ \o -> do
    return $ PassportElementErrorSourceSelfie {  }

   parsePassportElementErrorSourceTranslationFile :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceTranslationFile = A.withObject "PassportElementErrorSourceTranslationFile" $ \o -> do
    file_index <- optional $ o A..: "file_index"
    return $ PassportElementErrorSourceTranslationFile { file_index = file_index }

   parsePassportElementErrorSourceTranslationFiles :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceTranslationFiles = A.withObject "PassportElementErrorSourceTranslationFiles" $ \o -> do
    return $ PassportElementErrorSourceTranslationFiles {  }

   parsePassportElementErrorSourceFile :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceFile = A.withObject "PassportElementErrorSourceFile" $ \o -> do
    file_index <- optional $ o A..: "file_index"
    return $ PassportElementErrorSourceFile { file_index = file_index }

   parsePassportElementErrorSourceFiles :: A.Value -> T.Parser PassportElementErrorSource
   parsePassportElementErrorSourceFiles = A.withObject "PassportElementErrorSourceFiles" $ \o -> do
    return $ PassportElementErrorSourceFiles {  }