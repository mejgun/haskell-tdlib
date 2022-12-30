{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProxyType as ProxyType
import qualified Utils as U

-- |
-- Edits an existing proxy server for network requests. Can be called before authorization
data EditProxy = EditProxy
  { -- | Proxy type
    _type :: Maybe ProxyType.ProxyType,
    -- | Pass true to immediately enable the proxy
    enable :: Maybe Bool,
    -- | Proxy server port
    port :: Maybe Int,
    -- | Proxy server IP address
    server :: Maybe String,
    -- | Proxy identifier
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditProxy where
  show
    EditProxy
      { _type = _type_,
        enable = enable_,
        port = port_,
        server = server_,
        proxy_id = proxy_id_
      } =
      "EditProxy"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "enable" enable_,
            U.p "port" port_,
            U.p "server" server_,
            U.p "proxy_id" proxy_id_
          ]

instance T.ToJSON EditProxy where
  toJSON
    EditProxy
      { _type = _type_,
        enable = enable_,
        port = port_,
        server = server_,
        proxy_id = proxy_id_
      } =
      A.object
        [ "@type" A..= T.String "editProxy",
          "type" A..= _type_,
          "enable" A..= enable_,
          "port" A..= port_,
          "server" A..= server_,
          "proxy_id" A..= proxy_id_
        ]
