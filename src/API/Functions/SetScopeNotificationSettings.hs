-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetScopeNotificationSettings where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

data SetScopeNotificationSettings = 
 SetScopeNotificationSettings { notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  deriving (Show, Eq)

instance T.ToJSON SetScopeNotificationSettings where
 toJSON (SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }) =
  A.object [ "@type" A..= T.String "setScopeNotificationSettings", "notification_settings" A..= notification_settings, "scope" A..= scope ]

instance T.FromJSON SetScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setScopeNotificationSettings" -> parseSetScopeNotificationSettings v
   _ -> mempty
  where
   parseSetScopeNotificationSettings :: A.Value -> T.Parser SetScopeNotificationSettings
   parseSetScopeNotificationSettings = A.withObject "SetScopeNotificationSettings" $ \o -> do
    notification_settings <- optional $ o A..: "notification_settings"
    scope <- optional $ o A..: "scope"
    return $ SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }