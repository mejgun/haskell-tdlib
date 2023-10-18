module TD.Query.SetCustomLanguagePackString
  (SetCustomLanguagePackString(..)
  , defaultSetCustomLanguagePackString
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.LanguagePackString as LanguagePackString

-- | Adds, edits or deletes a string in a custom local language pack. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data SetCustomLanguagePackString
  = SetCustomLanguagePackString
    { language_pack_id :: Maybe T.Text                                -- ^ Identifier of a previously added custom local language pack in the current localization target
    , new_string       :: Maybe LanguagePackString.LanguagePackString -- ^ New language pack string
    }
  deriving (Eq, Show)

instance I.ShortShow SetCustomLanguagePackString where
  shortShow
    SetCustomLanguagePackString
      { language_pack_id = language_pack_id_
      , new_string       = new_string_
      }
        = "SetCustomLanguagePackString"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          , "new_string"       `I.p` new_string_
          ]

instance AT.ToJSON SetCustomLanguagePackString where
  toJSON
    SetCustomLanguagePackString
      { language_pack_id = language_pack_id_
      , new_string       = new_string_
      }
        = A.object
          [ "@type"            A..= AT.String "setCustomLanguagePackString"
          , "language_pack_id" A..= language_pack_id_
          , "new_string"       A..= new_string_
          ]

defaultSetCustomLanguagePackString :: SetCustomLanguagePackString
defaultSetCustomLanguagePackString =
  SetCustomLanguagePackString
    { language_pack_id = Nothing
    , new_string       = Nothing
    }

