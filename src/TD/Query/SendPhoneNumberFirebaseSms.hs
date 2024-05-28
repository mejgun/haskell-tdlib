module TD.Query.SendPhoneNumberFirebaseSms
  (SendPhoneNumberFirebaseSms(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sends Firebase Authentication SMS to the specified phone number. Works only when received a code of the type authenticationCodeTypeFirebaseAndroid or authenticationCodeTypeFirebaseIos. Returns 'TD.Data.Ok.Ok'
data SendPhoneNumberFirebaseSms
  = SendPhoneNumberFirebaseSms
    { token :: Maybe T.Text -- ^ Play Integrity API or SafetyNet Attestation API token for the Android application, or secret from push notification for the iOS application
    }
  deriving (Eq, Show)

instance I.ShortShow SendPhoneNumberFirebaseSms where
  shortShow
    SendPhoneNumberFirebaseSms
      { token = token_
      }
        = "SendPhoneNumberFirebaseSms"
          ++ I.cc
          [ "token" `I.p` token_
          ]

instance AT.ToJSON SendPhoneNumberFirebaseSms where
  toJSON
    SendPhoneNumberFirebaseSms
      { token = token_
      }
        = A.object
          [ "@type" A..= AT.String "sendPhoneNumberFirebaseSms"
          , "token" A..= token_
          ]

