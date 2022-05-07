{-# LANGUAGE OverloadedStrings #-}

module TD.Data.ProxyType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes the type of a proxy server
data ProxyType
  = -- | A SOCKS5 proxy server @username Username for logging in; may be empty @password Password for logging in; may be empty
    ProxyTypeSocks5
      { -- |
        password :: Maybe String,
        -- |
        username :: Maybe String
      }
  | -- | A HTTP transparent proxy server @username Username for logging in; may be empty @password Password for logging in; may be empty @http_only Pass true if the proxy supports only HTTP requests and doesn't support transparent TCP connections via HTTP CONNECT method
    ProxyTypeHttp
      { -- |
        http_only :: Maybe Bool,
        -- |
        password :: Maybe String,
        -- |
        username :: Maybe String
      }
  | -- | An MTProto proxy server @secret The proxy's secret in hexadecimal encoding
    ProxyTypeMtproto
      { -- |
        secret :: Maybe String
      }
  deriving (Eq)

instance Show ProxyType where
  show
    ProxyTypeSocks5
      { password = password,
        username = username
      } =
      "ProxyTypeSocks5"
        ++ U.cc
          [ U.p "password" password,
            U.p "username" username
          ]
  show
    ProxyTypeHttp
      { http_only = http_only,
        password = password,
        username = username
      } =
      "ProxyTypeHttp"
        ++ U.cc
          [ U.p "http_only" http_only,
            U.p "password" password,
            U.p "username" username
          ]
  show
    ProxyTypeMtproto
      { secret = secret
      } =
      "ProxyTypeMtproto"
        ++ U.cc
          [ U.p "secret" secret
          ]

instance T.FromJSON ProxyType where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "proxyTypeSocks5" -> parseProxyTypeSocks5 v
      "proxyTypeHttp" -> parseProxyTypeHttp v
      "proxyTypeMtproto" -> parseProxyTypeMtproto v
      _ -> mempty
    where
      parseProxyTypeSocks5 :: A.Value -> T.Parser ProxyType
      parseProxyTypeSocks5 = A.withObject "ProxyTypeSocks5" $ \o -> do
        password_ <- o A..:? "password"
        username_ <- o A..:? "username"
        return $ ProxyTypeSocks5 {password = password_, username = username_}

      parseProxyTypeHttp :: A.Value -> T.Parser ProxyType
      parseProxyTypeHttp = A.withObject "ProxyTypeHttp" $ \o -> do
        http_only_ <- o A..:? "http_only"
        password_ <- o A..:? "password"
        username_ <- o A..:? "username"
        return $ ProxyTypeHttp {http_only = http_only_, password = password_, username = username_}

      parseProxyTypeMtproto :: A.Value -> T.Parser ProxyType
      parseProxyTypeMtproto = A.withObject "ProxyTypeMtproto" $ \o -> do
        secret_ <- o A..:? "secret"
        return $ ProxyTypeMtproto {secret = secret_}
  parseJSON _ = mempty

instance T.ToJSON ProxyType where
  toJSON
    ProxyTypeSocks5
      { password = password,
        username = username
      } =
      A.object
        [ "@type" A..= T.String "proxyTypeSocks5",
          "password" A..= password,
          "username" A..= username
        ]
  toJSON
    ProxyTypeHttp
      { http_only = http_only,
        password = password,
        username = username
      } =
      A.object
        [ "@type" A..= T.String "proxyTypeHttp",
          "http_only" A..= http_only,
          "password" A..= password,
          "username" A..= username
        ]
  toJSON
    ProxyTypeMtproto
      { secret = secret
      } =
      A.object
        [ "@type" A..= T.String "proxyTypeMtproto",
          "secret" A..= secret
        ]
