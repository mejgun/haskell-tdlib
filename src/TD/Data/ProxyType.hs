module TD.Data.ProxyType
  (ProxyType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes the type of proxy server
data ProxyType
  = ProxyTypeSocks5 -- ^ A SOCKS5 proxy server
    { username :: Maybe T.Text -- ^ Username for logging in; may be empty
    , password :: Maybe T.Text -- ^ Password for logging in; may be empty
    }
  | ProxyTypeHttp -- ^ A HTTP transparent proxy server
    { username  :: Maybe T.Text -- ^ Username for logging in; may be empty
    , password  :: Maybe T.Text -- ^ Password for logging in; may be empty
    , http_only :: Maybe Bool   -- ^ Pass true if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
    }
  | ProxyTypeMtproto -- ^ An MTProto proxy server
    { secret :: Maybe T.Text -- ^ The proxy's secret in hexadecimal encoding
    }
  deriving (Eq, Show)

instance I.ShortShow ProxyType where
  shortShow ProxyTypeSocks5
    { username = username_
    , password = password_
    }
      = "ProxyTypeSocks5"
        ++ I.cc
        [ "username" `I.p` username_
        , "password" `I.p` password_
        ]
  shortShow ProxyTypeHttp
    { username  = username_
    , password  = password_
    , http_only = http_only_
    }
      = "ProxyTypeHttp"
        ++ I.cc
        [ "username"  `I.p` username_
        , "password"  `I.p` password_
        , "http_only" `I.p` http_only_
        ]
  shortShow ProxyTypeMtproto
    { secret = secret_
    }
      = "ProxyTypeMtproto"
        ++ I.cc
        [ "secret" `I.p` secret_
        ]

instance AT.FromJSON ProxyType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "proxyTypeSocks5"  -> parseProxyTypeSocks5 v
      "proxyTypeHttp"    -> parseProxyTypeHttp v
      "proxyTypeMtproto" -> parseProxyTypeMtproto v
      _                  -> mempty
    
    where
      parseProxyTypeSocks5 :: A.Value -> AT.Parser ProxyType
      parseProxyTypeSocks5 = A.withObject "ProxyTypeSocks5" $ \o -> do
        username_ <- o A..:?  "username"
        password_ <- o A..:?  "password"
        pure $ ProxyTypeSocks5
          { username = username_
          , password = password_
          }
      parseProxyTypeHttp :: A.Value -> AT.Parser ProxyType
      parseProxyTypeHttp = A.withObject "ProxyTypeHttp" $ \o -> do
        username_  <- o A..:?  "username"
        password_  <- o A..:?  "password"
        http_only_ <- o A..:?  "http_only"
        pure $ ProxyTypeHttp
          { username  = username_
          , password  = password_
          , http_only = http_only_
          }
      parseProxyTypeMtproto :: A.Value -> AT.Parser ProxyType
      parseProxyTypeMtproto = A.withObject "ProxyTypeMtproto" $ \o -> do
        secret_ <- o A..:?  "secret"
        pure $ ProxyTypeMtproto
          { secret = secret_
          }
  parseJSON _ = mempty

instance AT.ToJSON ProxyType where
  toJSON ProxyTypeSocks5
    { username = username_
    , password = password_
    }
      = A.object
        [ "@type"    A..= AT.String "proxyTypeSocks5"
        , "username" A..= username_
        , "password" A..= password_
        ]
  toJSON ProxyTypeHttp
    { username  = username_
    , password  = password_
    , http_only = http_only_
    }
      = A.object
        [ "@type"     A..= AT.String "proxyTypeHttp"
        , "username"  A..= username_
        , "password"  A..= password_
        , "http_only" A..= http_only_
        ]
  toJSON ProxyTypeMtproto
    { secret = secret_
    }
      = A.object
        [ "@type"  A..= AT.String "proxyTypeMtproto"
        , "secret" A..= secret_
        ]

