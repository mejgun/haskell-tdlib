-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

--main = putStrLn "ok"

data SetScopeNotificationSettings = 
 SetScopeNotificationSettings { notification_settings :: ScopeNotificationSettings.ScopeNotificationSettings, scope :: NotificationSettingsScope.NotificationSettingsScope }  -- deriving (Show)

instance T.ToJSON SetScopeNotificationSettings where
 toJSON (SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }) =
  A.object [ "@type" A..= T.String "setScopeNotificationSettings", "notification_settings" A..= notification_settings, "scope" A..= scope ]
-- setScopeNotificationSettings SetScopeNotificationSettings  { notification_settings :: ScopeNotificationSettings.ScopeNotificationSettings, scope :: NotificationSettingsScope.NotificationSettingsScope } 

