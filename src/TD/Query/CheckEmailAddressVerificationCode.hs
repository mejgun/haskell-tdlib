module TD.Query.CheckEmailAddressVerificationCode
  (CheckEmailAddressVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data CheckEmailAddressVerificationCode -- ^ Checks the email address verification code for Telegram Passport
  = CheckEmailAddressVerificationCode
    { code :: Maybe T.Text -- ^ Verification code to check
    }
  deriving (Eq)

instance Show CheckEmailAddressVerificationCode where
  show
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

