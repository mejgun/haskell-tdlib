module TD.Query.SynchronizeLanguagePack
  (SynchronizeLanguagePack(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SynchronizeLanguagePack -- ^ Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization
  = SynchronizeLanguagePack
    { language_pack_id :: Maybe T.Text -- ^ Language pack identifier
    }
  deriving (Eq)

instance Show SynchronizeLanguagePack where
  show
    SynchronizeLanguagePack
      { language_pack_id = language_pack_id_
      }
        = "SynchronizeLanguagePack"
          ++ I.cc
          [ "language_pack_id" `I.p` language_pack_id_
          ]

instance AT.ToJSON SynchronizeLanguagePack where
  toJSON
    SynchronizeLanguagePack
      { language_pack_id = language_pack_id_
      }
        = A.object
          [ "@type"            A..= AT.String "synchronizeLanguagePack"
          , "language_pack_id" A..= language_pack_id_
          ]

