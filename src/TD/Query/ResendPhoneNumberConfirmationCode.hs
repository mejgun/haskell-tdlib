{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ResendPhoneNumberConfirmationCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends phone number confirmation code
data ResendPhoneNumberConfirmationCode = ResendPhoneNumberConfirmationCode
  {
  }
  deriving (Eq)

instance Show ResendPhoneNumberConfirmationCode where
  show ResendPhoneNumberConfirmationCode =
    "ResendPhoneNumberConfirmationCode"
      ++ U.cc
        []

instance T.ToJSON ResendPhoneNumberConfirmationCode where
  toJSON ResendPhoneNumberConfirmationCode =
    A.object
      [ "@type" A..= T.String "resendPhoneNumberConfirmationCode"
      ]
