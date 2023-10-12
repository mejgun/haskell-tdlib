module TD.Data.UserStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data UserStatus -- ^ Describes the last time the user was online
  = UserStatusEmpty -- ^ The user status was never changed
  | UserStatusOnline -- ^ The user is online
    { expires :: Maybe Int -- ^ Point in time (Unix timestamp) when the user's online status will expire
    }
  | UserStatusOffline -- ^ The user is offline
    { was_online :: Maybe Int -- ^ Point in time (Unix timestamp) when the user was last online
    }
  | UserStatusRecently -- ^ The user was online recently
  | UserStatusLastWeek -- ^ The user is offline, but was online last week
  | UserStatusLastMonth -- ^ The user is offline, but was online last month
  deriving (Eq)

instance Show UserStatus where
  show UserStatusEmpty
      = "UserStatusEmpty"
  show UserStatusOnline
    { expires = expires_
    }
      = "UserStatusOnline"
        ++ I.cc
        [ "expires" `I.p` expires_
        ]
  show UserStatusOffline
    { was_online = was_online_
    }
      = "UserStatusOffline"
        ++ I.cc
        [ "was_online" `I.p` was_online_
        ]
  show UserStatusRecently
      = "UserStatusRecently"
  show UserStatusLastWeek
      = "UserStatusLastWeek"
  show UserStatusLastMonth
      = "UserStatusLastMonth"

instance AT.FromJSON UserStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userStatusEmpty"     -> pure UserStatusEmpty
      "userStatusOnline"    -> parseUserStatusOnline v
      "userStatusOffline"   -> parseUserStatusOffline v
      "userStatusRecently"  -> pure UserStatusRecently
      "userStatusLastWeek"  -> pure UserStatusLastWeek
      "userStatusLastMonth" -> pure UserStatusLastMonth
      _                     -> mempty
    
    where
      parseUserStatusOnline :: A.Value -> AT.Parser UserStatus
      parseUserStatusOnline = A.withObject "UserStatusOnline" $ \o -> do
        expires_ <- o A..:?  "expires"
        pure $ UserStatusOnline
          { expires = expires_
          }
      parseUserStatusOffline :: A.Value -> AT.Parser UserStatus
      parseUserStatusOffline = A.withObject "UserStatusOffline" $ \o -> do
        was_online_ <- o A..:?  "was_online"
        pure $ UserStatusOffline
          { was_online = was_online_
          }

instance AT.ToJSON UserStatus where
  toJSON UserStatusEmpty
      = A.object
        [ "@type" A..= AT.String "userStatusEmpty"
        ]
  toJSON UserStatusOnline
    { expires = expires_
    }
      = A.object
        [ "@type"   A..= AT.String "userStatusOnline"
        , "expires" A..= expires_
        ]
  toJSON UserStatusOffline
    { was_online = was_online_
    }
      = A.object
        [ "@type"      A..= AT.String "userStatusOffline"
        , "was_online" A..= was_online_
        ]
  toJSON UserStatusRecently
      = A.object
        [ "@type" A..= AT.String "userStatusRecently"
        ]
  toJSON UserStatusLastWeek
      = A.object
        [ "@type" A..= AT.String "userStatusLastWeek"
        ]
  toJSON UserStatusLastMonth
      = A.object
        [ "@type" A..= AT.String "userStatusLastMonth"
        ]
