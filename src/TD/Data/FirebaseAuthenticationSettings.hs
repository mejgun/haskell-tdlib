module TD.Data.FirebaseAuthenticationSettings
  (FirebaseAuthenticationSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Contains settings for Firebase Authentication in the official applications
data FirebaseAuthenticationSettings
  = FirebaseAuthenticationSettingsAndroid -- ^ Settings for Firebase Authentication in the official Android application
  | FirebaseAuthenticationSettingsIos -- ^ Settings for Firebase Authentication in the official iOS application
    { device_token   :: Maybe T.Text -- ^ Device token from Apple Push Notification service
    , is_app_sandbox :: Maybe Bool   -- ^ True, if App Sandbox is enabled
    }
  deriving (Eq, Show)

instance I.ShortShow FirebaseAuthenticationSettings where
  shortShow FirebaseAuthenticationSettingsAndroid
      = "FirebaseAuthenticationSettingsAndroid"
  shortShow FirebaseAuthenticationSettingsIos
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    }
      = "FirebaseAuthenticationSettingsIos"
        ++ I.cc
        [ "device_token"   `I.p` device_token_
        , "is_app_sandbox" `I.p` is_app_sandbox_
        ]

instance AT.FromJSON FirebaseAuthenticationSettings where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "firebaseAuthenticationSettingsAndroid" -> pure FirebaseAuthenticationSettingsAndroid
      "firebaseAuthenticationSettingsIos"     -> parseFirebaseAuthenticationSettingsIos v
      _                                       -> mempty
    
    where
      parseFirebaseAuthenticationSettingsIos :: A.Value -> AT.Parser FirebaseAuthenticationSettings
      parseFirebaseAuthenticationSettingsIos = A.withObject "FirebaseAuthenticationSettingsIos" $ \o -> do
        device_token_   <- o A..:?  "device_token"
        is_app_sandbox_ <- o A..:?  "is_app_sandbox"
        pure $ FirebaseAuthenticationSettingsIos
          { device_token   = device_token_
          , is_app_sandbox = is_app_sandbox_
          }
  parseJSON _ = mempty

instance AT.ToJSON FirebaseAuthenticationSettings where
  toJSON FirebaseAuthenticationSettingsAndroid
      = A.object
        [ "@type" A..= AT.String "firebaseAuthenticationSettingsAndroid"
        ]
  toJSON FirebaseAuthenticationSettingsIos
    { device_token   = device_token_
    , is_app_sandbox = is_app_sandbox_
    }
      = A.object
        [ "@type"          A..= AT.String "firebaseAuthenticationSettingsIos"
        , "device_token"   A..= device_token_
        , "is_app_sandbox" A..= is_app_sandbox_
        ]

