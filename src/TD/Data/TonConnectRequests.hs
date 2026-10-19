module TD.Data.TonConnectRequests
  (TonConnectRequests(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonConnectSession as TonConnectSession
import qualified TD.Data.TonConnectRequest as TonConnectRequest

data TonConnectRequests
  = TonConnectRequests -- ^ Represents a session with its pending TON Connect requests
    { session  :: Maybe TonConnectSession.TonConnectSession   -- ^ The session
    , requests :: Maybe [TonConnectRequest.TonConnectRequest] -- ^ The requests
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectRequests where
  shortShow TonConnectRequests
    { session  = session_
    , requests = requests_
    }
      = "TonConnectRequests"
        ++ I.cc
        [ "session"  `I.p` session_
        , "requests" `I.p` requests_
        ]

instance AT.FromJSON TonConnectRequests where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectRequests" -> parseTonConnectRequests v
      _                    -> mempty
    
    where
      parseTonConnectRequests :: A.Value -> AT.Parser TonConnectRequests
      parseTonConnectRequests = A.withObject "TonConnectRequests" $ \o -> do
        session_  <- o A..:?  "session"
        requests_ <- o A..:?  "requests"
        pure $ TonConnectRequests
          { session  = session_
          , requests = requests_
          }
  parseJSON _ = mempty

