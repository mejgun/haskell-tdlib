module TD.Query.EnableProxy(EnableProxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data EnableProxy -- ^ Enables a proxy. Only one proxy can be enabled at a time. Can be called before authorization
  = EnableProxy
    { proxy_id :: Maybe Int -- ^ Proxy identifier
    }
  deriving (Eq)

instance Show EnableProxy where
  show
    EnableProxy
      { proxy_id = proxy_id_
      }
        = "EnableProxy"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          ]

instance AT.ToJSON EnableProxy where
  toJSON
    EnableProxy
      { proxy_id = proxy_id_
      }
        = A.object
          [ "@type"    A..= AT.String "enableProxy"
          , "proxy_id" A..= proxy_id_
          ]
