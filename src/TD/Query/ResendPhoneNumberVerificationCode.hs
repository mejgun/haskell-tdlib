{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendPhoneNumberVerificationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Re-sends the code to verify a phone number to be added to a user's Telegram Passport
data ResendPhoneNumberVerificationCode = ResendPhoneNumberVerificationCode
  {
  }
  deriving (Eq)

instance Show ResendPhoneNumberVerificationCode where
  show ResendPhoneNumberVerificationCode =
    "ResendPhoneNumberVerificationCode"
      ++ U.cc
        []

instance T.ToJSON ResendPhoneNumberVerificationCode where
  toJSON ResendPhoneNumberVerificationCode =
    A.object
      [ "@type" A..= T.String "resendPhoneNumberVerificationCode"
      ]
