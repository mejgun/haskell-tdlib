-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NotificationSettingsScope where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data NotificationSettingsScope = 
 NotificationSettingsScopePrivateChats 
 | NotificationSettingsScopeGroupChats 
 | NotificationSettingsScopeChannelChats -- deriving (Show)

instance T.ToJSON NotificationSettingsScope where
 toJSON (NotificationSettingsScopePrivateChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopePrivateChats" ]

 toJSON (NotificationSettingsScopeGroupChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopeGroupChats" ]

 toJSON (NotificationSettingsScopeChannelChats {  }) =
  A.object [ "@type" A..= T.String "notificationSettingsScopeChannelChats" ]
-- notificationSettingsScopePrivateChats NotificationSettingsScope 

-- notificationSettingsScopeGroupChats NotificationSettingsScope 

-- notificationSettingsScopeChannelChats NotificationSettingsScope 

