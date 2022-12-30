{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.RecoverAuthenticationPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Recovers the 2-step verification password with a password recovery code sent to an email address that was previously set up. Works only when the current authorization state is authorizationStateWaitPassword
data RecoverAuthenticationPassword = RecoverAuthenticationPassword
  { -- | New password hint; may be empty
    new_hint :: Maybe String,
    -- | New 2-step verification password of the user; may be empty to remove the password
    new_password :: Maybe String,
    -- | Recovery code to check
    recovery_code :: Maybe String
  }
  deriving (Eq)

instance Show RecoverAuthenticationPassword where
  show
    RecoverAuthenticationPassword
      { new_hint = new_hint_,
        new_password = new_password_,
        recovery_code = recovery_code_
      } =
      "RecoverAuthenticationPassword"
        ++ U.cc
          [ U.p "new_hint" new_hint_,
            U.p "new_password" new_password_,
            U.p "recovery_code" recovery_code_
          ]

instance T.ToJSON RecoverAuthenticationPassword where
  toJSON
    RecoverAuthenticationPassword
      { new_hint = new_hint_,
        new_password = new_password_,
        recovery_code = recovery_code_
      } =
      A.object
        [ "@type" A..= T.String "recoverAuthenticationPassword",
          "new_hint" A..= new_hint_,
          "new_password" A..= new_password_,
          "recovery_code" A..= recovery_code_
        ]
