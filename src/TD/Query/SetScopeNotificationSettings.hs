{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NotificationSettingsScope as NotificationSettingsScope
import qualified TD.Data.ScopeNotificationSettings as ScopeNotificationSettings
import qualified Utils as U

-- |
-- Changes notification settings for chats of a given type @scope Types of chats for which to change the notification settings @notification_settings The new notification settings for the given scope
data SetScopeNotificationSettings = SetScopeNotificationSettings
  { -- |
    notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings,
    -- |
    scope :: Maybe NotificationSettingsScope.NotificationSettingsScope
  }
  deriving (Eq)

instance Show SetScopeNotificationSettings where
  show
    SetScopeNotificationSettings
      { notification_settings = notification_settings,
        scope = scope
      } =
      "SetScopeNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings,
            U.p "scope" scope
          ]

instance T.ToJSON SetScopeNotificationSettings where
  toJSON
    SetScopeNotificationSettings
      { notification_settings = notification_settings,
        scope = scope
      } =
      A.object
        [ "@type" A..= T.String "setScopeNotificationSettings",
          "notification_settings" A..= notification_settings,
          "scope" A..= scope
        ]
