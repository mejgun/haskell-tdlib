module TD.Query.ResendPhoneNumberVerificationCode
  (ResendPhoneNumberVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the code to verify a phone number to be added to a user's Telegram Passport. Returns 'TD.Data.AuthenticationCodeInfo.AuthenticationCodeInfo'
data ResendPhoneNumberVerificationCode
  = ResendPhoneNumberVerificationCode
  deriving (Eq, Show)

instance I.ShortShow ResendPhoneNumberVerificationCode where
  shortShow
    ResendPhoneNumberVerificationCode
        = "ResendPhoneNumberVerificationCode"

instance AT.ToJSON ResendPhoneNumberVerificationCode where
  toJSON
    ResendPhoneNumberVerificationCode
        = A.object
          [ "@type" A..= AT.String "resendPhoneNumberVerificationCode"
          ]

