-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportSuitableElement where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

-- |
-- 
-- Contains information about a Telegram Passport element that was requested by a service 
-- 
-- __type__ Type of the element
-- 
-- __is_selfie_required__ True, if a selfie is required with the identity document
-- 
-- __is_translation_required__ True, if a certified English translation is required with the document
-- 
-- __is_native_name_required__ True, if personal details must include the user's name in the language of their country of residence
data PassportSuitableElement = 
 PassportSuitableElement { is_native_name_required :: Maybe Bool, is_translation_required :: Maybe Bool, is_selfie_required :: Maybe Bool, _type :: Maybe PassportElementType.PassportElementType }  deriving (Show, Eq)

instance T.ToJSON PassportSuitableElement where
 toJSON (PassportSuitableElement { is_native_name_required = is_native_name_required, is_translation_required = is_translation_required, is_selfie_required = is_selfie_required, _type = _type }) =
  A.object [ "@type" A..= T.String "passportSuitableElement", "is_native_name_required" A..= is_native_name_required, "is_translation_required" A..= is_translation_required, "is_selfie_required" A..= is_selfie_required, "type" A..= _type ]

instance T.FromJSON PassportSuitableElement where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "passportSuitableElement" -> parsePassportSuitableElement v
   _ -> mempty
  where
   parsePassportSuitableElement :: A.Value -> T.Parser PassportSuitableElement
   parsePassportSuitableElement = A.withObject "PassportSuitableElement" $ \o -> do
    is_native_name_required <- o A..:? "is_native_name_required"
    is_translation_required <- o A..:? "is_translation_required"
    is_selfie_required <- o A..:? "is_selfie_required"
    _type <- o A..:? "type"
    return $ PassportSuitableElement { is_native_name_required = is_native_name_required, is_translation_required = is_translation_required, is_selfie_required = is_selfie_required, _type = _type }