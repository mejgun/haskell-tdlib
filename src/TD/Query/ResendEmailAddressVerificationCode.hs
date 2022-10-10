{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendEmailAddressVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends the code to verify an email address to be added to a user's Telegram Passport
data ResendEmailAddressVerificationCode = ResendEmailAddressVerificationCode
  {
  }
  deriving (Eq)

instance Show ResendEmailAddressVerificationCode where
  show ResendEmailAddressVerificationCode =
    "ResendEmailAddressVerificationCode"
      ++ U.cc
        []

instance T.ToJSON ResendEmailAddressVerificationCode where
  toJSON ResendEmailAddressVerificationCode =
    A.object
      [ "@type" A..= T.String "resendEmailAddressVerificationCode"
      ]
