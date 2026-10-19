module TD.Query.GetTonConnectSessionPendingRequests
  (GetTonConnectSessionPendingRequests(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns pending requests in a TON Connect session. Returns 'TD.Data.TonConnectRequests.TonConnectRequests'
data GetTonConnectSessionPendingRequests
  = GetTonConnectSessionPendingRequests
    { session_id :: Maybe Int -- ^ Unique identifier of the session
    }
  deriving (Eq, Show)

instance I.ShortShow GetTonConnectSessionPendingRequests where
  shortShow
    GetTonConnectSessionPendingRequests
      { session_id = session_id_
      }
        = "GetTonConnectSessionPendingRequests"
          ++ I.cc
          [ "session_id" `I.p` session_id_
          ]

instance AT.ToJSON GetTonConnectSessionPendingRequests where
  toJSON
    GetTonConnectSessionPendingRequests
      { session_id = session_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getTonConnectSessionPendingRequests"
          , "session_id" A..= fmap I.writeInt64  session_id_
          ]

