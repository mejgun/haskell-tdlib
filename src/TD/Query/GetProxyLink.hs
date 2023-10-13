module TD.Query.GetProxyLink
  (GetProxyLink(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data GetProxyLink -- ^ Returns an HTTPS link, which can be used to add a proxy. Available only for SOCKS5 and MTProto proxies. Can be called before authorization
  = GetProxyLink
    { proxy_id :: Maybe Int -- ^ Proxy identifier
    }
  deriving (Eq)

instance Show GetProxyLink where
  show
    GetProxyLink
      { proxy_id = proxy_id_
      }
        = "GetProxyLink"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          ]

instance AT.ToJSON GetProxyLink where
  toJSON
    GetProxyLink
      { proxy_id = proxy_id_
      }
        = A.object
          [ "@type"    A..= AT.String "getProxyLink"
          , "proxy_id" A..= proxy_id_
          ]

