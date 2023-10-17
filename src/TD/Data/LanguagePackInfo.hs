module TD.Data.LanguagePackInfo
  ( LanguagePackInfo(..)    
  , defaultLanguagePackInfo 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data LanguagePackInfo
  = LanguagePackInfo -- ^ Contains information about a language pack
    { _id                     :: Maybe T.Text -- ^ Unique language pack identifier
    , base_language_pack_id   :: Maybe T.Text -- ^ Identifier of a base language pack; may be empty. If a string is missed in the language pack, then it must be fetched from base language pack. Unsupported in custom language packs
    , name                    :: Maybe T.Text -- ^ Language name
    , native_name             :: Maybe T.Text -- ^ Name of the language in that language
    , plural_code             :: Maybe T.Text -- ^ A language code to be used to apply plural forms. See https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html for more information
    , is_official             :: Maybe Bool   -- ^ True, if the language pack is official
    , is_rtl                  :: Maybe Bool   -- ^ True, if the language pack strings are RTL
    , is_beta                 :: Maybe Bool   -- ^ True, if the language pack is a beta language pack
    , is_installed            :: Maybe Bool   -- ^ True, if the language pack is installed by the current user
    , total_string_count      :: Maybe Int    -- ^ Total number of non-deleted strings from the language pack
    , translated_string_count :: Maybe Int    -- ^ Total number of translated strings from the language pack
    , local_string_count      :: Maybe Int    -- ^ Total number of non-deleted strings from the language pack available locally
    , translation_url         :: Maybe T.Text -- ^ Link to language translation interface; empty for custom local language packs
    }
  deriving (Eq, Show)

instance I.ShortShow LanguagePackInfo where
  shortShow LanguagePackInfo
    { _id                     = _id_
    , base_language_pack_id   = base_language_pack_id_
    , name                    = name_
    , native_name             = native_name_
    , plural_code             = plural_code_
    , is_official             = is_official_
    , is_rtl                  = is_rtl_
    , is_beta                 = is_beta_
    , is_installed            = is_installed_
    , total_string_count      = total_string_count_
    , translated_string_count = translated_string_count_
    , local_string_count      = local_string_count_
    , translation_url         = translation_url_
    }
      = "LanguagePackInfo"
        ++ I.cc
        [ "_id"                     `I.p` _id_
        , "base_language_pack_id"   `I.p` base_language_pack_id_
        , "name"                    `I.p` name_
        , "native_name"             `I.p` native_name_
        , "plural_code"             `I.p` plural_code_
        , "is_official"             `I.p` is_official_
        , "is_rtl"                  `I.p` is_rtl_
        , "is_beta"                 `I.p` is_beta_
        , "is_installed"            `I.p` is_installed_
        , "total_string_count"      `I.p` total_string_count_
        , "translated_string_count" `I.p` translated_string_count_
        , "local_string_count"      `I.p` local_string_count_
        , "translation_url"         `I.p` translation_url_
        ]

instance AT.FromJSON LanguagePackInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "languagePackInfo" -> parseLanguagePackInfo v
      _                  -> mempty
    
    where
      parseLanguagePackInfo :: A.Value -> AT.Parser LanguagePackInfo
      parseLanguagePackInfo = A.withObject "LanguagePackInfo" $ \o -> do
        _id_                     <- o A..:?  "id"
        base_language_pack_id_   <- o A..:?  "base_language_pack_id"
        name_                    <- o A..:?  "name"
        native_name_             <- o A..:?  "native_name"
        plural_code_             <- o A..:?  "plural_code"
        is_official_             <- o A..:?  "is_official"
        is_rtl_                  <- o A..:?  "is_rtl"
        is_beta_                 <- o A..:?  "is_beta"
        is_installed_            <- o A..:?  "is_installed"
        total_string_count_      <- o A..:?  "total_string_count"
        translated_string_count_ <- o A..:?  "translated_string_count"
        local_string_count_      <- o A..:?  "local_string_count"
        translation_url_         <- o A..:?  "translation_url"
        pure $ LanguagePackInfo
          { _id                     = _id_
          , base_language_pack_id   = base_language_pack_id_
          , name                    = name_
          , native_name             = native_name_
          , plural_code             = plural_code_
          , is_official             = is_official_
          , is_rtl                  = is_rtl_
          , is_beta                 = is_beta_
          , is_installed            = is_installed_
          , total_string_count      = total_string_count_
          , translated_string_count = translated_string_count_
          , local_string_count      = local_string_count_
          , translation_url         = translation_url_
          }
  parseJSON _ = mempty

instance AT.ToJSON LanguagePackInfo where
  toJSON LanguagePackInfo
    { _id                     = _id_
    , base_language_pack_id   = base_language_pack_id_
    , name                    = name_
    , native_name             = native_name_
    , plural_code             = plural_code_
    , is_official             = is_official_
    , is_rtl                  = is_rtl_
    , is_beta                 = is_beta_
    , is_installed            = is_installed_
    , total_string_count      = total_string_count_
    , translated_string_count = translated_string_count_
    , local_string_count      = local_string_count_
    , translation_url         = translation_url_
    }
      = A.object
        [ "@type"                   A..= AT.String "languagePackInfo"
        , "id"                      A..= _id_
        , "base_language_pack_id"   A..= base_language_pack_id_
        , "name"                    A..= name_
        , "native_name"             A..= native_name_
        , "plural_code"             A..= plural_code_
        , "is_official"             A..= is_official_
        , "is_rtl"                  A..= is_rtl_
        , "is_beta"                 A..= is_beta_
        , "is_installed"            A..= is_installed_
        , "total_string_count"      A..= total_string_count_
        , "translated_string_count" A..= translated_string_count_
        , "local_string_count"      A..= local_string_count_
        , "translation_url"         A..= translation_url_
        ]

defaultLanguagePackInfo :: LanguagePackInfo
defaultLanguagePackInfo =
  LanguagePackInfo
    { _id                     = Nothing
    , base_language_pack_id   = Nothing
    , name                    = Nothing
    , native_name             = Nothing
    , plural_code             = Nothing
    , is_official             = Nothing
    , is_rtl                  = Nothing
    , is_beta                 = Nothing
    , is_installed            = Nothing
    , total_string_count      = Nothing
    , translated_string_count = Nothing
    , local_string_count      = Nothing
    , translation_url         = Nothing
    }

