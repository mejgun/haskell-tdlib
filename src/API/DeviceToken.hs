-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DeviceToken where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org
data DeviceToken = 
 -- |
 -- 
 -- A token for Firebase Cloud Messaging 
 -- 
 -- __token__ Device registration token; may be empty to deregister a device
 -- 
 -- __encrypt__ True, if push notifications must be additionally encrypted
 DeviceTokenFirebaseCloudMessaging { encrypt :: Maybe Bool, token :: Maybe String }  |
 -- |
 -- 
 -- A token for Apple Push Notification service 
 -- 
 -- __device_token__ Device token; may be empty to deregister a device
 -- 
 -- __is_app_sandbox__ True, if App Sandbox is enabled
 DeviceTokenApplePush { is_app_sandbox :: Maybe Bool, device_token :: Maybe String }  |
 -- |
 -- 
 -- A token for Apple Push Notification service VoIP notifications 
 -- 
 -- __device_token__ Device token; may be empty to deregister a device
 -- 
 -- __is_app_sandbox__ True, if App Sandbox is enabled
 -- 
 -- __encrypt__ True, if push notifications must be additionally encrypted
 DeviceTokenApplePushVoIP { encrypt :: Maybe Bool, is_app_sandbox :: Maybe Bool, device_token :: Maybe String }  |
 -- |
 -- 
 -- A token for Windows Push Notification Services 
 -- 
 -- __access_token__ The access token that will be used to send notifications; may be empty to deregister a device
 DeviceTokenWindowsPush { access_token :: Maybe String }  |
 -- |
 -- 
 -- A token for Microsoft Push Notification Service 
 -- 
 -- __channel_uri__ Push notification channel URI; may be empty to deregister a device
 DeviceTokenMicrosoftPush { channel_uri :: Maybe String }  |
 -- |
 -- 
 -- A token for Microsoft Push Notification Service VoIP channel 
 -- 
 -- __channel_uri__ Push notification channel URI; may be empty to deregister a device
 DeviceTokenMicrosoftPushVoIP { channel_uri :: Maybe String }  |
 -- |
 -- 
 -- A token for web Push API 
 -- 
 -- __endpoint__ Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
 -- 
 -- __p256dh_base64url__ Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
 -- 
 -- __auth_base64url__ Base64url-encoded authentication secret
 DeviceTokenWebPush { auth_base64url :: Maybe String, p256dh_base64url :: Maybe String, endpoint :: Maybe String }  |
 -- |
 -- 
 -- A token for Simple Push API for Firefox OS 
 -- 
 -- __endpoint__ Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
 DeviceTokenSimplePush { endpoint :: Maybe String }  |
 -- |
 -- 
 -- A token for Ubuntu Push Client service 
 -- 
 -- __token__ Token; may be empty to deregister a device
 DeviceTokenUbuntuPush { token :: Maybe String }  |
 -- |
 -- 
 -- A token for BlackBerry Push Service 
 -- 
 -- __token__ Token; may be empty to deregister a device
 DeviceTokenBlackBerryPush { token :: Maybe String }  |
 -- |
 -- 
 -- A token for Tizen Push Service 
 -- 
 -- __reg_id__ Push service registration identifier; may be empty to deregister a device
 DeviceTokenTizenPush { reg_id :: Maybe String }  deriving (Eq)

