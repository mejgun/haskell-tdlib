module TD.Query.RemoveInstalledBackground
  (RemoveInstalledBackground(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes background from the list of installed backgrounds. Returns 'TD.Data.Ok.Ok'
data RemoveInstalledBackground
  = RemoveInstalledBackground
    { background_id :: Maybe Int -- ^ The background identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveInstalledBackground where
  shortShow
    RemoveInstalledBackground
      { background_id = background_id_
      }
        = "RemoveInstalledBackground"
          ++ I.cc
          [ "background_id" `I.p` background_id_
          ]

instance AT.ToJSON RemoveInstalledBackground where
  toJSON
    RemoveInstalledBackground
      { background_id = background_id_
      }
        = A.object
          [ "@type"         A..= AT.String "removeInstalledBackground"
          , "background_id" A..= fmap I.writeInt64  background_id_
          ]

