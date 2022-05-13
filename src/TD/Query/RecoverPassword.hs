{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RecoverPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Recovers the 2-step verification password using a recovery code sent to an email address that was previously set up
data RecoverPassword = RecoverPassword
  { -- |
    new_hint :: Maybe String,
    -- |
    new_password :: Maybe String,
    -- | Recovery code to check @new_password New password of the user; may be empty to remove the password @new_hint New password hint; may be empty
    recovery_code :: Maybe String
  }
  deriving (Eq)

instance Show RecoverPassword where
  show
    RecoverPassword
      { new_hint = new_hint_,
        new_password = new_password_,
        recovery_code = recovery_code_
      } =
      "RecoverPassword"
        ++ U.cc
          [ U.p "new_hint" new_hint_,
            U.p "new_password" new_password_,
            U.p "recovery_code" recovery_code_
          ]

instance T.ToJSON RecoverPassword where
  toJSON
    RecoverPassword
      { new_hint = new_hint_,
        new_password = new_password_,
        recovery_code = recovery_code_
      } =
      A.object
        [ "@type" A..= T.String "recoverPassword",
          "new_hint" A..= new_hint_,
          "new_password" A..= new_password_,
          "recovery_code" A..= recovery_code_
        ]
