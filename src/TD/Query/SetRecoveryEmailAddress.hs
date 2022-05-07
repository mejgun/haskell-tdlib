{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetRecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed.
-- If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation @password Password of the current user @new_recovery_email_address New recovery email address
data SetRecoveryEmailAddress = SetRecoveryEmailAddress
  { -- |
    new_recovery_email_address :: Maybe String,
    -- |
    password :: Maybe String
  }
  deriving (Eq)

instance Show SetRecoveryEmailAddress where
  show
    SetRecoveryEmailAddress
      { new_recovery_email_address = new_recovery_email_address,
        password = password
      } =
      "SetRecoveryEmailAddress"
        ++ U.cc
          [ U.p "new_recovery_email_address" new_recovery_email_address,
            U.p "password" password
          ]

instance T.ToJSON SetRecoveryEmailAddress where
  toJSON
    SetRecoveryEmailAddress
      { new_recovery_email_address = new_recovery_email_address,
        password = password
      } =
      A.object
        [ "@type" A..= T.String "setRecoveryEmailAddress",
          "new_recovery_email_address" A..= new_recovery_email_address,
          "password" A..= password
        ]
