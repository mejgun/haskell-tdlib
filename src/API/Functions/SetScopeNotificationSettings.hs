-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetScopeNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

--main = putStrLn "ok"

data SetScopeNotificationSettings = 
 SetScopeNotificationSettings { notification_settings :: ScopeNotificationSettings.ScopeNotificationSettings, scope :: NotificationSettingsScope.NotificationSettingsScope }  deriving (Show)

instance T.ToJSON SetScopeNotificationSettings where
 toJSON (SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }) =
  A.object [ "@type" A..= T.String "setScopeNotificationSettings", "notification_settings" A..= notification_settings, "scope" A..= scope ]



instance T.FromJSON SetScopeNotificationSettings where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setScopeNotificationSettings" -> parseSetScopeNotificationSettings v

   _ -> mempty ""
  where
   parseSetScopeNotificationSettings :: A.Value -> T.Parser SetScopeNotificationSettings
   parseSetScopeNotificationSettings = A.withObject "SetScopeNotificationSettings" $ \o -> do
    notification_settings <- o A..: "notification_settings"
    scope <- o A..: "scope"
    return $ SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }