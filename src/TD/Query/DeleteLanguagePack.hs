module TD.Query.DeleteLanguagePack
  (DeleteLanguagePack(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data DeleteLanguagePack
  = DeleteLanguagePack
    { language_pack_id :: Maybe T.Text -- ^ Identifier of the language pack to delete
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteLanguagePack where
  shortShow
    DeleteLanguagePack
      { language_pack_id = language_pack_id_
      }
        = "DeleteLanguagePack"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          ]

instance AT.ToJSON DeleteLanguagePack where
  toJSON
    DeleteLanguagePack
      { language_pack_id = language_pack_id_
      }
        = A.object
          [ "@type"            A..= AT.String "deleteLanguagePack"
          , "language_pack_id" A..= language_pack_id_
          ]

