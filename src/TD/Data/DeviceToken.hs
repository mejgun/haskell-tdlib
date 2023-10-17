module TD.Data.DeviceToken
  (DeviceToken(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org
data DeviceToken
  = DeviceTokenFirebaseCloudMessaging -- ^ A token for Firebase Cloud Messaging
    { token   :: Maybe T.Text -- ^ Device registration token; may be empty to deregister a device
    , encrypt :: Maybe Bool   -- ^ True, if push notifications must be additionally encrypted
    }
  | DeviceTokenApplePush -- ^ A token for Apple Push Notification service
    { device_token   :: Maybe T.Text -- ^ Device token; may be empty to deregister a device
    , is_app_sandbox :: Maybe Bool   -- ^ True, if App Sandbox is enabled
    }
  | DeviceTokenApplePushVoIP -- ^ A token for Apple Push Notification service VoIP notifications
    { device_token   :: Maybe T.Text -- ^ Device token; may be empty to deregister a device
    , is_app_sandbox :: Maybe Bool   -- ^ True, if App Sandbox is enabled
    , encrypt        :: Maybe Bool   -- ^ True, if push notifications must be additionally encrypted
    }
  | DeviceTokenWindowsPush -- ^ A token for Windows Push Notification Services
    { access_token :: Maybe T.Text -- ^ The access token that will be used to send notifications; may be empty to deregister a device
    }
  | DeviceTokenMicrosoftPush -- ^ A token for Microsoft Push Notification Service
    { channel_uri :: Maybe T.Text -- ^ Push notification channel URI; may be empty to deregister a device
    }
  | DeviceTokenMicrosoftPushVoIP -- ^ A token for Microsoft Push Notification Service VoIP channel
    { channel_uri :: Maybe T.Text -- ^ Push notification channel URI; may be empty to deregister a device
    }
  | DeviceTokenWebPush -- ^ A token for web Push API
    { endpoint         :: Maybe T.Text -- ^ Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
    , p256dh_base64url :: Maybe T.Text -- ^ Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
    , auth_base64url   :: Maybe T.Text -- ^ Base64url-encoded authentication secret
    }
  | DeviceTokenSimplePush -- ^ A token for Simple Push API for Firefox OS
    { endpoint :: Maybe T.Text -- ^ Absolute URL exposed by the push service where the application server can send push messages; may be empty to deregister a device
    }
  | DeviceTokenUbuntuPush -- ^ A token for Ubuntu Push Client service
    { token :: Maybe T.Text -- ^ Token; may be empty to deregister a device
    }
  | DeviceTokenBlackBerryPush -- ^ A token for BlackBerry Push Service
    { token :: Maybe T.Text -- ^ Token; may be empty to deregister a device
    }
  | DeviceTokenTizenPush -- ^ A token for Tizen Push Service
    { reg_id :: Maybe T.Text -- ^ Push service registration identifier; may be empty to deregister a device
    }
  | DeviceTokenHuaweiPush -- ^ A token for HUAWEI Push Service
    { token   :: Maybe T.Text -- ^ Device registration token; may be empty to deregister a device
    , encrypt :: Maybe Bool   -- ^ True, if push notifications must be additionally encrypted
    }
  deriving (Eq, Show)

instance I.ShortShow DeviceToken where
  shortShow DeviceTokenFirebaseCloudMessaging
    { token   = token_
    , encrypt = encrypt_
    }
      = "DeviceTokenFirebaseCloudMessaging"
        ++ I.cc
        [ "token"   `I.p` token_
        , "encrypt" `I.p` encrypt_
        ]
  shortShow DeviceTokenApplePush
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    }
      = "DeviceTokenApplePush"
        ++ I.cc
        [ "device_token"   `I.p` device_token_
        , "is_app_sandbox" `I.p` is_app_sandbox_
        ]
  shortShow DeviceTokenApplePushVoIP
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    , encrypt        = encrypt_
    }
      = "DeviceTokenApplePushVoIP"
        ++ I.cc
        [ "device_token"   `I.p` device_token_
        , "is_app_sandbox" `I.p` is_app_sandbox_
        , "encrypt"        `I.p` encrypt_
        ]
  shortShow DeviceTokenWindowsPush
    { access_token = access_token_
    }
      = "DeviceTokenWindowsPush"
        ++ I.cc
        [ "access_token" `I.p` access_token_
        ]
  shortShow DeviceTokenMicrosoftPush
    { channel_uri = channel_uri_
    }
      = "DeviceTokenMicrosoftPush"
        ++ I.cc
        [ "channel_uri" `I.p` channel_uri_
        ]
  shortShow DeviceTokenMicrosoftPushVoIP
    { channel_uri = channel_uri_
    }
      = "DeviceTokenMicrosoftPushVoIP"
        ++ I.cc
        [ "channel_uri" `I.p` channel_uri_
        ]
  shortShow DeviceTokenWebPush
    { endpoint         = endpoint_
    , p256dh_base64url = p256dh_base64url_
    , auth_base64url   = auth_base64url_
    }
      = "DeviceTokenWebPush"
        ++ I.cc
        [ "endpoint"         `I.p` endpoint_
        , "p256dh_base64url" `I.p` p256dh_base64url_
        , "auth_base64url"   `I.p` auth_base64url_
        ]
  shortShow DeviceTokenSimplePush
    { endpoint = endpoint_
    }
      = "DeviceTokenSimplePush"
        ++ I.cc
        [ "endpoint" `I.p` endpoint_
        ]
  shortShow DeviceTokenUbuntuPush
    { token = token_
    }
      = "DeviceTokenUbuntuPush"
        ++ I.cc
        [ "token" `I.p` token_
        ]
  shortShow DeviceTokenBlackBerryPush
    { token = token_
    }
      = "DeviceTokenBlackBerryPush"
        ++ I.cc
        [ "token" `I.p` token_
        ]
  shortShow DeviceTokenTizenPush
    { reg_id = reg_id_
    }
      = "DeviceTokenTizenPush"
        ++ I.cc
        [ "reg_id" `I.p` reg_id_
        ]
  shortShow DeviceTokenHuaweiPush
    { token   = token_
    , encrypt = encrypt_
    }
      = "DeviceTokenHuaweiPush"
        ++ I.cc
        [ "token"   `I.p` token_
        , "encrypt" `I.p` encrypt_
        ]

