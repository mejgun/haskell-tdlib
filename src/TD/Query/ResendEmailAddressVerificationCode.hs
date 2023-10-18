module TD.Query.ResendEmailAddressVerificationCode
  (ResendEmailAddressVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resends the code to verify an email address to be added to a user's Telegram Passport. Returns 'TD.Data.EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo'
data ResendEmailAddressVerificationCode
  = ResendEmailAddressVerificationCode
  deriving (Eq, Show)

instance I.ShortShow ResendEmailAddressVerificationCode where
  shortShow
    ResendEmailAddressVerificationCode
        = "ResendEmailAddressVerificationCode"

instance AT.ToJSON ResendEmailAddressVerificationCode where
  toJSON
    ResendEmailAddressVerificationCode
        = A.object
          [ "@type" A..= AT.String "resendEmailAddressVerificationCode"
          ]

