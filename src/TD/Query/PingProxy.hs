module TD.Query.PingProxy
  (PingProxy(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

-- | Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization. Returns 'TD.Data.Seconds.Seconds'
data PingProxy
  = PingProxy
    { proxy :: Maybe Proxy.Proxy -- ^ The proxy to test; pass null to ping a Telegram server without a proxy
    }
  deriving (Eq, Show)

instance I.ShortShow PingProxy where
  shortShow
    PingProxy
      { proxy = proxy_
      }
        = "PingProxy"
          ++ I.cc
          [ "proxy" `I.p` proxy_
          ]

instance AT.ToJSON PingProxy where
  toJSON
    PingProxy
      { proxy = proxy_
      }
        = A.object
          [ "@type" A..= AT.String "pingProxy"
          , "proxy" A..= proxy_
          ]

