-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LanguagePackInfo = 
 LanguagePackInfo { translation_url :: Maybe String, local_string_count :: Maybe Int, translated_string_count :: Maybe Int, total_string_count :: Maybe Int, is_installed :: Maybe Bool, is_beta :: Maybe Bool, is_rtl :: Maybe Bool, is_official :: Maybe Bool, plural_code :: Maybe String, native_name :: Maybe String, name :: Maybe String, base_language_pack_id :: Maybe String, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON LanguagePackInfo where
 toJSON (LanguagePackInfo { translation_url = translation_url, local_string_count = local_string_count, translated_string_count = translated_string_count, total_string_count = total_string_count, is_installed = is_installed, is_beta = is_beta, is_rtl = is_rtl, is_official = is_official, plural_code = plural_code, native_name = native_name, name = name, base_language_pack_id = base_language_pack_id, _id = _id }) =
  A.object [ "@type" A..= T.String "languagePackInfo", "translation_url" A..= translation_url, "local_string_count" A..= local_string_count, "translated_string_count" A..= translated_string_count, "total_string_count" A..= total_string_count, "is_installed" A..= is_installed, "is_beta" A..= is_beta, "is_rtl" A..= is_rtl, "is_official" A..= is_official, "plural_code" A..= plural_code, "native_name" A..= native_name, "name" A..= name, "base_language_pack_id" A..= base_language_pack_id, "id" A..= _id ]

instance T.FromJSON LanguagePackInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "languagePackInfo" -> parseLanguagePackInfo v
   _ -> mempty
  where
   parseLanguagePackInfo :: A.Value -> T.Parser LanguagePackInfo
   parseLanguagePackInfo = A.withObject "LanguagePackInfo" $ \o -> do
    translation_url <- optional $ o A..: "translation_url"
    local_string_count <- optional $ o A..: "local_string_count"
    translated_string_count <- optional $ o A..: "translated_string_count"
    total_string_count <- optional $ o A..: "total_string_count"
    is_installed <- optional $ o A..: "is_installed"
    is_beta <- optional $ o A..: "is_beta"
    is_rtl <- optional $ o A..: "is_rtl"
    is_official <- optional $ o A..: "is_official"
    plural_code <- optional $ o A..: "plural_code"
    native_name <- optional $ o A..: "native_name"
    name <- optional $ o A..: "name"
    base_language_pack_id <- optional $ o A..: "base_language_pack_id"
    _id <- optional $ o A..: "id"
    return $ LanguagePackInfo { translation_url = translation_url, local_string_count = local_string_count, translated_string_count = translated_string_count, total_string_count = total_string_count, is_installed = is_installed, is_beta = is_beta, is_rtl = is_rtl, is_official = is_official, plural_code = plural_code, native_name = native_name, name = name, base_language_pack_id = base_language_pack_id, _id = _id }