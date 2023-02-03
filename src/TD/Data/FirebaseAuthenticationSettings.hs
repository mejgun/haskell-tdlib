{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.FirebaseAuthenticationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Contains settings for Firebase Authentication in the official applications
data FirebaseAuthenticationSettings
  = -- | Settings for Firebase Authentication in the official Android application
    FirebaseAuthenticationSettingsAndroid
  | -- | Settings for Firebase Authentication in the official iOS application @device_token Device token from Apple Push Notification service @is_app_sandbox True, if App Sandbox is enabled
    FirebaseAuthenticationSettingsIos
      { -- |
        is_app_sandbox :: Maybe Bool,
        -- |
        device_token :: Maybe String
      }
  deriving (Eq)

instance Show FirebaseAuthenticationSettings where
  show FirebaseAuthenticationSettingsAndroid =
    "FirebaseAuthenticationSettingsAndroid"
      ++ U.cc
        []
  show
    FirebaseAuthenticationSettingsIos
      { is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      "FirebaseAuthenticationSettingsIos"
        ++ U.cc
          [ U.p "is_app_sandbox" is_app_sandbox_,
            U.p "device_token" device_token_
          ]

instance T.FromJSON FirebaseAuthenticationSettings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "firebaseAuthenticationSettingsAndroid" -> parseFirebaseAuthenticationSettingsAndroid v
      "firebaseAuthenticationSettingsIos" -> parseFirebaseAuthenticationSettingsIos v
      _ -> mempty
    where
      parseFirebaseAuthenticationSettingsAndroid :: A.Value -> T.Parser FirebaseAuthenticationSettings
      parseFirebaseAuthenticationSettingsAndroid = A.withObject "FirebaseAuthenticationSettingsAndroid" $ \_ -> return FirebaseAuthenticationSettingsAndroid

      parseFirebaseAuthenticationSettingsIos :: A.Value -> T.Parser FirebaseAuthenticationSettings
      parseFirebaseAuthenticationSettingsIos = A.withObject "FirebaseAuthenticationSettingsIos" $ \o -> do
        is_app_sandbox_ <- o A..:? "is_app_sandbox"
        device_token_ <- o A..:? "device_token"
        return $ FirebaseAuthenticationSettingsIos {is_app_sandbox = is_app_sandbox_, device_token = device_token_}
  parseJSON _ = mempty

instance T.ToJSON FirebaseAuthenticationSettings where
  toJSON FirebaseAuthenticationSettingsAndroid =
    A.object
      [ "@type" A..= T.String "firebaseAuthenticationSettingsAndroid"
      ]
  toJSON
    FirebaseAuthenticationSettingsIos
      { is_app_sandbox = is_app_sandbox_,
        device_token = device_token_
      } =
      A.object
        [ "@type" A..= T.String "firebaseAuthenticationSettingsIos",
          "is_app_sandbox" A..= is_app_sandbox_,
          "device_token" A..= device_token_
        ]
