module TD.Query.RemoveProxy
  (RemoveProxy(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes a proxy server. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data RemoveProxy
  = RemoveProxy
    { proxy_id :: Maybe Int -- ^ Proxy identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveProxy where
  shortShow
    RemoveProxy
      { proxy_id = proxy_id_
      }
        = "RemoveProxy"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          ]

instance AT.ToJSON RemoveProxy where
  toJSON
    RemoveProxy
      { proxy_id = proxy_id_
      }
        = A.object
          [ "@type"    A..= AT.String "removeProxy"
          , "proxy_id" A..= proxy_id_
          ]

