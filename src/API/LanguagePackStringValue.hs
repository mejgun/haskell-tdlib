-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStringValue where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data LanguagePackStringValue = 
 LanguagePackStringValueOrdinary { value :: String }  
 | LanguagePackStringValuePluralized { other_value :: String, many_value :: String, few_value :: String, two_value :: String, one_value :: String, zero_value :: String }  
 | LanguagePackStringValueDeleted -- deriving (Show)

instance T.ToJSON LanguagePackStringValue where
 toJSON (LanguagePackStringValueOrdinary { value = value }) =
  A.object [ "@type" A..= T.String "languagePackStringValueOrdinary", "value" A..= value ]

 toJSON (LanguagePackStringValuePluralized { other_value = other_value, many_value = many_value, few_value = few_value, two_value = two_value, one_value = one_value, zero_value = zero_value }) =
  A.object [ "@type" A..= T.String "languagePackStringValuePluralized", "other_value" A..= other_value, "many_value" A..= many_value, "few_value" A..= few_value, "two_value" A..= two_value, "one_value" A..= one_value, "zero_value" A..= zero_value ]

 toJSON (LanguagePackStringValueDeleted {  }) =
  A.object [ "@type" A..= T.String "languagePackStringValueDeleted" ]
-- languagePackStringValueOrdinary LanguagePackStringValue  { value :: String } 

-- languagePackStringValuePluralized LanguagePackStringValue  { other_value :: String, many_value :: String, few_value :: String, two_value :: String, one_value :: String, zero_value :: String } 

-- languagePackStringValueDeleted LanguagePackStringValue 

