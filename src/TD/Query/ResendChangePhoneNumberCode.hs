{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendChangePhoneNumberCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends the authentication code sent to confirm a new phone number for the current user. Works only if the previously received authenticationCodeInfo next_code_type was not null and the server-specified timeout has passed
data ResendChangePhoneNumberCode = ResendChangePhoneNumberCode
  {
  }
  deriving (Eq)

instance Show ResendChangePhoneNumberCode where
  show ResendChangePhoneNumberCode =
    "ResendChangePhoneNumberCode"
      ++ U.cc
        []

instance T.ToJSON ResendChangePhoneNumberCode where
  toJSON ResendChangePhoneNumberCode =
    A.object
      [ "@type" A..= T.String "resendChangePhoneNumberCode"
      ]
