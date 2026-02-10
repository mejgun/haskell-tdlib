module TD.Query.TestProxy
  (TestProxy(..)
  , defaultTestProxy
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Proxy as Proxy

-- | Sends a simple network request to the Telegram servers via proxy; for testing only. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data TestProxy
  = TestProxy
    { proxy   :: Maybe Proxy.Proxy -- ^ The proxy to test
    , dc_id   :: Maybe Int         -- ^ Identifier of a datacenter with which to test connection
    , timeout :: Maybe Double      -- ^ The maximum overall timeout for the request
    }
  deriving (Eq, Show)

instance I.ShortShow TestProxy where
  shortShow
    TestProxy
      { proxy   = proxy_
      , dc_id   = dc_id_
      , timeout = timeout_
      }
        = "TestProxy"
          ++ I.cc
          [ "proxy"   `I.p` proxy_
          , "dc_id"   `I.p` dc_id_
          , "timeout" `I.p` timeout_
          ]

instance AT.ToJSON TestProxy where
  toJSON
    TestProxy
      { proxy   = proxy_
      , dc_id   = dc_id_
      , timeout = timeout_
      }
        = A.object
          [ "@type"   A..= AT.String "testProxy"
          , "proxy"   A..= proxy_
          , "dc_id"   A..= dc_id_
          , "timeout" A..= timeout_
          ]

defaultTestProxy :: TestProxy
defaultTestProxy =
  TestProxy
    { proxy   = Nothing
    , dc_id   = Nothing
    , timeout = Nothing
    }

