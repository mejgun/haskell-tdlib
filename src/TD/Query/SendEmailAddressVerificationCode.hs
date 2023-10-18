module TD.Query.SendEmailAddressVerificationCode
  (SendEmailAddressVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Sends a code to verify an email address to be added to a user's Telegram Passport. Returns 'TD.Data.EmailAddressAuthenticationCodeInfo.EmailAddressAuthenticationCodeInfo'
data SendEmailAddressVerificationCode
  = SendEmailAddressVerificationCode
    { email_address :: Maybe T.Text -- ^ Email address
    }
  deriving (Eq, Show)

instance I.ShortShow SendEmailAddressVerificationCode where
  shortShow
    SendEmailAddressVerificationCode
      { email_address = email_address_
      }
        = "SendEmailAddressVerificationCode"
          ++ I.cc
          [ "email_address" `I.p` email_address_
          ]

instance AT.ToJSON SendEmailAddressVerificationCode where
  toJSON
    SendEmailAddressVerificationCode
      { email_address = email_address_
      }
        = A.object
          [ "@type"         A..= AT.String "sendEmailAddressVerificationCode"
          , "email_address" A..= email_address_
          ]

