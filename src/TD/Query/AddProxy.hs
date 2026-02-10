module TD.Query.AddProxy
  (AddProxy(..)
  , defaultAddProxy
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

-- | Adds a proxy server for network requests. Can be called before authorization. Returns 'TD.Data.AddedProxy.AddedProxy'
data AddProxy
  = AddProxy
    { proxy  :: Maybe Proxy.Proxy -- ^ The proxy to add
    , enable :: Maybe Bool        -- ^ Pass true to immediately enable the proxy
    }
  deriving (Eq, Show)

instance I.ShortShow AddProxy where
  shortShow
    AddProxy
      { proxy  = proxy_
      , enable = enable_
      }
        = "AddProxy"
          ++ I.cc
          [ "proxy"  `I.p` proxy_
          , "enable" `I.p` enable_
          ]

instance AT.ToJSON AddProxy where
  toJSON
    AddProxy
      { proxy  = proxy_
      , enable = enable_
      }
        = A.object
          [ "@type"  A..= AT.String "addProxy"
          , "proxy"  A..= proxy_
          , "enable" A..= enable_
          ]

defaultAddProxy :: AddProxy
defaultAddProxy =
  AddProxy
    { proxy  = Nothing
    , enable = Nothing
    }

