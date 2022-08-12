{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the 2-step verification password for the current user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
data SetPassword = SetPassword
  { -- |
    new_recovery_email_address :: Maybe String,
    -- |
    set_recovery_email_address :: Maybe Bool,
    -- |
    new_hint :: Maybe String,
    -- |
    new_password :: Maybe String,
    -- | Previous 2-step verification password of the user @new_password New 2-step verification password of the user; may be empty to remove the password @new_hint New password hint; may be empty @set_recovery_email_address Pass true to change also the recovery email address @new_recovery_email_address New recovery email address; may be empty
    old_password :: Maybe String
  }
  deriving (Eq)

instance Show SetPassword where
  show
    SetPassword
      { new_recovery_email_address = new_recovery_email_address_,
        set_recovery_email_address = set_recovery_email_address_,
        new_hint = new_hint_,
        new_password = new_password_,
        old_password = old_password_
      } =
      "SetPassword"
        ++ U.cc
          [ U.p "new_recovery_email_address" new_recovery_email_address_,
            U.p "set_recovery_email_address" set_recovery_email_address_,
            U.p "new_hint" new_hint_,
            U.p "new_password" new_password_,
            U.p "old_password" old_password_
          ]

instance T.ToJSON SetPassword where
  toJSON
    SetPassword
      { new_recovery_email_address = new_recovery_email_address_,
        set_recovery_email_address = set_recovery_email_address_,
        new_hint = new_hint_,
        new_password = new_password_,
        old_password = old_password_
      } =
      A.object
        [ "@type" A..= T.String "setPassword",
          "new_recovery_email_address" A..= new_recovery_email_address_,
          "set_recovery_email_address" A..= set_recovery_email_address_,
          "new_hint" A..= new_hint_,
          "new_password" A..= new_password_,
          "old_password" A..= old_password_
        ]
