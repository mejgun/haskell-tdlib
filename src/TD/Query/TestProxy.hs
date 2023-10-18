module TD.Query.TestProxy
  (TestProxy(..)
  , defaultTestProxy
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ProxyType as ProxyType

-- | Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data TestProxy
  = TestProxy
    { server  :: Maybe T.Text              -- ^ Proxy server domain or IP address
    , port    :: Maybe Int                 -- ^ Proxy server port
    , _type   :: Maybe ProxyType.ProxyType -- ^ Proxy type
    , dc_id   :: Maybe Int                 -- ^ Identifier of a datacenter with which to test connection
    , timeout :: Maybe Double              -- ^ The maximum overall timeout for the request
    }
  deriving (Eq, Show)

instance I.ShortShow TestProxy where
  shortShow
    TestProxy
      { server  = server_
      , port    = port_
      , _type   = _type_
      , dc_id   = dc_id_
      , timeout = timeout_
      }
        = "TestProxy"
          ++ I.cc
          [ "server"  `I.p` server_
          , "port"    `I.p` port_
          , "_type"   `I.p` _type_
          , "dc_id"   `I.p` dc_id_
          , "timeout" `I.p` timeout_
          ]

instance AT.ToJSON TestProxy where
  toJSON
    TestProxy
      { server  = server_
      , port    = port_
      , _type   = _type_
      , dc_id   = dc_id_
      , timeout = timeout_
      }
        = A.object
          [ "@type"   A..= AT.String "testProxy"
          , "server"  A..= server_
          , "port"    A..= port_
          , "type"    A..= _type_
          , "dc_id"   A..= dc_id_
          , "timeout" A..= timeout_
          ]

defaultTestProxy :: TestProxy
defaultTestProxy =
  TestProxy
    { server  = Nothing
    , port    = Nothing
    , _type   = Nothing
    , dc_id   = Nothing
    , timeout = Nothing
    }

