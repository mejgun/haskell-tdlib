-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElementErrorSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data InputPassportElementErrorSource = 
 InputPassportElementErrorSourceUnspecified { element_hash :: String }  
 | InputPassportElementErrorSourceDataField { data_hash :: String, field_name :: String }  
 | InputPassportElementErrorSourceFrontSide { file_hash :: String }  
 | InputPassportElementErrorSourceReverseSide { file_hash :: String }  
 | InputPassportElementErrorSourceSelfie { file_hash :: String }  
 | InputPassportElementErrorSourceTranslationFile { file_hash :: String }  
 | InputPassportElementErrorSourceTranslationFiles { file_hashes :: [String] }  
 | InputPassportElementErrorSourceFile { file_hash :: String }  
 | InputPassportElementErrorSourceFiles { file_hashes :: [String] }  deriving (Show)

instance T.ToJSON InputPassportElementErrorSource where
 toJSON (InputPassportElementErrorSourceUnspecified { element_hash = element_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceUnspecified", "element_hash" A..= element_hash ]

 toJSON (InputPassportElementErrorSourceDataField { data_hash = data_hash, field_name = field_name }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceDataField", "data_hash" A..= data_hash, "field_name" A..= field_name ]

 toJSON (InputPassportElementErrorSourceFrontSide { file_hash = file_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceFrontSide", "file_hash" A..= file_hash ]

 toJSON (InputPassportElementErrorSourceReverseSide { file_hash = file_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceReverseSide", "file_hash" A..= file_hash ]

 toJSON (InputPassportElementErrorSourceSelfie { file_hash = file_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceSelfie", "file_hash" A..= file_hash ]

 toJSON (InputPassportElementErrorSourceTranslationFile { file_hash = file_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFile", "file_hash" A..= file_hash ]

 toJSON (InputPassportElementErrorSourceTranslationFiles { file_hashes = file_hashes }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFiles", "file_hashes" A..= file_hashes ]

 toJSON (InputPassportElementErrorSourceFile { file_hash = file_hash }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceFile", "file_hash" A..= file_hash ]

 toJSON (InputPassportElementErrorSourceFiles { file_hashes = file_hashes }) =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceFiles", "file_hashes" A..= file_hashes ]

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
    element_hash <- o A..: "element_hash"
    return $ InputPassportElementErrorSourceUnspecified { element_hash = element_hash }

   parseInputPassportElementErrorSourceDataField :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceDataField = A.withObject "InputPassportElementErrorSourceDataField" $ \o -> do
    data_hash <- o A..: "data_hash"
    field_name <- o A..: "field_name"
    return $ InputPassportElementErrorSourceDataField { data_hash = data_hash, field_name = field_name }

   parseInputPassportElementErrorSourceFrontSide :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFrontSide = A.withObject "InputPassportElementErrorSourceFrontSide" $ \o -> do
    file_hash <- o A..: "file_hash"
    return $ InputPassportElementErrorSourceFrontSide { file_hash = file_hash }

   parseInputPassportElementErrorSourceReverseSide :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceReverseSide = A.withObject "InputPassportElementErrorSourceReverseSide" $ \o -> do
    file_hash <- o A..: "file_hash"
    return $ InputPassportElementErrorSourceReverseSide { file_hash = file_hash }

   parseInputPassportElementErrorSourceSelfie :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceSelfie = A.withObject "InputPassportElementErrorSourceSelfie" $ \o -> do
    file_hash <- o A..: "file_hash"
    return $ InputPassportElementErrorSourceSelfie { file_hash = file_hash }

   parseInputPassportElementErrorSourceTranslationFile :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceTranslationFile = A.withObject "InputPassportElementErrorSourceTranslationFile" $ \o -> do
    file_hash <- o A..: "file_hash"
    return $ InputPassportElementErrorSourceTranslationFile { file_hash = file_hash }

   parseInputPassportElementErrorSourceTranslationFiles :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceTranslationFiles = A.withObject "InputPassportElementErrorSourceTranslationFiles" $ \o -> do
    file_hashes <- o A..: "file_hashes"
    return $ InputPassportElementErrorSourceTranslationFiles { file_hashes = file_hashes }

   parseInputPassportElementErrorSourceFile :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFile = A.withObject "InputPassportElementErrorSourceFile" $ \o -> do
    file_hash <- o A..: "file_hash"
    return $ InputPassportElementErrorSourceFile { file_hash = file_hash }

   parseInputPassportElementErrorSourceFiles :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFiles = A.withObject "InputPassportElementErrorSourceFiles" $ \o -> do
    file_hashes <- o A..: "file_hashes"
    return $ InputPassportElementErrorSourceFiles { file_hashes = file_hashes }