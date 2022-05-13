{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckRecoveryEmailAddressCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks the 2-step verification recovery email address verification code @code Verification code to check
data CheckRecoveryEmailAddressCode = CheckRecoveryEmailAddressCode
  { -- |
    code :: Maybe String
  }
  deriving (Eq)

instance Show CheckRecoveryEmailAddressCode where
  show
    CheckRecoveryEmailAddressCode
      { code = code_
      } =
      "CheckRecoveryEmailAddressCode"
        ++ U.cc
          [ U.p "code" code_
          ]

instance T.ToJSON CheckRecoveryEmailAddressCode where
  toJSON
    CheckRecoveryEmailAddressCode
      { code = code_
      } =
      A.object
        [ "@type" A..= T.String "checkRecoveryEmailAddressCode",
          "code" A..= code_
        ]
