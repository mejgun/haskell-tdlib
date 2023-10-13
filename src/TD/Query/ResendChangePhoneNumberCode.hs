module TD.Query.ResendChangePhoneNumberCode(ResendChangePhoneNumberCode(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ResendChangePhoneNumberCode -- ^ Resends the authentication code sent to confirm a new phone number for the current user. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed
  = ResendChangePhoneNumberCode
  deriving (Eq)

instance Show ResendChangePhoneNumberCode where
  show
    ResendChangePhoneNumberCode
        = "ResendChangePhoneNumberCode"

instance AT.ToJSON ResendChangePhoneNumberCode where
  toJSON
    ResendChangePhoneNumberCode
        = A.object
          [ "@type" A..= AT.String "resendChangePhoneNumberCode"
          ]
