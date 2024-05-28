module TD.Query.ResendPhoneNumberCode
  (ResendPhoneNumberCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ResendCodeReason as ResendCodeReason

-- | Resends the authentication code sent to a phone number. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data ResendPhoneNumberCode
  = ResendPhoneNumberCode
    { reason :: Maybe ResendCodeReason.ResendCodeReason -- ^ Reason of code resending; pass null if unknown
    }
  deriving (Eq, Show)

instance I.ShortShow ResendPhoneNumberCode where
  shortShow
    ResendPhoneNumberCode
      { reason = reason_
      }
        = "ResendPhoneNumberCode"
          ++ I.cc
          [ "reason" `I.p` reason_
          ]

instance AT.ToJSON ResendPhoneNumberCode where
  toJSON
    ResendPhoneNumberCode
      { reason = reason_
      }
        = A.object
          [ "@type"  A..= AT.String "resendPhoneNumberCode"
          , "reason" A..= reason_
          ]

