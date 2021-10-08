-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElementErrorSource where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains the description of an error in a Telegram Passport element; for bots only
data InputPassportElementErrorSource = 
 -- |
 -- 
 -- The element contains an error in an unspecified place. The error will be considered resolved when new data is added 
 -- 
 -- __element_hash__ Current hash of the entire element
 InputPassportElementErrorSourceUnspecified { element_hash :: Maybe String }  |
 -- |
 -- 
 -- A data field contains an error. The error is considered resolved when the field's value changes 
 -- 
 -- __field_name__ Field name
 -- 
 -- __data_hash__ Current data hash
 InputPassportElementErrorSourceDataField { data_hash :: Maybe String, field_name :: Maybe String }  |
 -- |
 -- 
 -- The front side of the document contains an error. The error is considered resolved when the file with the front side of the document changes 
 -- 
 -- __file_hash__ Current hash of the file containing the front side
 InputPassportElementErrorSourceFrontSide { file_hash :: Maybe String }  |
 -- |
 -- 
 -- The reverse side of the document contains an error. The error is considered resolved when the file with the reverse side of the document changes 
 -- 
 -- __file_hash__ Current hash of the file containing the reverse side
 InputPassportElementErrorSourceReverseSide { file_hash :: Maybe String }  |
 -- |
 -- 
 -- The selfie contains an error. The error is considered resolved when the file with the selfie changes 
 -- 
 -- __file_hash__ Current hash of the file containing the selfie
 InputPassportElementErrorSourceSelfie { file_hash :: Maybe String }  |
 -- |
 -- 
 -- One of the files containing the translation of the document contains an error. The error is considered resolved when the file with the translation changes 
 -- 
 -- __file_hash__ Current hash of the file containing the translation
 InputPassportElementErrorSourceTranslationFile { file_hash :: Maybe String }  |
 -- |
 -- 
 -- The translation of the document contains an error. The error is considered resolved when the list of files changes 
 -- 
 -- __file_hashes__ Current hashes of all files with the translation
 InputPassportElementErrorSourceTranslationFiles { file_hashes :: Maybe [String] }  |
 -- |
 -- 
 -- The file contains an error. The error is considered resolved when the file changes 
 -- 
 -- __file_hash__ Current hash of the file which has the error
 InputPassportElementErrorSourceFile { file_hash :: Maybe String }  |
 -- |
 -- 
 -- The list of attached files contains an error. The error is considered resolved when the file list changes 
 -- 
 -- __file_hashes__ Current hashes of all attached files
 InputPassportElementErrorSourceFiles { file_hashes :: Maybe [String] }  deriving (Eq)

