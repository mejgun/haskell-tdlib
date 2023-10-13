module TD.Query.GetLanguagePackStrings(GetLanguagePackStrings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data GetLanguagePackStrings -- ^ Returns strings from a language pack in the current localization target by their keys. Can be called before authorization
  = GetLanguagePackStrings
    { language_pack_id :: Maybe T.Text   -- ^ Language pack identifier of the strings to be returned
    , keys             :: Maybe [T.Text] -- ^ Language pack keys of the strings to be returned; leave empty to request all available strings
    }
  deriving (Eq)

instance Show GetLanguagePackStrings where
  show
    GetLanguagePackStrings
      { language_pack_id = language_pack_id_
      , keys             = keys_
      }
        = "GetLanguagePackStrings"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          , "keys"             `I.p` keys_
          ]

instance AT.ToJSON GetLanguagePackStrings where
  toJSON
    GetLanguagePackStrings
      { language_pack_id = language_pack_id_
      , keys             = keys_
      }
        = A.object
          [ "@type"            A..= AT.String "getLanguagePackStrings"
          , "language_pack_id" A..= language_pack_id_
          , "keys"             A..= keys_
          ]