instance AT.FromJSON DeviceToken where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "deviceTokenFirebaseCloudMessaging" -> parseDeviceTokenFirebaseCloudMessaging v
      "deviceTokenApplePush"              -> parseDeviceTokenApplePush v
      "deviceTokenApplePushVoIP"          -> parseDeviceTokenApplePushVoIP v
      "deviceTokenWindowsPush"            -> parseDeviceTokenWindowsPush v
      "deviceTokenMicrosoftPush"          -> parseDeviceTokenMicrosoftPush v
      "deviceTokenMicrosoftPushVoIP"      -> parseDeviceTokenMicrosoftPushVoIP v
      "deviceTokenWebPush"                -> parseDeviceTokenWebPush v
      "deviceTokenSimplePush"             -> parseDeviceTokenSimplePush v
      "deviceTokenUbuntuPush"             -> parseDeviceTokenUbuntuPush v
      "deviceTokenBlackBerryPush"         -> parseDeviceTokenBlackBerryPush v
      "deviceTokenTizenPush"              -> parseDeviceTokenTizenPush v
      "deviceTokenHuaweiPush"             -> parseDeviceTokenHuaweiPush v
      _                                   -> mempty
    
    where
      parseDeviceTokenFirebaseCloudMessaging :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenFirebaseCloudMessaging = A.withObject "DeviceTokenFirebaseCloudMessaging" $ \o -> do
        token_   <- o A..:?  "token"
        encrypt_ <- o A..:?  "encrypt"
        pure $ DeviceTokenFirebaseCloudMessaging
          { token   = token_
          , encrypt = encrypt_
          }
      parseDeviceTokenApplePush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenApplePush = A.withObject "DeviceTokenApplePush" $ \o -> do
        device_token_   <- o A..:?  "device_token"
        is_app_sandbox_ <- o A..:?  "is_app_sandbox"
        pure $ DeviceTokenApplePush
          { device_token   = device_token_
          , is_app_sandbox = is_app_sandbox_
          }
      parseDeviceTokenApplePushVoIP :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenApplePushVoIP = A.withObject "DeviceTokenApplePushVoIP" $ \o -> do
        device_token_   <- o A..:?  "device_token"
        is_app_sandbox_ <- o A..:?  "is_app_sandbox"
        encrypt_        <- o A..:?  "encrypt"
        pure $ DeviceTokenApplePushVoIP
          { device_token   = device_token_
          , is_app_sandbox = is_app_sandbox_
          , encrypt        = encrypt_
          }
      parseDeviceTokenWindowsPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenWindowsPush = A.withObject "DeviceTokenWindowsPush" $ \o -> do
        access_token_ <- o A..:?  "access_token"
        pure $ DeviceTokenWindowsPush
          { access_token = access_token_
          }
      parseDeviceTokenMicrosoftPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenMicrosoftPush = A.withObject "DeviceTokenMicrosoftPush" $ \o -> do
        channel_uri_ <- o A..:?  "channel_uri"
        pure $ DeviceTokenMicrosoftPush
          { channel_uri = channel_uri_
          }
      parseDeviceTokenMicrosoftPushVoIP :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenMicrosoftPushVoIP = A.withObject "DeviceTokenMicrosoftPushVoIP" $ \o -> do
        channel_uri_ <- o A..:?  "channel_uri"
        pure $ DeviceTokenMicrosoftPushVoIP
          { channel_uri = channel_uri_
          }
      parseDeviceTokenWebPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenWebPush = A.withObject "DeviceTokenWebPush" $ \o -> do
        endpoint_         <- o A..:?  "endpoint"
        p256dh_base64url_ <- o A..:?  "p256dh_base64url"
        auth_base64url_   <- o A..:?  "auth_base64url"
        pure $ DeviceTokenWebPush
          { endpoint         = endpoint_
          , p256dh_base64url = p256dh_base64url_
          , auth_base64url   = auth_base64url_
          }
      parseDeviceTokenSimplePush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenSimplePush = A.withObject "DeviceTokenSimplePush" $ \o -> do
        endpoint_ <- o A..:?  "endpoint"
        pure $ DeviceTokenSimplePush
          { endpoint = endpoint_
          }
      parseDeviceTokenUbuntuPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenUbuntuPush = A.withObject "DeviceTokenUbuntuPush" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ DeviceTokenUbuntuPush
          { token = token_
          }
      parseDeviceTokenBlackBerryPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenBlackBerryPush = A.withObject "DeviceTokenBlackBerryPush" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ DeviceTokenBlackBerryPush
          { token = token_
          }
      parseDeviceTokenTizenPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenTizenPush = A.withObject "DeviceTokenTizenPush" $ \o -> do
        reg_id_ <- o A..:?  "reg_id"
        pure $ DeviceTokenTizenPush
          { reg_id = reg_id_
          }
      parseDeviceTokenHuaweiPush :: A.Value -> AT.Parser DeviceToken
      parseDeviceTokenHuaweiPush = A.withObject "DeviceTokenHuaweiPush" $ \o -> do
        token_   <- o A..:?  "token"
        encrypt_ <- o A..:?  "encrypt"
        pure $ DeviceTokenHuaweiPush
          { token   = token_
          , encrypt = encrypt_
          }
  parseJSON _ = mempty

