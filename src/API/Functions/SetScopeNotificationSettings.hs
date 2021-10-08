-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetScopeNotificationSettings where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ScopeNotificationSettings as ScopeNotificationSettings
import {-# SOURCE #-} qualified API.NotificationSettingsScope as NotificationSettingsScope

-- |
-- 
-- Changes notification settings for chats of a given type 
-- 
-- __scope__ Types of chats for which to change the notification settings
-- 
-- __notification_settings__ The new notification settings for the given scope
data SetScopeNotificationSettings = 

 SetScopeNotificationSettings { notification_settings :: Maybe ScopeNotificationSettings.ScopeNotificationSettings, scope :: Maybe NotificationSettingsScope.NotificationSettingsScope }  deriving (Eq)

instance Show SetScopeNotificationSettings where
 show SetScopeNotificationSettings { notification_settings=notification_settings, scope=scope } =
  "SetScopeNotificationSettings" ++ cc [p "notification_settings" notification_settings, p "scope" scope ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetScopeNotificationSettings where
 toJSON SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope } =
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
    notification_settings <- o A..:? "notification_settings"
    scope <- o A..:? "scope"
    return $ SetScopeNotificationSettings { notification_settings = notification_settings, scope = scope }
 parseJSON _ = mempty
