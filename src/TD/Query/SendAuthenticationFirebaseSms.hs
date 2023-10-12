module TD.Query.SendAuthenticationFirebaseSms where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SendAuthenticationFirebaseSms -- ^ Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos
  = SendAuthenticationFirebaseSms
    { token :: Maybe T.Text -- ^ SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
    }
  deriving (Eq)

instance Show SendAuthenticationFirebaseSms where
  show
    SendAuthenticationFirebaseSms
      { token = token_
      }
        = "SendAuthenticationFirebaseSms"
          ++ I.cc
          [ "token" `I.p` token_
          ]

instance AT.ToJSON SendAuthenticationFirebaseSms where
  toJSON
    SendAuthenticationFirebaseSms
      { token = token_
      }
        = A.object
          [ "@type" A..= AT.String "sendAuthenticationFirebaseSms"
          , "token" A..= token_
          ]