instance AT.ToJSON DeviceToken where
  toJSON DeviceTokenFirebaseCloudMessaging
    { token   = token_
    , encrypt = encrypt_
    }
      = A.object
        [ "@type"   A..= AT.String "deviceTokenFirebaseCloudMessaging"
        , "token"   A..= token_
        , "encrypt" A..= encrypt_
        ]
  toJSON DeviceTokenApplePush
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    }
      = A.object
        [ "@type"          A..= AT.String "deviceTokenApplePush"
        , "device_token"   A..= device_token_
        , "is_app_sandbox" A..= is_app_sandbox_
        ]
  toJSON DeviceTokenApplePushVoIP
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    , encrypt        = encrypt_
    }
      = A.object
        [ "@type"          A..= AT.String "deviceTokenApplePushVoIP"
        , "device_token"   A..= device_token_
        , "is_app_sandbox" A..= is_app_sandbox_
        , "encrypt"        A..= encrypt_
        ]
  toJSON DeviceTokenWindowsPush
    { access_token = access_token_
    }
      = A.object
        [ "@type"        A..= AT.String "deviceTokenWindowsPush"
        , "access_token" A..= access_token_
        ]
  toJSON DeviceTokenMicrosoftPush
    { channel_uri = channel_uri_
    }
      = A.object
        [ "@type"       A..= AT.String "deviceTokenMicrosoftPush"
        , "channel_uri" A..= channel_uri_
        ]
  toJSON DeviceTokenMicrosoftPushVoIP
    { channel_uri = channel_uri_
    }
      = A.object
        [ "@type"       A..= AT.String "deviceTokenMicrosoftPushVoIP"
        , "channel_uri" A..= channel_uri_
        ]
  toJSON DeviceTokenWebPush
    { endpoint         = endpoint_
    , p256dh_base64url = p256dh_base64url_
    , auth_base64url   = auth_base64url_
    }
      = A.object
        [ "@type"            A..= AT.String "deviceTokenWebPush"
        , "endpoint"         A..= endpoint_
        , "p256dh_base64url" A..= p256dh_base64url_
        , "auth_base64url"   A..= auth_base64url_
        ]
  toJSON DeviceTokenSimplePush
    { endpoint = endpoint_
    }
      = A.object
        [ "@type"    A..= AT.String "deviceTokenSimplePush"
        , "endpoint" A..= endpoint_
        ]
  toJSON DeviceTokenUbuntuPush
    { token = token_
    }
      = A.object
        [ "@type" A..= AT.String "deviceTokenUbuntuPush"
        , "token" A..= token_
        ]
  toJSON DeviceTokenBlackBerryPush
    { token = token_
    }
      = A.object
        [ "@type" A..= AT.String "deviceTokenBlackBerryPush"
        , "token" A..= token_
        ]
  toJSON DeviceTokenTizenPush
    { reg_id = reg_id_
    }
      = A.object
        [ "@type"  A..= AT.String "deviceTokenTizenPush"
        , "reg_id" A..= reg_id_
        ]
  toJSON DeviceTokenHuaweiPush
    { token   = token_
    , encrypt = encrypt_
    }
      = A.object
        [ "@type"   A..= AT.String "deviceTokenHuaweiPush"
        , "token"   A..= token_
        , "encrypt" A..= encrypt_
        ]

