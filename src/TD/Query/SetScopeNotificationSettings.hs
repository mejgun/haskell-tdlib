module TD.Query.SetScopeNotificationSettings
  (SetScopeNotificationSettings(..)
  , defaultSetScopeNotificationSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings

-- | Changes notification settings for chats of a given type. Returns 'TD.Data.Ok.Ok'
data SetScopeNotificationSettings
  = SetScopeNotificationSettings
    { scope                 :: Maybe NotificationSettingsScope.NotificationSettingsScope -- ^ Types of chats for which to change the notification settings
    , notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings -- ^ The new notification settings for the given scope
    }
  deriving (Eq, Show)

instance I.ShortShow SetScopeNotificationSettings where
  shortShow
    SetScopeNotificationSettings
      { scope                 = scope_
      , notification_settings = notification_settings_
      }
        = "SetScopeNotificationSettings"
          ++ I.cc
          [ "scope"                 `I.p` scope_
          , "notification_settings" `I.p` notification_settings_
          ]

instance AT.ToJSON SetScopeNotificationSettings where
  toJSON
    SetScopeNotificationSettings
      { scope                 = scope_
      , notification_settings = notification_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setScopeNotificationSettings"
          , "scope"                 A..= scope_
          , "notification_settings" A..= notification_settings_
          ]

defaultSetScopeNotificationSettings :: SetScopeNotificationSettings
defaultSetScopeNotificationSettings =
  SetScopeNotificationSettings
    { scope                 = Nothing
    , notification_settings = Nothing
    }

