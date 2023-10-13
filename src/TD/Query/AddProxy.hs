module TD.Query.AddProxy(AddProxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ProxyType as ProxyType

data AddProxy -- ^ Adds a proxy server for network requests. Can be called before authorization
  = AddProxy
    { server :: Maybe T.Text              -- ^ Proxy server IP address
    , port   :: Maybe Int                 -- ^ Proxy server port
    , enable :: Maybe Bool                -- ^ Pass true to immediately enable the proxy
    , _type  :: Maybe ProxyType.ProxyType -- ^ Proxy type
    }
  deriving (Eq)

instance Show AddProxy where
  show
    AddProxy
      { server = server_
      , port   = port_
      , enable = enable_
      , _type  = _type_
      }
        = "AddProxy"
          ++ I.cc
          [ "server" `I.p` server_
          , "port"   `I.p` port_
          , "enable" `I.p` enable_
          , "_type"  `I.p` _type_
          ]

instance AT.ToJSON AddProxy where
  toJSON
    AddProxy
      { server = server_
      , port   = port_
      , enable = enable_
      , _type  = _type_
      }
        = A.object
          [ "@type"  A..= AT.String "addProxy"
          , "server" A..= server_
          , "port"   A..= port_
          , "enable" A..= enable_
          , "type"   A..= _type_
          ]
