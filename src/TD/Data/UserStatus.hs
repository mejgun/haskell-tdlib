module TD.Data.UserStatus
  (UserStatus(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the last time the user was online
data UserStatus
  = UserStatusEmpty -- ^ The user's status has never been changed
  | UserStatusOnline -- ^ The user is online
    { expires :: Maybe Int -- ^ Point in time (Unix timestamp) when the user's online status will expire
    }
  | UserStatusOffline -- ^ The user is offline
    { was_online :: Maybe Int -- ^ Point in time (Unix timestamp) when the user was last online
    }
  | UserStatusRecently -- ^ The user was online recently
    { by_my_privacy_settings :: Maybe Bool -- ^ Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
    }
  | UserStatusLastWeek -- ^ The user is offline, but was online last week
    { by_my_privacy_settings :: Maybe Bool -- ^ Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
    }
  | UserStatusLastMonth -- ^ The user is offline, but was online last month
    { by_my_privacy_settings :: Maybe Bool -- ^ Exact user's status is hidden because the current user enabled userPrivacySettingShowStatus privacy setting for the user and has no Telegram Premium
    }
  deriving (Eq, Show)

instance I.ShortShow UserStatus where
  shortShow UserStatusEmpty
      = "UserStatusEmpty"
  shortShow UserStatusOnline
    { expires = expires_
    }
      = "UserStatusOnline"
        ++ I.cc
        [ "expires" `I.p` expires_
        ]
  shortShow UserStatusOffline
    { was_online = was_online_
    }
      = "UserStatusOffline"
        ++ I.cc
        [ "was_online" `I.p` was_online_
        ]
  shortShow UserStatusRecently
    { by_my_privacy_settings = by_my_privacy_settings_
    }
      = "UserStatusRecently"
        ++ I.cc
        [ "by_my_privacy_settings" `I.p` by_my_privacy_settings_
        ]
  shortShow UserStatusLastWeek
    { by_my_privacy_settings = by_my_privacy_settings_
    }
      = "UserStatusLastWeek"
        ++ I.cc
        [ "by_my_privacy_settings" `I.p` by_my_privacy_settings_
        ]
  shortShow UserStatusLastMonth
    { by_my_privacy_settings = by_my_privacy_settings_
    }
      = "UserStatusLastMonth"
        ++ I.cc
        [ "by_my_privacy_settings" `I.p` by_my_privacy_settings_
        ]

instance AT.FromJSON UserStatus where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "userStatusEmpty"     -> pure UserStatusEmpty
      "userStatusOnline"    -> parseUserStatusOnline v
      "userStatusOffline"   -> parseUserStatusOffline v
      "userStatusRecently"  -> parseUserStatusRecently v
      "userStatusLastWeek"  -> parseUserStatusLastWeek v
      "userStatusLastMonth" -> parseUserStatusLastMonth v
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
      parseUserStatusRecently :: A.Value -> AT.Parser UserStatus
      parseUserStatusRecently = A.withObject "UserStatusRecently" $ \o -> do
        by_my_privacy_settings_ <- o A..:?  "by_my_privacy_settings"
        pure $ UserStatusRecently
          { by_my_privacy_settings = by_my_privacy_settings_
          }
      parseUserStatusLastWeek :: A.Value -> AT.Parser UserStatus
      parseUserStatusLastWeek = A.withObject "UserStatusLastWeek" $ \o -> do
        by_my_privacy_settings_ <- o A..:?  "by_my_privacy_settings"
        pure $ UserStatusLastWeek
          { by_my_privacy_settings = by_my_privacy_settings_
          }
      parseUserStatusLastMonth :: A.Value -> AT.Parser UserStatus
      parseUserStatusLastMonth = A.withObject "UserStatusLastMonth" $ \o -> do
        by_my_privacy_settings_ <- o A..:?  "by_my_privacy_settings"
        pure $ UserStatusLastMonth
          { by_my_privacy_settings = by_my_privacy_settings_
          }
  parseJSON _ = mempty

