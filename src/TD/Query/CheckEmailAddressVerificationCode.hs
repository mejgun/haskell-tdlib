module TD.Query.CheckEmailAddressVerificationCode
  (CheckEmailAddressVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the email address verification code for Telegram Passport. Returns 'TD.Data.Ok.Ok'
data CheckEmailAddressVerificationCode
  = CheckEmailAddressVerificationCode
    { code :: Maybe T.Text -- ^ Verification code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckEmailAddressVerificationCode where
  shortShow
    CheckEmailAddressVerificationCode
      { code = code_
      }
        = "CheckEmailAddressVerificationCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckEmailAddressVerificationCode where
  toJSON
    CheckEmailAddressVerificationCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkEmailAddressVerificationCode"
          , "code"  A..= code_
          ]

