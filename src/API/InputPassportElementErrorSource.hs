-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputPassportElementErrorSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data InputPassportElementErrorSource = 
 InputPassportElementErrorSourceUnspecified { element_hash :: String }  
 | InputPassportElementErrorSourceDataField { data_hash :: String, field_name :: String }  
 | InputPassportElementErrorSourceFrontSide { file_hash :: String }  
 | InputPassportElementErrorSourceReverseSide { file_hash :: String }  
 | InputPassportElementErrorSourceSelfie { file_hash :: String }  
 | InputPassportElementErrorSourceTranslationFile { file_hash :: String }  
 | InputPassportElementErrorSourceTranslationFiles { file_hashes :: [String] }  
 | InputPassportElementErrorSourceFile { file_hash :: String }  
 | InputPassportElementErrorSourceFiles { file_hashes :: [String] }  -- deriving (Show)

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
-- inputPassportElementErrorSourceUnspecified InputPassportElementErrorSource  { element_hash :: String } 

-- inputPassportElementErrorSourceDataField InputPassportElementErrorSource  { data_hash :: String, field_name :: String } 

-- inputPassportElementErrorSourceFrontSide InputPassportElementErrorSource  { file_hash :: String } 

-- inputPassportElementErrorSourceReverseSide InputPassportElementErrorSource  { file_hash :: String } 

-- inputPassportElementErrorSourceSelfie InputPassportElementErrorSource  { file_hash :: String } 

-- inputPassportElementErrorSourceTranslationFile InputPassportElementErrorSource  { file_hash :: String } 

-- inputPassportElementErrorSourceTranslationFiles InputPassportElementErrorSource  { file_hashes :: [String] } 

-- inputPassportElementErrorSourceFile InputPassportElementErrorSource  { file_hash :: String } 

-- inputPassportElementErrorSourceFiles InputPassportElementErrorSource  { file_hashes :: [String] } 

