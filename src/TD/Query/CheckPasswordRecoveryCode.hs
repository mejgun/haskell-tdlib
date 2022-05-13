{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckPasswordRecoveryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether a 2-step verification password recovery code sent to an email address is valid @recovery_code Recovery code to check
data CheckPasswordRecoveryCode = CheckPasswordRecoveryCode
  { -- |
    recovery_code :: Maybe String
  }
  deriving (Eq)

instance Show CheckPasswordRecoveryCode where
  show
    CheckPasswordRecoveryCode
      { recovery_code = recovery_code_
      } =
      "CheckPasswordRecoveryCode"
        ++ U.cc
          [ U.p "recovery_code" recovery_code_
          ]

instance T.ToJSON CheckPasswordRecoveryCode where
  toJSON
    CheckPasswordRecoveryCode
      { recovery_code = recovery_code_
      } =
      A.object
        [ "@type" A..= T.String "checkPasswordRecoveryCode",
          "recovery_code" A..= recovery_code_
        ]
