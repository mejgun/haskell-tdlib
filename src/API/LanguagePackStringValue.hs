-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStringValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents the value of a string in a language pack
data LanguagePackStringValue = 
 -- |
 -- 
 -- An ordinary language pack string 
 -- 
 -- __value__ String value
 LanguagePackStringValueOrdinary { value :: Maybe String }  |
 -- |
 -- 
 -- A language pack string which has different forms based on the number of some object it mentions. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
 -- 
 -- __zero_value__ Value for zero objects
 -- 
 -- __one_value__ Value for one object
 -- 
 -- __two_value__ Value for two objects
 -- 
 -- __few_value__ Value for few objects
 -- 
 -- __many_value__ Value for many objects
 -- 
 -- __other_value__ Default value
 LanguagePackStringValuePluralized { other_value :: Maybe String, many_value :: Maybe String, few_value :: Maybe String, two_value :: Maybe String, one_value :: Maybe String, zero_value :: Maybe String }  |
 -- |
 -- 
 -- A deleted language pack string, the value must be taken from the built-in English language pack
 LanguagePackStringValueDeleted deriving (Eq)

instance Show LanguagePackStringValue where
 show LanguagePackStringValueOrdinary { value=value } =
  "LanguagePackStringValueOrdinary" ++ U.cc [U.p "value" value ]

 show LanguagePackStringValuePluralized { other_value=other_value, many_value=many_value, few_value=few_value, two_value=two_value, one_value=one_value, zero_value=zero_value } =
  "LanguagePackStringValuePluralized" ++ U.cc [U.p "other_value" other_value, U.p "many_value" many_value, U.p "few_value" few_value, U.p "two_value" two_value, U.p "one_value" one_value, U.p "zero_value" zero_value ]

 show LanguagePackStringValueDeleted {  } =
  "LanguagePackStringValueDeleted" ++ U.cc [ ]

instance T.ToJSON LanguagePackStringValue where
 toJSON LanguagePackStringValueOrdinary { value = value } =
  A.object [ "@type" A..= T.String "languagePackStringValueOrdinary", "value" A..= value ]

 toJSON LanguagePackStringValuePluralized { other_value = other_value, many_value = many_value, few_value = few_value, two_value = two_value, one_value = one_value, zero_value = zero_value } =
  A.object [ "@type" A..= T.String "languagePackStringValuePluralized", "other_value" A..= other_value, "many_value" A..= many_value, "few_value" A..= few_value, "two_value" A..= two_value, "one_value" A..= one_value, "zero_value" A..= zero_value ]

 toJSON LanguagePackStringValueDeleted {  } =
  A.object [ "@type" A..= T.String "languagePackStringValueDeleted" ]

instance T.FromJSON LanguagePackStringValue where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackStringValueOrdinary" -> parseLanguagePackStringValueOrdinary v
   "languagePackStringValuePluralized" -> parseLanguagePackStringValuePluralized v
   "languagePackStringValueDeleted" -> parseLanguagePackStringValueDeleted v
   _ -> mempty
  where
   parseLanguagePackStringValueOrdinary :: A.Value -> T.Parser LanguagePackStringValue
   parseLanguagePackStringValueOrdinary = A.withObject "LanguagePackStringValueOrdinary" $ \o -> do
    value <- o A..:? "value"
    return $ LanguagePackStringValueOrdinary { value = value }

   parseLanguagePackStringValuePluralized :: A.Value -> T.Parser LanguagePackStringValue
   parseLanguagePackStringValuePluralized = A.withObject "LanguagePackStringValuePluralized" $ \o -> do
    other_value <- o A..:? "other_value"
    many_value <- o A..:? "many_value"
    few_value <- o A..:? "few_value"
    two_value <- o A..:? "two_value"
    one_value <- o A..:? "one_value"
    zero_value <- o A..:? "zero_value"
    return $ LanguagePackStringValuePluralized { other_value = other_value, many_value = many_value, few_value = few_value, two_value = two_value, one_value = one_value, zero_value = zero_value }

   parseLanguagePackStringValueDeleted :: A.Value -> T.Parser LanguagePackStringValue
   parseLanguagePackStringValueDeleted = A.withObject "LanguagePackStringValueDeleted" $ \o -> do
    return $ LanguagePackStringValueDeleted {  }
 parseJSON _ = mempty
