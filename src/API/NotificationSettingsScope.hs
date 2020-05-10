-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationSettingsScope where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes the types of chats to which notification settings are applied
data NotificationSettingsScope = 
 -- |
 -- 
 -- Notification settings applied to all private and secret chats when the corresponding chat setting has a default value
 NotificationSettingsScopePrivateChats |
 -- |
 -- 
 -- Notification settings applied to all basic groups and supergroups when the corresponding chat setting has a default value
 NotificationSettingsScopeGroupChats |
 -- |
 -- 
 -- Notification settings applied to all channels when the corresponding chat setting has a default value
 NotificationSettingsScopeChannelChats deriving (Show, Eq)

instance T.ToJSON NotificationSettingsScope where
 toJSON (NotificationSettingsScopePrivateChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopePrivateChats" ]

 toJSON (NotificationSettingsScopeGroupChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopeGroupChats" ]

 toJSON (NotificationSettingsScopeChannelChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopeChannelChats" ]

instance T.FromJSON NotificationSettingsScope where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "notificationSettingsScopePrivateChats" -> parseNotificationSettingsScopePrivateChats v
   "notificationSettingsScopeGroupChats" -> parseNotificationSettingsScopeGroupChats v
   "notificationSettingsScopeChannelChats" -> parseNotificationSettingsScopeChannelChats v
   _ -> mempty
  where
   parseNotificationSettingsScopePrivateChats :: A.Value -> T.Parser NotificationSettingsScope
   parseNotificationSettingsScopePrivateChats = A.withObject "NotificationSettingsScopePrivateChats" $ \o -> do
    return $ NotificationSettingsScopePrivateChats {  }

   parseNotificationSettingsScopeGroupChats :: A.Value -> T.Parser NotificationSettingsScope
   parseNotificationSettingsScopeGroupChats = A.withObject "NotificationSettingsScopeGroupChats" $ \o -> do
    return $ NotificationSettingsScopeGroupChats {  }

   parseNotificationSettingsScopeChannelChats :: A.Value -> T.Parser NotificationSettingsScope
   parseNotificationSettingsScopeChannelChats = A.withObject "NotificationSettingsScopeChannelChats" $ \o -> do
    return $ NotificationSettingsScopeChannelChats {  }