module TD.Query.GetTonConnectDAppPendingRequests
  (GetTonConnectDAppPendingRequests(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns pending requests with a dApp through TON Connect. Returns 'TD.Data.TonConnectRequests.TonConnectRequests'
data GetTonConnectDAppPendingRequests
  = GetTonConnectDAppPendingRequests
    { dapp_client_id :: Maybe T.Text -- ^ Hex-encoded public X25519 key of the dApp
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonConnectDAppPendingRequests where
  shortShow
    GetTonConnectDAppPendingRequests
      { dapp_client_id = dapp_client_id_
      }
        = "GetTonConnectDAppPendingRequests"
          ++ I.cc
          [ "dapp_client_id" `I.p` dapp_client_id_
          ]

instance AT.ToJSON GetTonConnectDAppPendingRequests where
  toJSON
    GetTonConnectDAppPendingRequests
      { dapp_client_id = dapp_client_id_
      }
        = A.object
          [ "@type"          A..= AT.String "getTonConnectDAppPendingRequests"
          , "dapp_client_id" A..= dapp_client_id_
          ]

