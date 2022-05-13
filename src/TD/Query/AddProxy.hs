{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProxyType as ProxyType
import qualified Utils as U

-- |
-- Adds a proxy server for network requests. Can be called before authorization @server Proxy server IP address @port Proxy server port @enable Pass true to immediately enable the proxy @type Proxy type
data AddProxy = AddProxy
  { -- |
    _type :: Maybe ProxyType.ProxyType,
    -- |
    enable :: Maybe Bool,
    -- |
    port :: Maybe Int,
    -- |
    server :: Maybe String
  }
  deriving (Eq)

instance Show AddProxy where
  show
    AddProxy
      { _type = _type_,
        enable = enable_,
        port = port_,
        server = server_
      } =
      "AddProxy"
        ++ U.cc
          [ U.p "_type" _type_,
            U.p "enable" enable_,
            U.p "port" port_,
            U.p "server" server_
          ]

instance T.ToJSON AddProxy where
  toJSON
    AddProxy
      { _type = _type_,
        enable = enable_,
        port = port_,
        server = server_
      } =
      A.object
        [ "@type" A..= T.String "addProxy",
          "type" A..= _type_,
          "enable" A..= enable_,
          "port" A..= port_,
          "server" A..= server_
        ]
