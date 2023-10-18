module TD.Query.SetRecoveryEmailAddress
  (SetRecoveryEmailAddress(..)
  , defaultSetRecoveryEmailAddress
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the 2-step verification recovery email address of the user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed. If new_recovery_email_address is the same as the email address that is currently set up, this call succeeds immediately and aborts all other requests waiting for an email confirmation. Returns 'TD.Data.PasswordState.PasswordState'
data SetRecoveryEmailAddress
  = SetRecoveryEmailAddress
    { password                   :: Maybe T.Text -- ^ The 2-step verification password of the current user
    , new_recovery_email_address :: Maybe T.Text -- ^ New recovery email address
    }
  deriving (Eq, Show)

instance I.ShortShow SetRecoveryEmailAddress where
  shortShow
    SetRecoveryEmailAddress
      { password                   = password_
      , new_recovery_email_address = new_recovery_email_address_
      }
        = "SetRecoveryEmailAddress"
          ++ I.cc
          [ "password"                   `I.p` password_
          , "new_recovery_email_address" `I.p` new_recovery_email_address_
          ]

instance AT.ToJSON SetRecoveryEmailAddress where
  toJSON
    SetRecoveryEmailAddress
      { password                   = password_
      , new_recovery_email_address = new_recovery_email_address_
      }
        = A.object
          [ "@type"                      A..= AT.String "setRecoveryEmailAddress"
          , "password"                   A..= password_
          , "new_recovery_email_address" A..= new_recovery_email_address_
          ]

defaultSetRecoveryEmailAddress :: SetRecoveryEmailAddress
defaultSetRecoveryEmailAddress =
  SetRecoveryEmailAddress
    { password                   = Nothing
    , new_recovery_email_address = Nothing
    }

