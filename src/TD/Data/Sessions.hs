module TD.Data.Sessions
  (Sessions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Session as Session

data Sessions
  = Sessions -- ^ Contains a list of sessions
    { sessions                  :: Maybe [Session.Session] -- ^ List of sessions
    , inactive_session_ttl_days :: Maybe Int               -- ^ Number of days of inactivity before sessions will automatically be terminated; 1-366 days
    }
  deriving (Eq, Show)

instance I.ShortShow Sessions where
  shortShow Sessions
    { sessions                  = sessions_
    , inactive_session_ttl_days = inactive_session_ttl_days_
    }
      = "Sessions"
        ++ I.cc
        [ "sessions"                  `I.p` sessions_
        , "inactive_session_ttl_days" `I.p` inactive_session_ttl_days_
        ]

instance AT.FromJSON Sessions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "sessions" -> parseSessions v
      _          -> mempty
    
    where
      parseSessions :: A.Value -> AT.Parser Sessions
      parseSessions = A.withObject "Sessions" $ \o -> do
        sessions_                  <- o A..:?  "sessions"
        inactive_session_ttl_days_ <- o A..:?  "inactive_session_ttl_days"
        pure $ Sessions
          { sessions                  = sessions_
          , inactive_session_ttl_days = inactive_session_ttl_days_
          }
  parseJSON _ = mempty

