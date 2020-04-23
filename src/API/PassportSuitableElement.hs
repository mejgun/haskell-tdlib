-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportSuitableElement where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

data PassportSuitableElement = 
 PassportSuitableElement { is_native_name_required :: Maybe Bool, is_translation_required :: Maybe Bool, is_selfie_required :: Maybe Bool, _type :: Maybe PassportElementType.PassportElementType }  deriving (Show)

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
    is_native_name_required <- optional $ o A..: "is_native_name_required"
    is_translation_required <- optional $ o A..: "is_translation_required"
    is_selfie_required <- optional $ o A..: "is_selfie_required"
    _type <- optional $ o A..: "type"
    return $ PassportSuitableElement { is_native_name_required = is_native_name_required, is_translation_required = is_translation_required, is_selfie_required = is_selfie_required, _type = _type }