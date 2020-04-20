-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportElementErrorSource where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data PassportElementErrorSource = 
 PassportElementErrorSourceUnspecified 
 | PassportElementErrorSourceDataField { field_name :: String }  
 | PassportElementErrorSourceFrontSide 
 | PassportElementErrorSourceReverseSide 
 | PassportElementErrorSourceSelfie 
 | PassportElementErrorSourceTranslationFile { file_index :: Int }  
 | PassportElementErrorSourceTranslationFiles 
 | PassportElementErrorSourceFile { file_index :: Int }  
 | PassportElementErrorSourceFiles -- deriving (Show)

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
-- passportElementErrorSourceUnspecified PassportElementErrorSource 

-- passportElementErrorSourceDataField PassportElementErrorSource  { field_name :: String } 

-- passportElementErrorSourceFrontSide PassportElementErrorSource 

-- passportElementErrorSourceReverseSide PassportElementErrorSource 

-- passportElementErrorSourceSelfie PassportElementErrorSource 

-- passportElementErrorSourceTranslationFile PassportElementErrorSource  { file_index :: Int } 

-- passportElementErrorSourceTranslationFiles PassportElementErrorSource 

-- passportElementErrorSourceFile PassportElementErrorSource  { file_index :: Int } 

-- passportElementErrorSourceFiles PassportElementErrorSource 

