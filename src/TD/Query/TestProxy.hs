{-# LANGUAGE OverloadedStrings #-}

module TD.Query.TestProxy where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ProxyType as ProxyType
import qualified Utils as U

-- |
-- Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization @server Proxy server IP address @port Proxy server port @type Proxy type
data TestProxy = TestProxy
  { -- |
    timeout :: Maybe Float,
    -- | Identifier of a datacenter with which to test connection @timeout The maximum overall timeout for the request
    dc_id :: Maybe Int,
    -- |
    _type :: Maybe ProxyType.ProxyType,
    -- |
    port :: Maybe Int,
    -- |
    server :: Maybe String
  }
  deriving (Eq)

instance Show TestProxy where
  show
    TestProxy
      { timeout = timeout,
        dc_id = dc_id,
        _type = _type,
        port = port,
        server = server
      } =
      "TestProxy"
        ++ U.cc
          [ U.p "timeout" timeout,
            U.p "dc_id" dc_id,
            U.p "_type" _type,
            U.p "port" port,
            U.p "server" server
          ]

instance T.ToJSON TestProxy where
  toJSON
    TestProxy
      { timeout = timeout,
        dc_id = dc_id,
        _type = _type,
        port = port,
        server = server
      } =
      A.object
        [ "@type" A..= T.String "testProxy",
          "timeout" A..= timeout,
          "dc_id" A..= dc_id,
          "type" A..= _type,
          "port" A..= port,
          "server" A..= server
        ]
