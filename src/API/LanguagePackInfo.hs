-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.LanguagePackInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Contains information about a language pack 
-- 
-- __id__ Unique language pack identifier
-- 
-- __base_language_pack_id__ Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it must be fetched from base language pack. Unsupported in custom language packs
-- 
-- __name__ Language name
-- 
-- __native_name__ Name of the language in that language
-- 
-- __plural_code__ A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
-- 
-- __is_official__ True, if the language pack is official
-- 
-- __is_rtl__ True, if the language pack strings are RTL
-- 
-- __is_beta__ True, if the language pack is a beta language pack
-- 
-- __is_installed__ True, if the language pack is installed by the current user
-- 
-- __total_string_count__ Total number of non-deleted strings from the language pack
-- 
-- __translated_string_count__ Total number of translated strings from the language pack
-- 
-- __local_string_count__ Total number of non-deleted strings from the language pack available locally
-- 
-- __translation_url__ Link to language translation interface; empty for custom local language packs
data LanguagePackInfo = 

 LanguagePackInfo { translation_url :: Maybe String, local_string_count :: Maybe Int, translated_string_count :: Maybe Int, total_string_count :: Maybe Int, is_installed :: Maybe Bool, is_beta :: Maybe Bool, is_rtl :: Maybe Bool, is_official :: Maybe Bool, plural_code :: Maybe String, native_name :: Maybe String, name :: Maybe String, base_language_pack_id :: Maybe String, _id :: Maybe String }  deriving (Eq)

instance Show LanguagePackInfo where
 show LanguagePackInfo { translation_url=translation_url, local_string_count=local_string_count, translated_string_count=translated_string_count, total_string_count=total_string_count, is_installed=is_installed, is_beta=is_beta, is_rtl=is_rtl, is_official=is_official, plural_code=plural_code, native_name=native_name, name=name, base_language_pack_id=base_language_pack_id, _id=_id } =
  "LanguagePackInfo" ++ U.cc [U.p "translation_url" translation_url, U.p "local_string_count" local_string_count, U.p "translated_string_count" translated_string_count, U.p "total_string_count" total_string_count, U.p "is_installed" is_installed, U.p "is_beta" is_beta, U.p "is_rtl" is_rtl, U.p "is_official" is_official, U.p "plural_code" plural_code, U.p "native_name" native_name, U.p "name" name, U.p "base_language_pack_id" base_language_pack_id, U.p "_id" _id ]

instance T.ToJSON LanguagePackInfo where
 toJSON LanguagePackInfo { translation_url = translation_url, local_string_count = local_string_count, translated_string_count = translated_string_count, total_string_count = total_string_count, is_installed = is_installed, is_beta = is_beta, is_rtl = is_rtl, is_official = is_official, plural_code = plural_code, native_name = native_name, name = name, base_language_pack_id = base_language_pack_id, _id = _id } =
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
    translation_url <- o A..:? "translation_url"
    local_string_count <- mconcat [ o A..:? "local_string_count", readMaybe <$> (o A..: "local_string_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    translated_string_count <- mconcat [ o A..:? "translated_string_count", readMaybe <$> (o A..: "translated_string_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    total_string_count <- mconcat [ o A..:? "total_string_count", readMaybe <$> (o A..: "total_string_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_installed <- o A..:? "is_installed"
    is_beta <- o A..:? "is_beta"
    is_rtl <- o A..:? "is_rtl"
    is_official <- o A..:? "is_official"
    plural_code <- o A..:? "plural_code"
    native_name <- o A..:? "native_name"
    name <- o A..:? "name"
    base_language_pack_id <- o A..:? "base_language_pack_id"
    _id <- o A..:? "id"
    return $ LanguagePackInfo { translation_url = translation_url, local_string_count = local_string_count, translated_string_count = translated_string_count, total_string_count = total_string_count, is_installed = is_installed, is_beta = is_beta, is_rtl = is_rtl, is_official = is_official, plural_code = plural_code, native_name = native_name, name = name, base_language_pack_id = base_language_pack_id, _id = _id }
 parseJSON _ = mempty
