module TD.Query.SendAuthenticationFirebaseSms
  (SendAuthenticationFirebaseSms(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sends Firebase Authentication SMS to the phone number of the user. Works only when the current authorization state is authorizationStateWaitCode and the server returned code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos. Returns 'TD.Data.Ok.Ok'
data SendAuthenticationFirebaseSms
  = SendAuthenticationFirebaseSms
    { token :: Maybe T.Text -- ^ Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
    }
  deriving (Eq, Show)

instance I.ShortShow SendAuthenticationFirebaseSms where
  shortShow
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

