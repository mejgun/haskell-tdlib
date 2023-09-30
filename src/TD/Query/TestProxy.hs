{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TestProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProxyType as ProxyType
import qualified Utils as U

-- |
-- Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization
data TestProxy = TestProxy
  { -- | The maximum overall timeout for the request
    timeout :: Maybe Float,
    -- | Identifier of a datacenter with which to test connection
    dc_id :: Maybe Int,
    -- | Proxy type
    _type :: Maybe ProxyType.ProxyType,
    -- | Proxy server port
    port :: Maybe Int,
    -- | Proxy server domain or IP address
    server :: Maybe String
  }
  deriving (Eq)

instance Show TestProxy where
  show
    TestProxy
      { timeout = timeout_,
        dc_id = dc_id_,
        _type = _type_,
        port = port_,
        server = server_
      } =
      "TestProxy"
        ++ U.cc
          [ U.p "timeout" timeout_,
            U.p "dc_id" dc_id_,
            U.p "_type" _type_,
            U.p "port" port_,
            U.p "server" server_
          ]

instance T.ToJSON TestProxy where
  toJSON
    TestProxy
      { timeout = timeout_,
        dc_id = dc_id_,
        _type = _type_,
        port = port_,
        server = server_
      } =
      A.object
        [ "@type" A..= T.String "testProxy",
          "timeout" A..= timeout_,
          "dc_id" A..= dc_id_,
          "type" A..= _type_,
          "port" A..= port_,
          "server" A..= server_
        ]
