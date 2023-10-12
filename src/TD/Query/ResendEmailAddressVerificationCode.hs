module TD.Query.ResendEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data ResendEmailAddressVerificationCode -- ^ Resends the code to verify an email address to be added to a user's Telegram Passport
  = ResendEmailAddressVerificationCode
  deriving (Eq)

instance Show ResendEmailAddressVerificationCode where
  show
    ResendEmailAddressVerificationCode
        = "ResendEmailAddressVerificationCode"

instance AT.ToJSON ResendEmailAddressVerificationCode where
  toJSON
    ResendEmailAddressVerificationCode
        = A.object
          [ "@type" A..= AT.String "resendEmailAddressVerificationCode"
          ]
