-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DeviceToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeviceToken = 
 DeviceTokenFirebaseCloudMessaging { encrypt :: Bool, token :: String }  
 | DeviceTokenApplePush { is_app_sandbox :: Bool, device_token :: String }  
 | DeviceTokenApplePushVoIP { encrypt :: Bool, is_app_sandbox :: Bool, device_token :: String }  
 | DeviceTokenWindowsPush { access_token :: String }  
 | DeviceTokenMicrosoftPush { channel_uri :: String }  
 | DeviceTokenMicrosoftPushVoIP { channel_uri :: String }  
 | DeviceTokenWebPush { auth_base64url :: String, p256dh_base64url :: String, endpoint :: String }  
 | DeviceTokenSimplePush { endpoint :: String }  
 | DeviceTokenUbuntuPush { token :: String }  
 | DeviceTokenBlackBerryPush { token :: String }  
 | DeviceTokenTizenPush { reg_id :: String }  -- deriving (Show)

instance T.ToJSON DeviceToken where
 toJSON (DeviceTokenFirebaseCloudMessaging { encrypt = encrypt, token = token }) =
  A.object [ "@type" A..= T.String "deviceTokenFirebaseCloudMessaging", "encrypt" A..= encrypt, "token" A..= token ]

 toJSON (DeviceTokenApplePush { is_app_sandbox = is_app_sandbox, device_token = device_token }) =
  A.object [ "@type" A..= T.String "deviceTokenApplePush", "is_app_sandbox" A..= is_app_sandbox, "device_token" A..= device_token ]

 toJSON (DeviceTokenApplePushVoIP { encrypt = encrypt, is_app_sandbox = is_app_sandbox, device_token = device_token }) =
  A.object [ "@type" A..= T.String "deviceTokenApplePushVoIP", "encrypt" A..= encrypt, "is_app_sandbox" A..= is_app_sandbox, "device_token" A..= device_token ]

 toJSON (DeviceTokenWindowsPush { access_token = access_token }) =
  A.object [ "@type" A..= T.String "deviceTokenWindowsPush", "access_token" A..= access_token ]

 toJSON (DeviceTokenMicrosoftPush { channel_uri = channel_uri }) =
  A.object [ "@type" A..= T.String "deviceTokenMicrosoftPush", "channel_uri" A..= channel_uri ]

 toJSON (DeviceTokenMicrosoftPushVoIP { channel_uri = channel_uri }) =
  A.object [ "@type" A..= T.String "deviceTokenMicrosoftPushVoIP", "channel_uri" A..= channel_uri ]

 toJSON (DeviceTokenWebPush { auth_base64url = auth_base64url, p256dh_base64url = p256dh_base64url, endpoint = endpoint }) =
  A.object [ "@type" A..= T.String "deviceTokenWebPush", "auth_base64url" A..= auth_base64url, "p256dh_base64url" A..= p256dh_base64url, "endpoint" A..= endpoint ]

 toJSON (DeviceTokenSimplePush { endpoint = endpoint }) =
  A.object [ "@type" A..= T.String "deviceTokenSimplePush", "endpoint" A..= endpoint ]

 toJSON (DeviceTokenUbuntuPush { token = token }) =
  A.object [ "@type" A..= T.String "deviceTokenUbuntuPush", "token" A..= token ]

 toJSON (DeviceTokenBlackBerryPush { token = token }) =
  A.object [ "@type" A..= T.String "deviceTokenBlackBerryPush", "token" A..= token ]

 toJSON (DeviceTokenTizenPush { reg_id = reg_id }) =
  A.object [ "@type" A..= T.String "deviceTokenTizenPush", "reg_id" A..= reg_id ]
-- deviceTokenFirebaseCloudMessaging DeviceToken  { encrypt :: Bool, token :: String } 

-- deviceTokenApplePush DeviceToken  { is_app_sandbox :: Bool, device_token :: String } 

-- deviceTokenApplePushVoIP DeviceToken  { encrypt :: Bool, is_app_sandbox :: Bool, device_token :: String } 

-- deviceTokenWindowsPush DeviceToken  { access_token :: String } 

-- deviceTokenMicrosoftPush DeviceToken  { channel_uri :: String } 

-- deviceTokenMicrosoftPushVoIP DeviceToken  { channel_uri :: String } 

-- deviceTokenWebPush DeviceToken  { auth_base64url :: String, p256dh_base64url :: String, endpoint :: String } 

-- deviceTokenSimplePush DeviceToken  { endpoint :: String } 

-- deviceTokenUbuntuPush DeviceToken  { token :: String } 

-- deviceTokenBlackBerryPush DeviceToken  { token :: String } 

-- deviceTokenTizenPush DeviceToken  { reg_id :: String } 

