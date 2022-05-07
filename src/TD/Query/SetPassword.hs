{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetPassword where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the password for the current user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed
data SetPassword = SetPassword
  { -- |
    new_recovery_email_address :: Maybe String,
    -- |
    set_recovery_email_address :: Maybe Bool,
    -- |
    new_hint :: Maybe String,
    -- |
    new_password :: Maybe String,
    -- | Previous password of the user @new_password New password of the user; may be empty to remove the password @new_hint New password hint; may be empty @set_recovery_email_address Pass true to change also the recovery email address @new_recovery_email_address New recovery email address; may be empty
    old_password :: Maybe String
  }
  deriving (Eq)

instance Show SetPassword where
  show
    SetPassword
      { new_recovery_email_address = new_recovery_email_address,
        set_recovery_email_address = set_recovery_email_address,
        new_hint = new_hint,
        new_password = new_password,
        old_password = old_password
      } =
      "SetPassword"
        ++ U.cc
          [ U.p "new_recovery_email_address" new_recovery_email_address,
            U.p "set_recovery_email_address" set_recovery_email_address,
            U.p "new_hint" new_hint,
            U.p "new_password" new_password,
            U.p "old_password" old_password
          ]

instance T.ToJSON SetPassword where
  toJSON
    SetPassword
      { new_recovery_email_address = new_recovery_email_address,
        set_recovery_email_address = set_recovery_email_address,
        new_hint = new_hint,
        new_password = new_password,
        old_password = old_password
      } =
      A.object
        [ "@type" A..= T.String "setPassword",
          "new_recovery_email_address" A..= new_recovery_email_address,
          "set_recovery_email_address" A..= set_recovery_email_address,
          "new_hint" A..= new_hint,
          "new_password" A..= new_password,
          "old_password" A..= old_password
        ]
