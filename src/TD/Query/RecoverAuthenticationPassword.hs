{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RecoverAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Recovers the password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
data RecoverAuthenticationPassword = RecoverAuthenticationPassword
  { -- |
    new_hint :: Maybe String,
    -- |
    new_password :: Maybe String,
    -- | Recovery code to check @new_password New password of the user; may be empty to remove the password @new_hint New password hint; may be empty
    recovery_code :: Maybe String
  }
  deriving (Eq)

instance Show RecoverAuthenticationPassword where
  show
    RecoverAuthenticationPassword
      { new_hint = new_hint,
        new_password = new_password,
        recovery_code = recovery_code
      } =
      "RecoverAuthenticationPassword"
        ++ U.cc
          [ U.p "new_hint" new_hint,
            U.p "new_password" new_password,
            U.p "recovery_code" recovery_code
          ]

instance T.ToJSON RecoverAuthenticationPassword where
  toJSON
    RecoverAuthenticationPassword
      { new_hint = new_hint,
        new_password = new_password,
        recovery_code = recovery_code
      } =
      A.object
        [ "@type" A..= T.String "recoverAuthenticationPassword",
          "new_hint" A..= new_hint,
          "new_password" A..= new_password,
          "recovery_code" A..= recovery_code
        ]
