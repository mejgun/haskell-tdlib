{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResendLoginEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resends the login email address verification code
data ResendLoginEmailAddressCode = ResendLoginEmailAddressCode
  {
  }
  deriving (Eq)

instance Show ResendLoginEmailAddressCode where
  show ResendLoginEmailAddressCode =
    "ResendLoginEmailAddressCode"
      ++ U.cc
        []

instance T.ToJSON ResendLoginEmailAddressCode where
  toJSON ResendLoginEmailAddressCode =
    A.object
      [ "@type" A..= T.String "resendLoginEmailAddressCode"
      ]
