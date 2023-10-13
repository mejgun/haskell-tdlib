module TD.Query.EditProxy(EditProxy(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ProxyType as ProxyType

data EditProxy -- ^ Edits an existing proxy server for network requests. Can be called before authorization
  = EditProxy
    { proxy_id :: Maybe Int                 -- ^ Proxy identifier
    , server   :: Maybe T.Text              -- ^ Proxy server IP address
    , port     :: Maybe Int                 -- ^ Proxy server port
    , enable   :: Maybe Bool                -- ^ Pass true to immediately enable the proxy
    , _type    :: Maybe ProxyType.ProxyType -- ^ Proxy type
    }
  deriving (Eq)

instance Show EditProxy where
  show
    EditProxy
      { proxy_id = proxy_id_
      , server   = server_
      , port     = port_
      , enable   = enable_
      , _type    = _type_
      }
        = "EditProxy"
          ++ I.cc
          [ "proxy_id" `I.p` proxy_id_
          , "server"   `I.p` server_
          , "port"     `I.p` port_
          , "enable"   `I.p` enable_
          , "_type"    `I.p` _type_
          ]

instance AT.ToJSON EditProxy where
  toJSON
    EditProxy
      { proxy_id = proxy_id_
      , server   = server_
      , port     = port_
      , enable   = enable_
      , _type    = _type_
      }
        = A.object
          [ "@type"    A..= AT.String "editProxy"
          , "proxy_id" A..= proxy_id_
          , "server"   A..= server_
          , "port"     A..= port_
          , "enable"   A..= enable_
          , "type"     A..= _type_
          ]
