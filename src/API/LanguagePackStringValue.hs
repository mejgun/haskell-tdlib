-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackStringValue where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LanguagePackStringValue = 
 LanguagePackStringValueOrdinary { value :: Maybe String }  
 | LanguagePackStringValuePluralized { other_value :: Maybe String, many_value :: Maybe String, few_value :: Maybe String, two_value :: Maybe String, one_value :: Maybe String, zero_value :: Maybe String }  
 | LanguagePackStringValueDeleted deriving (Show, Eq)

instance T.ToJSON LanguagePackStringValue where
 toJSON (LanguagePackStringValueOrdinary { value = value }) =
  A.object [ "@type" A..= T.String "languagePackStringValueOrdinary", "value" A..= value ]

 toJSON (LanguagePackStringValuePluralized { other_value = other_value, many_value = many_value, few_value = few_value, two_value = two_value, one_value = one_value, zero_value = zero_value }) =
  A.object [ "@type" A..= T.String "languagePackStringValuePluralized", "other_value" A..= other_value, "many_value" A..= many_value, "few_value" A..= few_value, "two_value" A..= two_value, "one_value" A..= one_value, "zero_value" A..= zero_value ]

 toJSON (LanguagePackStringValueDeleted {  }) =
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