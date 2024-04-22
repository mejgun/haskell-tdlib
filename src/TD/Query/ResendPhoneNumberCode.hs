module TD.Query.ResendPhoneNumberCode
  (ResendPhoneNumberCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the authentication code sent to a phone number. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data ResendPhoneNumberCode
  = ResendPhoneNumberCode
  deriving (Eq, Show)

instance I.ShortShow ResendPhoneNumberCode where
  shortShow
    ResendPhoneNumberCode
        = "ResendPhoneNumberCode"

instance AT.ToJSON ResendPhoneNumberCode where
  toJSON
    ResendPhoneNumberCode
        = A.object
          [ "@type" A..= AT.String "resendPhoneNumberCode"
          ]

