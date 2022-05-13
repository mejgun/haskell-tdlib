{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the phone number verification code for Telegram Passport @code Verification code to check
data CheckPhoneNumberVerificationCode = CheckPhoneNumberVerificationCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckPhoneNumberVerificationCode where
  show
    CheckPhoneNumberVerificationCode
      { code = code_
      } =
      "CheckPhoneNumberVerificationCode"
        ++ U.cc
          [ U.p "code" code_
          ]

instance T.ToJSON CheckPhoneNumberVerificationCode where
  toJSON
    CheckPhoneNumberVerificationCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "checkPhoneNumberVerificationCode",
          "code" A..= code_
        ]
