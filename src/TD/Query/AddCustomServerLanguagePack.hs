module TD.Query.AddCustomServerLanguagePack
  (AddCustomServerLanguagePack(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data AddCustomServerLanguagePack
  = AddCustomServerLanguagePack
    { language_pack_id :: Maybe T.Text -- ^ Identifier of a language pack to be added
    }
  deriving (Eq, Show)

instance I.ShortShow AddCustomServerLanguagePack where
  shortShow
    AddCustomServerLanguagePack
      { language_pack_id = language_pack_id_
      }
        = "AddCustomServerLanguagePack"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          ]

instance AT.ToJSON AddCustomServerLanguagePack where
  toJSON
    AddCustomServerLanguagePack
      { language_pack_id = language_pack_id_
      }
        = A.object
          [ "@type"            A..= AT.String "addCustomServerLanguagePack"
          , "language_pack_id" A..= language_pack_id_
          ]

