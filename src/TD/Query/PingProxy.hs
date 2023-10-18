module TD.Query.PingProxy
  (PingProxy(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Computes time needed to receive a response from a Telegram server through a proxy. Can be called before authorization. Returns 'TD.Data.Seconds.Seconds'
data PingProxy
  = PingProxy
    { proxy_id :: Maybe Int -- ^ Proxy identifier. Use 0 to ping a Telegram server without a proxy
    }
  deriving (Eq, Show)

instance I.ShortShow PingProxy where
  shortShow
    PingProxy
      { proxy_id = proxy_id_
      }
        = "PingProxy"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          ]

instance AT.ToJSON PingProxy where
  toJSON
    PingProxy
      { proxy_id = proxy_id_
      }
        = A.object
          [ "@type"    A..= AT.String "pingProxy"
          , "proxy_id" A..= proxy_id_
          ]

