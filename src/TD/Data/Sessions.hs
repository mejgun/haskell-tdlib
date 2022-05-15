{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Sessions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Session as Session
import qualified Utils as U

-- |
data Sessions = -- | Contains a list of sessions @sessions List of sessions @inactive_session_ttl_days Number of days of inactivity before sessions will automatically be terminated; 1-366 days
  Sessions
  { -- |
    inactive_session_ttl_days :: Maybe Int,
    -- |
    sessions :: Maybe [Session.Session]
  }
  deriving (Eq)

instance Show Sessions where
  show
    Sessions
      { inactive_session_ttl_days = inactive_session_ttl_days_,
        sessions = sessions_
      } =
      "Sessions"
        ++ U.cc
          [ U.p "inactive_session_ttl_days" inactive_session_ttl_days_,
            U.p "sessions" sessions_
          ]

instance T.FromJSON Sessions where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "sessions" -> parseSessions v
      _ -> mempty
    where
      parseSessions :: A.Value -> T.Parser Sessions
      parseSessions = A.withObject "Sessions" $ \o -> do
        inactive_session_ttl_days_ <- o A..:? "inactive_session_ttl_days"
        sessions_ <- o A..:? "sessions"
        return $ Sessions {inactive_session_ttl_days = inactive_session_ttl_days_, sessions = sessions_}
  parseJSON _ = mempty

instance T.ToJSON Sessions where
  toJSON
    Sessions
      { inactive_session_ttl_days = inactive_session_ttl_days_,
        sessions = sessions_
      } =
      A.object
        [ "@type" A..= T.String "sessions",
          "inactive_session_ttl_days" A..= inactive_session_ttl_days_,
          "sessions" A..= sessions_
        ]
