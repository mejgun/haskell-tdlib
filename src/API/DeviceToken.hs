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
 | DeviceTokenTizenPush { reg_id :: String }  deriving (Show)

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



instance T.FromJSON DeviceToken where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deviceTokenFirebaseCloudMessaging" -> parseDeviceTokenFirebaseCloudMessaging v
   "deviceTokenApplePush" -> parseDeviceTokenApplePush v
   "deviceTokenApplePushVoIP" -> parseDeviceTokenApplePushVoIP v
   "deviceTokenWindowsPush" -> parseDeviceTokenWindowsPush v
   "deviceTokenMicrosoftPush" -> parseDeviceTokenMicrosoftPush v
   "deviceTokenMicrosoftPushVoIP" -> parseDeviceTokenMicrosoftPushVoIP v
   "deviceTokenWebPush" -> parseDeviceTokenWebPush v
   "deviceTokenSimplePush" -> parseDeviceTokenSimplePush v
   "deviceTokenUbuntuPush" -> parseDeviceTokenUbuntuPush v
   "deviceTokenBlackBerryPush" -> parseDeviceTokenBlackBerryPush v
   "deviceTokenTizenPush" -> parseDeviceTokenTizenPush v

   _ -> mempty ""
  where
   parseDeviceTokenFirebaseCloudMessaging :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenFirebaseCloudMessaging = A.withObject "DeviceTokenFirebaseCloudMessaging" $ \o -> do
    encrypt <- o A..: "encrypt"
    token <- o A..: "token"
    return $ DeviceTokenFirebaseCloudMessaging { encrypt = encrypt, token = token }

   parseDeviceTokenApplePush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenApplePush = A.withObject "DeviceTokenApplePush" $ \o -> do
    is_app_sandbox <- o A..: "is_app_sandbox"
    device_token <- o A..: "device_token"
    return $ DeviceTokenApplePush { is_app_sandbox = is_app_sandbox, device_token = device_token }

   parseDeviceTokenApplePushVoIP :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenApplePushVoIP = A.withObject "DeviceTokenApplePushVoIP" $ \o -> do
    encrypt <- o A..: "encrypt"
    is_app_sandbox <- o A..: "is_app_sandbox"
    device_token <- o A..: "device_token"
    return $ DeviceTokenApplePushVoIP { encrypt = encrypt, is_app_sandbox = is_app_sandbox, device_token = device_token }

   parseDeviceTokenWindowsPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenWindowsPush = A.withObject "DeviceTokenWindowsPush" $ \o -> do
    access_token <- o A..: "access_token"
    return $ DeviceTokenWindowsPush { access_token = access_token }

   parseDeviceTokenMicrosoftPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenMicrosoftPush = A.withObject "DeviceTokenMicrosoftPush" $ \o -> do
    channel_uri <- o A..: "channel_uri"
    return $ DeviceTokenMicrosoftPush { channel_uri = channel_uri }

   parseDeviceTokenMicrosoftPushVoIP :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenMicrosoftPushVoIP = A.withObject "DeviceTokenMicrosoftPushVoIP" $ \o -> do
    channel_uri <- o A..: "channel_uri"
    return $ DeviceTokenMicrosoftPushVoIP { channel_uri = channel_uri }

   parseDeviceTokenWebPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenWebPush = A.withObject "DeviceTokenWebPush" $ \o -> do
    auth_base64url <- o A..: "auth_base64url"
    p256dh_base64url <- o A..: "p256dh_base64url"
    endpoint <- o A..: "endpoint"
    return $ DeviceTokenWebPush { auth_base64url = auth_base64url, p256dh_base64url = p256dh_base64url, endpoint = endpoint }

   parseDeviceTokenSimplePush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenSimplePush = A.withObject "DeviceTokenSimplePush" $ \o -> do
    endpoint <- o A..: "endpoint"
    return $ DeviceTokenSimplePush { endpoint = endpoint }

   parseDeviceTokenUbuntuPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenUbuntuPush = A.withObject "DeviceTokenUbuntuPush" $ \o -> do
    token <- o A..: "token"
    return $ DeviceTokenUbuntuPush { token = token }

   parseDeviceTokenBlackBerryPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenBlackBerryPush = A.withObject "DeviceTokenBlackBerryPush" $ \o -> do
    token <- o A..: "token"
    return $ DeviceTokenBlackBerryPush { token = token }

   parseDeviceTokenTizenPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenTizenPush = A.withObject "DeviceTokenTizenPush" $ \o -> do
    reg_id <- o A..: "reg_id"
    return $ DeviceTokenTizenPush { reg_id = reg_id }