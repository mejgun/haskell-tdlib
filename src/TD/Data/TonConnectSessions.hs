module TD.Data.TonConnectSessions
  (TonConnectSessions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TonConnectSession as TonConnectSession

data TonConnectSessions
  = TonConnectSessions -- ^ Contains a list of TON Connect sessions
    { sessions :: Maybe [TonConnectSession.TonConnectSession] -- ^ The list of sessions
    }
  deriving (Eq, Show)

instance I.ShortShow TonConnectSessions where
  shortShow TonConnectSessions
    { sessions = sessions_
    }
      = "TonConnectSessions"
        ++ I.cc
        [ "sessions" `I.p` sessions_
        ]

instance AT.FromJSON TonConnectSessions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectSessions" -> parseTonConnectSessions v
      _                    -> mempty
    
    where
      parseTonConnectSessions :: A.Value -> AT.Parser TonConnectSessions
      parseTonConnectSessions = A.withObject "TonConnectSessions" $ \o -> do
        sessions_ <- o A..:?  "sessions"
        pure $ TonConnectSessions
          { sessions = sessions_
          }
  parseJSON _ = mempty

