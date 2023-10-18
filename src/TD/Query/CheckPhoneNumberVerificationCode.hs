module TD.Query.CheckPhoneNumberVerificationCode
  (CheckPhoneNumberVerificationCode(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Checks the phone number verification code for Telegram Passport. Returns 'TD.Data.Ok.Ok'
data CheckPhoneNumberVerificationCode
  = CheckPhoneNumberVerificationCode
    { code :: Maybe T.Text -- ^ Verification code to check
    }
  deriving (Eq, Show)

instance I.ShortShow CheckPhoneNumberVerificationCode where
  shortShow
    CheckPhoneNumberVerificationCode
      { code = code_
      }
        = "CheckPhoneNumberVerificationCode"
          ++ I.cc
          [ "code" `I.p` code_
          ]

instance AT.ToJSON CheckPhoneNumberVerificationCode where
  toJSON
    CheckPhoneNumberVerificationCode
      { code = code_
      }
        = A.object
          [ "@type" A..= AT.String "checkPhoneNumberVerificationCode"
          , "code"  A..= code_
          ]

