module TD.Query.ResendPhoneNumberVerificationCode
  (ResendPhoneNumberVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Resends the code to verify a phone number to be added to a user's Telegram Passport
data ResendPhoneNumberVerificationCode
  = ResendPhoneNumberVerificationCode
  deriving (Eq)

instance Show ResendPhoneNumberVerificationCode where
  show
    ResendPhoneNumberVerificationCode
        = "ResendPhoneNumberVerificationCode"

instance AT.ToJSON ResendPhoneNumberVerificationCode where
  toJSON
    ResendPhoneNumberVerificationCode
        = A.object
          [ "@type" A..= AT.String "resendPhoneNumberVerificationCode"
          ]

