{-# LANGUAGE OverloadedStrings #-}

module TD.Query.EditProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ProxyType as ProxyType
import qualified Utils as U

-- |
-- Edits an existing proxy server for network requests. Can be called before authorization @proxy_id Proxy identifier @server Proxy server IP address @port Proxy server port @enable Pass true to immediately enable the proxy @type Proxy type
data EditProxy = EditProxy
  { -- |
    _type :: Maybe ProxyType.ProxyType,
    -- |
    enable :: Maybe Bool,
    -- |
    port :: Maybe Int,
    -- |
    server :: Maybe String,
    -- |
    proxy_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditProxy where
  show
    EditProxy
      { _type = _type,
        enable = enable,
        port = port,
        server = server,
        proxy_id = proxy_id
      } =
      "EditProxy"
        ++ U.cc
          [ U.p "_type" _type,
            U.p "enable" enable,
            U.p "port" port,
            U.p "server" server,
            U.p "proxy_id" proxy_id
          ]

instance T.ToJSON EditProxy where
  toJSON
    EditProxy
      { _type = _type,
        enable = enable,
        port = port,
        server = server,
        proxy_id = proxy_id
      } =
      A.object
        [ "@type" A..= T.String "editProxy",
          "type" A..= _type,
          "enable" A..= enable,
          "port" A..= port,
          "server" A..= server,
          "proxy_id" A..= proxy_id
        ]
