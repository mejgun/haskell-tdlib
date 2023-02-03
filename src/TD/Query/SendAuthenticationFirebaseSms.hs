{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendAuthenticationFirebaseSms where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos
data SendAuthenticationFirebaseSms = SendAuthenticationFirebaseSms
  { -- | SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
    token :: Maybe String
  }
  deriving (Eq)

instance Show SendAuthenticationFirebaseSms where
  show
    SendAuthenticationFirebaseSms
      { token = token_
      } =
      "SendAuthenticationFirebaseSms"
        ++ U.cc
          [ U.p "token" token_
          ]

instance T.ToJSON SendAuthenticationFirebaseSms where
  toJSON
    SendAuthenticationFirebaseSms
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "sendAuthenticationFirebaseSms",
          "token" A..= token_
        ]