instance Show DeviceToken where
 show DeviceTokenFirebaseCloudMessaging { encrypt=encrypt, token=token } =
  "DeviceTokenFirebaseCloudMessaging" ++ U.cc [U.p "encrypt" encrypt, U.p "token" token ]

 show DeviceTokenApplePush { is_app_sandbox=is_app_sandbox, device_token=device_token } =
  "DeviceTokenApplePush" ++ U.cc [U.p "is_app_sandbox" is_app_sandbox, U.p "device_token" device_token ]

 show DeviceTokenApplePushVoIP { encrypt=encrypt, is_app_sandbox=is_app_sandbox, device_token=device_token } =
  "DeviceTokenApplePushVoIP" ++ U.cc [U.p "encrypt" encrypt, U.p "is_app_sandbox" is_app_sandbox, U.p "device_token" device_token ]

 show DeviceTokenWindowsPush { access_token=access_token } =
  "DeviceTokenWindowsPush" ++ U.cc [U.p "access_token" access_token ]

 show DeviceTokenMicrosoftPush { channel_uri=channel_uri } =
  "DeviceTokenMicrosoftPush" ++ U.cc [U.p "channel_uri" channel_uri ]

 show DeviceTokenMicrosoftPushVoIP { channel_uri=channel_uri } =
  "DeviceTokenMicrosoftPushVoIP" ++ U.cc [U.p "channel_uri" channel_uri ]

 show DeviceTokenWebPush { auth_base64url=auth_base64url, p256dh_base64url=p256dh_base64url, endpoint=endpoint } =
  "DeviceTokenWebPush" ++ U.cc [U.p "auth_base64url" auth_base64url, U.p "p256dh_base64url" p256dh_base64url, U.p "endpoint" endpoint ]

 show DeviceTokenSimplePush { endpoint=endpoint } =
  "DeviceTokenSimplePush" ++ U.cc [U.p "endpoint" endpoint ]

 show DeviceTokenUbuntuPush { token=token } =
  "DeviceTokenUbuntuPush" ++ U.cc [U.p "token" token ]

 show DeviceTokenBlackBerryPush { token=token } =
  "DeviceTokenBlackBerryPush" ++ U.cc [U.p "token" token ]

 show DeviceTokenTizenPush { reg_id=reg_id } =
  "DeviceTokenTizenPush" ++ U.cc [U.p "reg_id" reg_id ]

