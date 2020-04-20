-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PassportSuitableElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.PassportElementType as PassportElementType

--main = putStrLn "ok"

data PassportSuitableElement = 
 PassportSuitableElement { is_native_name_required :: Bool, is_translation_required :: Bool, is_selfie_required :: Bool, _type :: PassportElementType.PassportElementType }  -- deriving (Show)

instance T.ToJSON PassportSuitableElement where
 toJSON (PassportSuitableElement { is_native_name_required = is_native_name_required, is_translation_required = is_translation_required, is_selfie_required = is_selfie_required, _type = _type }) =
  A.object [ "@type" A..= T.String "passportSuitableElement", "is_native_name_required" A..= is_native_name_required, "is_translation_required" A..= is_translation_required, "is_selfie_required" A..= is_selfie_required, "type" A..= _type ]
-- passportSuitableElement PassportSuitableElement  { is_native_name_required :: Bool, is_translation_required :: Bool, is_selfie_required :: Bool, _type :: PassportElementType.PassportElementType } 

