{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CheckAuthenticationPasswordRecoveryCode where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Checks whether a 2-step verification password recovery code sent to an email address is valid. Works only when the current authorization state is authorizationStateWaitPassword @recovery_code Recovery code to check
data CheckAuthenticationPasswordRecoveryCode = CheckAuthenticationPasswordRecoveryCode
  { -- |
    recovery_code :: Maybe String
  }
  deriving (Eq)

instance Show CheckAuthenticationPasswordRecoveryCode where
  show
    CheckAuthenticationPasswordRecoveryCode
      { recovery_code = recovery_code_
      } =
      "CheckAuthenticationPasswordRecoveryCode"
        ++ U.cc
          [ U.p "recovery_code" recovery_code_
          ]

instance T.ToJSON CheckAuthenticationPasswordRecoveryCode where
  toJSON
    CheckAuthenticationPasswordRecoveryCode
      { recovery_code = recovery_code_
      } =
      A.object
        [ "@type" A..= T.String "checkAuthenticationPasswordRecoveryCode",
          "recovery_code" A..= recovery_code_
        ]
