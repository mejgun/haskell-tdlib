{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.DeviceToken where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org
data DeviceToken
  = -- | A token for Firebase Cloud Messaging @token Device registration token; may be empty to deregister a device @encrypt True, if push notifications must be additionally encrypted
    DeviceTokenFirebaseCloudMessaging
      { -- |
        encrypt :: Maybe Bool,
        -- |
        token :: Maybe String
      }
  | -- | A token for Apple Push Notification service @device_token Device token; may be empty to deregister a device @is_app_sandbox True, if App Sandbox is enabled
    DeviceTokenApplePush
      { -- |
        is_app_sandbox :: Maybe Bool,
        -- |
        device_token :: Maybe String
      }
  | -- | A token for Apple Push Notification service VoIP notifications @device_token Device token; may be empty to deregister a device @is_app_sandbox True, if App Sandbox is enabled @encrypt True, if push notifications must be additionally encrypted
    DeviceTokenApplePushVoIP
      { -- |
        encrypt :: Maybe Bool,
        -- |
        is_app_sandbox :: Maybe Bool,
        -- |
        device_token :: Maybe String
      }
  | -- | A token for Windows Push Notification Services @access_token The access token that will be used to send notifications; may be empty to deregister a device
    DeviceTokenWindowsPush
      { -- |
        access_token :: Maybe String
      }
  | -- | A token for Microsoft Push Notification Service @channel_uri Push notification channel URI; may be empty to deregister a device
    DeviceTokenMicrosoftPush
      { -- |
        channel_uri :: Maybe String
      }
  | -- | A token for Microsoft Push Notification Service VoIP channel @channel_uri Push notification channel URI; may be empty to deregister a device
    DeviceTokenMicrosoftPushVoIP
      { -- |
        channel_uri :: Maybe String
      }
  | -- | A token for web Push API @endpoint Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
    DeviceTokenWebPush
      { -- |
        auth_base64url :: Maybe String,
        -- | Base64url-encoded P-256 elliptic curve Diffie-Hellman public key @auth_base64url Base64url-encoded authentication secret
        p256dh_base64url :: Maybe String,
        -- |
        endpoint :: Maybe String
      }
  | -- | A token for Simple Push API for Firefox OS @endpoint Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
    DeviceTokenSimplePush
      { -- |
        endpoint :: Maybe String
      }
  | -- | A token for Ubuntu Push Client service @token Token; may be empty to deregister a device
    DeviceTokenUbuntuPush
      { -- |
        token :: Maybe String
      }
  | -- | A token for BlackBerry Push Service @token Token; may be empty to deregister a device
    DeviceTokenBlackBerryPush
      { -- |
        token :: Maybe String
      }
  | -- | A token for Tizen Push Service @reg_id Push service registration identifier; may be empty to deregister a device
    DeviceTokenTizenPush
      { -- |
        reg_id :: Maybe String
      }
  deriving (Eq)

instance Show DeviceToken where
  show
    DeviceTokenFirebaseCloudMessaging
      { encrypt = encrypt_,
        token = token_
      } =
      "DeviceTokenFirebaseCloudMessaging"
        ++ U.cc
          [ U.p "encrypt" encrypt_,
            U.p "token" token_
          ]
  show
    DeviceTokenApplePush
      { is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      "DeviceTokenApplePush"
        ++ U.cc
          [ U.p "is_app_sandbox" is_app_sandbox_,
            U.p "device_token" device_token_
          ]
  show
    DeviceTokenApplePushVoIP
      { encrypt = encrypt_,
        is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      "DeviceTokenApplePushVoIP"
        ++ U.cc
          [ U.p "encrypt" encrypt_,
            U.p "is_app_sandbox" is_app_sandbox_,
            U.p "device_token" device_token_
          ]
  show
    DeviceTokenWindowsPush
      { access_token = access_token_
      } =
      "DeviceTokenWindowsPush"
        ++ U.cc
          [ U.p "access_token" access_token_
          ]
  show
    DeviceTokenMicrosoftPush
      { channel_uri = channel_uri_
      } =
      "DeviceTokenMicrosoftPush"
        ++ U.cc
          [ U.p "channel_uri" channel_uri_
          ]
  show
    DeviceTokenMicrosoftPushVoIP
      { channel_uri = channel_uri_
      } =
      "DeviceTokenMicrosoftPushVoIP"
        ++ U.cc
          [ U.p "channel_uri" channel_uri_
          ]
  show
    DeviceTokenWebPush
      { auth_base64url = auth_base64url_,
        p256dh_base64url = p256dh_base64url_,
        endpoint = endpoint_
      } =
      "DeviceTokenWebPush"
        ++ U.cc
          [ U.p "auth_base64url" auth_base64url_,
            U.p "p256dh_base64url" p256dh_base64url_,
            U.p "endpoint" endpoint_
          ]
  show
    DeviceTokenSimplePush
      { endpoint = endpoint_
      } =
      "DeviceTokenSimplePush"
        ++ U.cc
          [ U.p "endpoint" endpoint_
          ]
  show
    DeviceTokenUbuntuPush
      { token = token_
      } =
      "DeviceTokenUbuntuPush"
        ++ U.cc
          [ U.p "token" token_
          ]
  show
    DeviceTokenBlackBerryPush
      { token = token_
      } =
      "DeviceTokenBlackBerryPush"
        ++ U.cc
          [ U.p "token" token_
          ]
  show
    DeviceTokenTizenPush
      { reg_id = reg_id_
      } =
      "DeviceTokenTizenPush"
        ++ U.cc
          [ U.p "reg_id" reg_id_
          ]

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
        encrypt_ <- o A..:? "encrypt"
        token_ <- o A..:? "token"
        return $ DeviceTokenFirebaseCloudMessaging {encrypt = encrypt_, token = token_}

      parseDeviceTokenApplePush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenApplePush = A.withObject "DeviceTokenApplePush" $ \o -> do
        is_app_sandbox_ <- o A..:? "is_app_sandbox"
        device_token_ <- o A..:? "device_token"
        return $ DeviceTokenApplePush {is_app_sandbox = is_app_sandbox_, device_token = device_token_}

      parseDeviceTokenApplePushVoIP :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenApplePushVoIP = A.withObject "DeviceTokenApplePushVoIP" $ \o -> do
        encrypt_ <- o A..:? "encrypt"
        is_app_sandbox_ <- o A..:? "is_app_sandbox"
        device_token_ <- o A..:? "device_token"
        return $ DeviceTokenApplePushVoIP {encrypt = encrypt_, is_app_sandbox = is_app_sandbox_, device_token = device_token_}

      parseDeviceTokenWindowsPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenWindowsPush = A.withObject "DeviceTokenWindowsPush" $ \o -> do
        access_token_ <- o A..:? "access_token"
        return $ DeviceTokenWindowsPush {access_token = access_token_}

      parseDeviceTokenMicrosoftPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenMicrosoftPush = A.withObject "DeviceTokenMicrosoftPush" $ \o -> do
        channel_uri_ <- o A..:? "channel_uri"
        return $ DeviceTokenMicrosoftPush {channel_uri = channel_uri_}

      parseDeviceTokenMicrosoftPushVoIP :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenMicrosoftPushVoIP = A.withObject "DeviceTokenMicrosoftPushVoIP" $ \o -> do
        channel_uri_ <- o A..:? "channel_uri"
        return $ DeviceTokenMicrosoftPushVoIP {channel_uri = channel_uri_}

      parseDeviceTokenWebPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenWebPush = A.withObject "DeviceTokenWebPush" $ \o -> do
        auth_base64url_ <- o A..:? "auth_base64url"
        p256dh_base64url_ <- o A..:? "p256dh_base64url"
        endpoint_ <- o A..:? "endpoint"
        return $ DeviceTokenWebPush {auth_base64url = auth_base64url_, p256dh_base64url = p256dh_base64url_, endpoint = endpoint_}

      parseDeviceTokenSimplePush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenSimplePush = A.withObject "DeviceTokenSimplePush" $ \o -> do
        endpoint_ <- o A..:? "endpoint"
        return $ DeviceTokenSimplePush {endpoint = endpoint_}

      parseDeviceTokenUbuntuPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenUbuntuPush = A.withObject "DeviceTokenUbuntuPush" $ \o -> do
        token_ <- o A..:? "token"
        return $ DeviceTokenUbuntuPush {token = token_}

      parseDeviceTokenBlackBerryPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenBlackBerryPush = A.withObject "DeviceTokenBlackBerryPush" $ \o -> do
        token_ <- o A..:? "token"
        return $ DeviceTokenBlackBerryPush {token = token_}

      parseDeviceTokenTizenPush :: A.Value -> T.Parser DeviceToken
      parseDeviceTokenTizenPush = A.withObject "DeviceTokenTizenPush" $ \o -> do
        reg_id_ <- o A..:? "reg_id"
        return $ DeviceTokenTizenPush {reg_id = reg_id_}
  parseJSON _ = mempty

instance T.ToJSON DeviceToken where
  toJSON
    DeviceTokenFirebaseCloudMessaging
      { encrypt = encrypt_,
        token = token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenFirebaseCloudMessaging",
          "encrypt" A..= encrypt_,
          "token" A..= token_
        ]
  toJSON
    DeviceTokenApplePush
      { is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenApplePush",
          "is_app_sandbox" A..= is_app_sandbox_,
          "device_token" A..= device_token_
        ]
  toJSON
    DeviceTokenApplePushVoIP
      { encrypt = encrypt_,
        is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenApplePushVoIP",
          "encrypt" A..= encrypt_,
          "is_app_sandbox" A..= is_app_sandbox_,
          "device_token" A..= device_token_
        ]
  toJSON
    DeviceTokenWindowsPush
      { access_token = access_token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenWindowsPush",
          "access_token" A..= access_token_
        ]
  toJSON
    DeviceTokenMicrosoftPush
      { channel_uri = channel_uri_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenMicrosoftPush",
          "channel_uri" A..= channel_uri_
        ]
  toJSON
    DeviceTokenMicrosoftPushVoIP
      { channel_uri = channel_uri_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenMicrosoftPushVoIP",
          "channel_uri" A..= channel_uri_
        ]
  toJSON
    DeviceTokenWebPush
      { auth_base64url = auth_base64url_,
        p256dh_base64url = p256dh_base64url_,
        endpoint = endpoint_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenWebPush",
          "auth_base64url" A..= auth_base64url_,
          "p256dh_base64url" A..= p256dh_base64url_,
          "endpoint" A..= endpoint_
        ]
  toJSON
    DeviceTokenSimplePush
      { endpoint = endpoint_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenSimplePush",
          "endpoint" A..= endpoint_
        ]
  toJSON
    DeviceTokenUbuntuPush
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenUbuntuPush",
          "token" A..= token_
        ]
  toJSON
    DeviceTokenBlackBerryPush
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenBlackBerryPush",
          "token" A..= token_
        ]
  toJSON
    DeviceTokenTizenPush
      { reg_id = reg_id_
      } =
      A.object
        [ "@type" A..= T.String "deviceTokenTizenPush",
          "reg_id" A..= reg_id_
        ]
