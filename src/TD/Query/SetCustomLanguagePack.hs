module TD.Query.SetCustomLanguagePack
  (SetCustomLanguagePack(..)
  , defaultSetCustomLanguagePack
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.LanguagePackInfo as LanguagePackInfo
import qualified TD.Data.LanguagePackString as LanguagePackString

-- | Adds or changes a custom local language pack to the current localization target. Returns 'TD.Data.Ok.Ok'
data SetCustomLanguagePack
  = SetCustomLanguagePack
    { info    :: Maybe LanguagePackInfo.LanguagePackInfo       -- ^ Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
    , strings :: Maybe [LanguagePackString.LanguagePackString] -- ^ Strings of the new language pack
    }
  deriving (Eq, Show)

instance I.ShortShow SetCustomLanguagePack where
  shortShow
    SetCustomLanguagePack
      { info    = info_
      , strings = strings_
      }
        = "SetCustomLanguagePack"
          ++ I.cc
          [ "info"    `I.p` info_
          , "strings" `I.p` strings_
          ]

instance AT.ToJSON SetCustomLanguagePack where
  toJSON
    SetCustomLanguagePack
      { info    = info_
      , strings = strings_
      }
        = A.object
          [ "@type"   A..= AT.String "setCustomLanguagePack"
          , "info"    A..= info_
          , "strings" A..= strings_
          ]

defaultSetCustomLanguagePack :: SetCustomLanguagePack
defaultSetCustomLanguagePack =
  SetCustomLanguagePack
    { info    = Nothing
    , strings = Nothing
    }

