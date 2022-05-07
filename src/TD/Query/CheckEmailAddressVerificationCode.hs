{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CheckEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the email address verification code for Telegram Passport @code Verification code to check
data CheckEmailAddressVerificationCode = CheckEmailAddressVerificationCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckEmailAddressVerificationCode where
  show
    CheckEmailAddressVerificationCode
      { code = code
      } =
      "CheckEmailAddressVerificationCode"
        ++ U.cc
          [ U.p "code" code
          ]

instance T.ToJSON CheckEmailAddressVerificationCode where
  toJSON
    CheckEmailAddressVerificationCode
      { code = code
      } =
      A.object
        [ "@type" A..= T.String "checkEmailAddressVerificationCode",
          "code" A..= code
        ]
