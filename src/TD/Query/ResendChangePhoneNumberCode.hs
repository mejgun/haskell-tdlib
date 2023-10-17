module TD.Query.ResendChangePhoneNumberCode
  (ResendChangePhoneNumberCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the authentication code sent to confirm a new phone number for the current user. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed
data ResendChangePhoneNumberCode
  = ResendChangePhoneNumberCode
  deriving (Eq, Show)

instance I.ShortShow ResendChangePhoneNumberCode where
  shortShow
    ResendChangePhoneNumberCode
        = "ResendChangePhoneNumberCode"

instance AT.ToJSON ResendChangePhoneNumberCode where
  toJSON
    ResendChangePhoneNumberCode
        = A.object
          [ "@type" A..= AT.String "resendChangePhoneNumberCode"
          ]