instance Show InputPassportElementErrorSource where
 show InputPassportElementErrorSourceUnspecified { element_hash=element_hash } =
  "InputPassportElementErrorSourceUnspecified" ++ cc [p "element_hash" element_hash ]

 show InputPassportElementErrorSourceDataField { data_hash=data_hash, field_name=field_name } =
  "InputPassportElementErrorSourceDataField" ++ cc [p "data_hash" data_hash, p "field_name" field_name ]

 show InputPassportElementErrorSourceFrontSide { file_hash=file_hash } =
  "InputPassportElementErrorSourceFrontSide" ++ cc [p "file_hash" file_hash ]

 show InputPassportElementErrorSourceReverseSide { file_hash=file_hash } =
  "InputPassportElementErrorSourceReverseSide" ++ cc [p "file_hash" file_hash ]

 show InputPassportElementErrorSourceSelfie { file_hash=file_hash } =
  "InputPassportElementErrorSourceSelfie" ++ cc [p "file_hash" file_hash ]

 show InputPassportElementErrorSourceTranslationFile { file_hash=file_hash } =
  "InputPassportElementErrorSourceTranslationFile" ++ cc [p "file_hash" file_hash ]

 show InputPassportElementErrorSourceTranslationFiles { file_hashes=file_hashes } =
  "InputPassportElementErrorSourceTranslationFiles" ++ cc [p "file_hashes" file_hashes ]

 show InputPassportElementErrorSourceFile { file_hash=file_hash } =
  "InputPassportElementErrorSourceFile" ++ cc [p "file_hash" file_hash ]

 show InputPassportElementErrorSourceFiles { file_hashes=file_hashes } =
  "InputPassportElementErrorSourceFiles" ++ cc [p "file_hashes" file_hashes ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON InputPassportElementErrorSource where
 toJSON InputPassportElementErrorSourceUnspecified { element_hash = element_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceUnspecified", "element_hash" A..= element_hash ]

 toJSON InputPassportElementErrorSourceDataField { data_hash = data_hash, field_name = field_name } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceDataField", "data_hash" A..= data_hash, "field_name" A..= field_name ]

 toJSON InputPassportElementErrorSourceFrontSide { file_hash = file_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceFrontSide", "file_hash" A..= file_hash ]

 toJSON InputPassportElementErrorSourceReverseSide { file_hash = file_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceReverseSide", "file_hash" A..= file_hash ]

 toJSON InputPassportElementErrorSourceSelfie { file_hash = file_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceSelfie", "file_hash" A..= file_hash ]

 toJSON InputPassportElementErrorSourceTranslationFile { file_hash = file_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFile", "file_hash" A..= file_hash ]

 toJSON InputPassportElementErrorSourceTranslationFiles { file_hashes = file_hashes } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceTranslationFiles", "file_hashes" A..= file_hashes ]

 toJSON InputPassportElementErrorSourceFile { file_hash = file_hash } =
  A.object [ "@type" A..= T.String "inputPassportElementErrorSourceFile", "file_hash" A..= file_hash ]

 toJSON InputPassportElementErrorSourceFiles { file_hashes = file_hashes } =
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
    element_hash <- o A..:? "element_hash"
    return $ InputPassportElementErrorSourceUnspecified { element_hash = element_hash }

   parseInputPassportElementErrorSourceDataField :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceDataField = A.withObject "InputPassportElementErrorSourceDataField" $ \o -> do
    data_hash <- o A..:? "data_hash"
    field_name <- o A..:? "field_name"
    return $ InputPassportElementErrorSourceDataField { data_hash = data_hash, field_name = field_name }

   parseInputPassportElementErrorSourceFrontSide :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFrontSide = A.withObject "InputPassportElementErrorSourceFrontSide" $ \o -> do
    file_hash <- o A..:? "file_hash"
    return $ InputPassportElementErrorSourceFrontSide { file_hash = file_hash }

   parseInputPassportElementErrorSourceReverseSide :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceReverseSide = A.withObject "InputPassportElementErrorSourceReverseSide" $ \o -> do
    file_hash <- o A..:? "file_hash"
    return $ InputPassportElementErrorSourceReverseSide { file_hash = file_hash }

   parseInputPassportElementErrorSourceSelfie :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceSelfie = A.withObject "InputPassportElementErrorSourceSelfie" $ \o -> do
    file_hash <- o A..:? "file_hash"
    return $ InputPassportElementErrorSourceSelfie { file_hash = file_hash }

   parseInputPassportElementErrorSourceTranslationFile :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceTranslationFile = A.withObject "InputPassportElementErrorSourceTranslationFile" $ \o -> do
    file_hash <- o A..:? "file_hash"
    return $ InputPassportElementErrorSourceTranslationFile { file_hash = file_hash }

   parseInputPassportElementErrorSourceTranslationFiles :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceTranslationFiles = A.withObject "InputPassportElementErrorSourceTranslationFiles" $ \o -> do
    file_hashes <- o A..:? "file_hashes"
    return $ InputPassportElementErrorSourceTranslationFiles { file_hashes = file_hashes }

   parseInputPassportElementErrorSourceFile :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFile = A.withObject "InputPassportElementErrorSourceFile" $ \o -> do
    file_hash <- o A..:? "file_hash"
    return $ InputPassportElementErrorSourceFile { file_hash = file_hash }

   parseInputPassportElementErrorSourceFiles :: A.Value -> T.Parser InputPassportElementErrorSource
   parseInputPassportElementErrorSourceFiles = A.withObject "InputPassportElementErrorSourceFiles" $ \o -> do
    file_hashes <- o A..:? "file_hashes"
    return $ InputPassportElementErrorSourceFiles { file_hashes = file_hashes }
 parseJSON _ = mempty