instance T.ToJSON DeviceToken where
 toJSON DeviceTokenFirebaseCloudMessaging { encrypt = encrypt, token = token } =
  A.object [ "@type" A..= T.String "deviceTokenFirebaseCloudMessaging", "encrypt" A..= encrypt, "token" A..= token ]

 toJSON DeviceTokenApplePush { is_app_sandbox = is_app_sandbox, device_token = device_token } =
  A.object [ "@type" A..= T.String "deviceTokenApplePush", "is_app_sandbox" A..= is_app_sandbox, "device_token" A..= device_token ]

 toJSON DeviceTokenApplePushVoIP { encrypt = encrypt, is_app_sandbox = is_app_sandbox, device_token = device_token } =
  A.object [ "@type" A..= T.String "deviceTokenApplePushVoIP", "encrypt" A..= encrypt, "is_app_sandbox" A..= is_app_sandbox, "device_token" A..= device_token ]

 toJSON DeviceTokenWindowsPush { access_token = access_token } =
  A.object [ "@type" A..= T.String "deviceTokenWindowsPush", "access_token" A..= access_token ]

 toJSON DeviceTokenMicrosoftPush { channel_uri = channel_uri } =
  A.object [ "@type" A..= T.String "deviceTokenMicrosoftPush", "channel_uri" A..= channel_uri ]

 toJSON DeviceTokenMicrosoftPushVoIP { channel_uri = channel_uri } =
  A.object [ "@type" A..= T.String "deviceTokenMicrosoftPushVoIP", "channel_uri" A..= channel_uri ]

 toJSON DeviceTokenWebPush { auth_base64url = auth_base64url, p256dh_base64url = p256dh_base64url, endpoint = endpoint } =
  A.object [ "@type" A..= T.String "deviceTokenWebPush", "auth_base64url" A..= auth_base64url, "p256dh_base64url" A..= p256dh_base64url, "endpoint" A..= endpoint ]

 toJSON DeviceTokenSimplePush { endpoint = endpoint } =
  A.object [ "@type" A..= T.String "deviceTokenSimplePush", "endpoint" A..= endpoint ]

 toJSON DeviceTokenUbuntuPush { token = token } =
  A.object [ "@type" A..= T.String "deviceTokenUbuntuPush", "token" A..= token ]

 toJSON DeviceTokenBlackBerryPush { token = token } =
  A.object [ "@type" A..= T.String "deviceTokenBlackBerryPush", "token" A..= token ]

 toJSON DeviceTokenTizenPush { reg_id = reg_id } =
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
   _ -> mempty
  where
   parseDeviceTokenFirebaseCloudMessaging :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenFirebaseCloudMessaging = A.withObject "DeviceTokenFirebaseCloudMessaging" $ \o -> do
    encrypt <- o A..:? "encrypt"
    token <- o A..:? "token"
    return $ DeviceTokenFirebaseCloudMessaging { encrypt = encrypt, token = token }

   parseDeviceTokenApplePush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenApplePush = A.withObject "DeviceTokenApplePush" $ \o -> do
    is_app_sandbox <- o A..:? "is_app_sandbox"
    device_token <- o A..:? "device_token"
    return $ DeviceTokenApplePush { is_app_sandbox = is_app_sandbox, device_token = device_token }

   parseDeviceTokenApplePushVoIP :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenApplePushVoIP = A.withObject "DeviceTokenApplePushVoIP" $ \o -> do
    encrypt <- o A..:? "encrypt"
    is_app_sandbox <- o A..:? "is_app_sandbox"
    device_token <- o A..:? "device_token"
    return $ DeviceTokenApplePushVoIP { encrypt = encrypt, is_app_sandbox = is_app_sandbox, device_token = device_token }

   parseDeviceTokenWindowsPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenWindowsPush = A.withObject "DeviceTokenWindowsPush" $ \o -> do
    access_token <- o A..:? "access_token"
    return $ DeviceTokenWindowsPush { access_token = access_token }

   parseDeviceTokenMicrosoftPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenMicrosoftPush = A.withObject "DeviceTokenMicrosoftPush" $ \o -> do
    channel_uri <- o A..:? "channel_uri"
    return $ DeviceTokenMicrosoftPush { channel_uri = channel_uri }

   parseDeviceTokenMicrosoftPushVoIP :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenMicrosoftPushVoIP = A.withObject "DeviceTokenMicrosoftPushVoIP" $ \o -> do
    channel_uri <- o A..:? "channel_uri"
    return $ DeviceTokenMicrosoftPushVoIP { channel_uri = channel_uri }

   parseDeviceTokenWebPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenWebPush = A.withObject "DeviceTokenWebPush" $ \o -> do
    auth_base64url <- o A..:? "auth_base64url"
    p256dh_base64url <- o A..:? "p256dh_base64url"
    endpoint <- o A..:? "endpoint"
    return $ DeviceTokenWebPush { auth_base64url = auth_base64url, p256dh_base64url = p256dh_base64url, endpoint = endpoint }

   parseDeviceTokenSimplePush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenSimplePush = A.withObject "DeviceTokenSimplePush" $ \o -> do
    endpoint <- o A..:? "endpoint"
    return $ DeviceTokenSimplePush { endpoint = endpoint }

   parseDeviceTokenUbuntuPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenUbuntuPush = A.withObject "DeviceTokenUbuntuPush" $ \o -> do
    token <- o A..:? "token"
    return $ DeviceTokenUbuntuPush { token = token }

   parseDeviceTokenBlackBerryPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenBlackBerryPush = A.withObject "DeviceTokenBlackBerryPush" $ \o -> do
    token <- o A..:? "token"
    return $ DeviceTokenBlackBerryPush { token = token }

   parseDeviceTokenTizenPush :: A.Value -> T.Parser DeviceToken
   parseDeviceTokenTizenPush = A.withObject "DeviceTokenTizenPush" $ \o -> do
    reg_id <- o A..:? "reg_id"
    return $ DeviceTokenTizenPush { reg_id = reg_id }
 parseJSON _ = mempty
