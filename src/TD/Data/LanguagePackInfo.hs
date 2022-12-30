{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data LanguagePackInfo = -- | Contains information about a language pack
  LanguagePackInfo
  { -- | Link to language translation interface; empty for custom local language packs
    translation_url :: Maybe String,
    -- | Total number of non-deleted strings from the language pack available locally
    local_string_count :: Maybe Int,
    -- | Total number of translated strings from the language pack
    translated_string_count :: Maybe Int,
    -- | Total number of non-deleted strings from the language pack
    total_string_count :: Maybe Int,
    -- | True, if the language pack is installed by the current user
    is_installed :: Maybe Bool,
    -- | True, if the language pack is a beta language pack
    is_beta :: Maybe Bool,
    -- | True, if the language pack strings are RTL
    is_rtl :: Maybe Bool,
    -- | True, if the language pack is official
    is_official :: Maybe Bool,
    -- | A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
    plural_code :: Maybe String,
    -- | Name of the language in that language
    native_name :: Maybe String,
    -- | Language name
    name :: Maybe String,
    -- | Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it must be fetched from base language pack. Unsupported in custom language packs
    base_language_pack_id :: Maybe String,
    -- | Unique language pack identifier
    _id :: Maybe String
  }
  deriving (Eq)

instance Show LanguagePackInfo where
  show
    LanguagePackInfo
      { translation_url = translation_url_,
        local_string_count = local_string_count_,
        translated_string_count = translated_string_count_,
        total_string_count = total_string_count_,
        is_installed = is_installed_,
        is_beta = is_beta_,
        is_rtl = is_rtl_,
        is_official = is_official_,
        plural_code = plural_code_,
        native_name = native_name_,
        name = name_,
        base_language_pack_id = base_language_pack_id_,
        _id = _id_
      } =
      "LanguagePackInfo"
        ++ U.cc
          [ U.p "translation_url" translation_url_,
            U.p "local_string_count" local_string_count_,
            U.p "translated_string_count" translated_string_count_,
            U.p "total_string_count" total_string_count_,
            U.p "is_installed" is_installed_,
            U.p "is_beta" is_beta_,
            U.p "is_rtl" is_rtl_,
            U.p "is_official" is_official_,
            U.p "plural_code" plural_code_,
            U.p "native_name" native_name_,
            U.p "name" name_,
            U.p "base_language_pack_id" base_language_pack_id_,
            U.p "_id" _id_
          ]

instance T.FromJSON LanguagePackInfo where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "languagePackInfo" -> parseLanguagePackInfo v
      _ -> mempty
    where
      parseLanguagePackInfo :: A.Value -> T.Parser LanguagePackInfo
      parseLanguagePackInfo = A.withObject "LanguagePackInfo" $ \o -> do
        translation_url_ <- o A..:? "translation_url"
        local_string_count_ <- o A..:? "local_string_count"
        translated_string_count_ <- o A..:? "translated_string_count"
        total_string_count_ <- o A..:? "total_string_count"
        is_installed_ <- o A..:? "is_installed"
        is_beta_ <- o A..:? "is_beta"
        is_rtl_ <- o A..:? "is_rtl"
        is_official_ <- o A..:? "is_official"
        plural_code_ <- o A..:? "plural_code"
        native_name_ <- o A..:? "native_name"
        name_ <- o A..:? "name"
        base_language_pack_id_ <- o A..:? "base_language_pack_id"
        _id_ <- o A..:? "id"
        return $ LanguagePackInfo {translation_url = translation_url_, local_string_count = local_string_count_, translated_string_count = translated_string_count_, total_string_count = total_string_count_, is_installed = is_installed_, is_beta = is_beta_, is_rtl = is_rtl_, is_official = is_official_, plural_code = plural_code_, native_name = native_name_, name = name_, base_language_pack_id = base_language_pack_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON LanguagePackInfo where
  toJSON
    LanguagePackInfo
      { translation_url = translation_url_,
        local_string_count = local_string_count_,
        translated_string_count = translated_string_count_,
        total_string_count = total_string_count_,
        is_installed = is_installed_,
        is_beta = is_beta_,
        is_rtl = is_rtl_,
        is_official = is_official_,
        plural_code = plural_code_,
        native_name = native_name_,
        name = name_,
        base_language_pack_id = base_language_pack_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "languagePackInfo",
          "translation_url" A..= translation_url_,
          "local_string_count" A..= local_string_count_,
          "translated_string_count" A..= translated_string_count_,
          "total_string_count" A..= total_string_count_,
          "is_installed" A..= is_installed_,
          "is_beta" A..= is_beta_,
          "is_rtl" A..= is_rtl_,
          "is_official" A..= is_official_,
          "plural_code" A..= plural_code_,
          "native_name" A..= native_name_,
          "name" A..= name_,
          "base_language_pack_id" A..= base_language_pack_id_,
          "id" A..= _id_
        ]
