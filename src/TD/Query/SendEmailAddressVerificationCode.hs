{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SendEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sends a code to verify an email address to be added to a user's Telegram Passport @email_address Email address
data SendEmailAddressVerificationCode = SendEmailAddressVerificationCode
  { -- |
    email_address :: Maybe String
  }
  deriving (Eq)

instance Show SendEmailAddressVerificationCode where
  show
    SendEmailAddressVerificationCode
      { email_address = email_address_
      } =
      "SendEmailAddressVerificationCode"
        ++ U.cc
          [ U.p "email_address" email_address_
          ]

instance T.ToJSON SendEmailAddressVerificationCode where
  toJSON
    SendEmailAddressVerificationCode
      { email_address = email_address_
      } =
      A.object
        [ "@type" A..= T.String "sendEmailAddressVerificationCode",
          "email_address" A..= email_address_
        ]
