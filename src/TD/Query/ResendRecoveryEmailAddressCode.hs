{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendRecoveryEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends the 2-step verification recovery email address verification code
data ResendRecoveryEmailAddressCode = ResendRecoveryEmailAddressCode
  {
  }
  deriving (Eq)

instance Show ResendRecoveryEmailAddressCode where
  show ResendRecoveryEmailAddressCode =
    "ResendRecoveryEmailAddressCode"
      ++ U.cc
        []

instance T.ToJSON ResendRecoveryEmailAddressCode where
  toJSON ResendRecoveryEmailAddressCode =
    A.object
      [ "@type" A..= T.String "resendRecoveryEmailAddressCode"
      ]
