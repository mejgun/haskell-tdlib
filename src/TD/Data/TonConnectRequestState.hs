module TD.Data.TonConnectRequestState
  (TonConnectRequestState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes state of a request received from a dApp through TON Connect
data TonConnectRequestState
  = TonConnectRequestStatePending -- ^ The request must be accepted or rejected if it isn't expired yet
    { expiration_date :: Maybe Int -- ^ Point in time (Unix timestamp) when the request will expire or has expired
    }
  | TonConnectRequestStateAccepted -- ^ The request was accepted
  | TonConnectRequestStateRejected -- ^ The request was rejected
  deriving (Eq, Show)

instance I.ShortShow TonConnectRequestState where
  shortShow TonConnectRequestStatePending
    { expiration_date = expiration_date_
    }
      = "TonConnectRequestStatePending"
        ++ I.cc
        [ "expiration_date" `I.p` expiration_date_
        ]
  shortShow TonConnectRequestStateAccepted
      = "TonConnectRequestStateAccepted"
  shortShow TonConnectRequestStateRejected
      = "TonConnectRequestStateRejected"

instance AT.FromJSON TonConnectRequestState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectRequestStatePending"  -> parseTonConnectRequestStatePending v
      "tonConnectRequestStateAccepted" -> pure TonConnectRequestStateAccepted
      "tonConnectRequestStateRejected" -> pure TonConnectRequestStateRejected
      _                                -> mempty
    
    where
      parseTonConnectRequestStatePending :: A.Value -> AT.Parser TonConnectRequestState
      parseTonConnectRequestStatePending = A.withObject "TonConnectRequestStatePending" $ \o -> do
        expiration_date_ <- o A..:?  "expiration_date"
        pure $ TonConnectRequestStatePending
          { expiration_date = expiration_date_
          }
  parseJSON _ = mempty

