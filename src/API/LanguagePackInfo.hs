-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data LanguagePackInfo = 
 LanguagePackInfo { translation_url :: String, local_string_count :: Int, translated_string_count :: Int, total_string_count :: Int, is_installed :: Bool, is_beta :: Bool, is_rtl :: Bool, is_official :: Bool, plural_code :: String, native_name :: String, name :: String, base_language_pack_id :: String, _id :: String }  deriving (Show)

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
    translation_url <- o A..: "translation_url"
    local_string_count <- o A..: "local_string_count"
    translated_string_count <- o A..: "translated_string_count"
    total_string_count <- o A..: "total_string_count"
    is_installed <- o A..: "is_installed"
    is_beta <- o A..: "is_beta"
    is_rtl <- o A..: "is_rtl"
    is_official <- o A..: "is_official"
    plural_code <- o A..: "plural_code"
    native_name <- o A..: "native_name"
    name <- o A..: "name"
    base_language_pack_id <- o A..: "base_language_pack_id"
    _id <- o A..: "id"
    return $ LanguagePackInfo { translation_url = translation_url, local_string_count = local_string_count, translated_string_count = translated_string_count, total_string_count = total_string_count, is_installed = is_installed, is_beta = is_beta, is_rtl = is_rtl, is_official = is_official, plural_code = plural_code, native_name = native_name, name = name, base_language_pack_id = base_language_pack_id, _id = _id }