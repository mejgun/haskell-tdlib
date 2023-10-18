module TD.Query.SetPassword
  (SetPassword(..)
  , defaultSetPassword
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the 2-step verification password for the current user. If a new recovery email address is specified, then the change will not be applied until the new recovery email address is confirmed. Returns 'TD.Data.PasswordState.PasswordState'
data SetPassword
  = SetPassword
    { old_password               :: Maybe T.Text -- ^ Previous 2-step verification password of the user
    , new_password               :: Maybe T.Text -- ^ New 2-step verification password of the user; may be empty to remove the password
    , new_hint                   :: Maybe T.Text -- ^ New password hint; may be empty
    , set_recovery_email_address :: Maybe Bool   -- ^ Pass true to change also the recovery email address
    , new_recovery_email_address :: Maybe T.Text -- ^ New recovery email address; may be empty
    }
  deriving (Eq, Show)

instance I.ShortShow SetPassword where
  shortShow
    SetPassword
      { old_password               = old_password_
      , new_password               = new_password_
      , new_hint                   = new_hint_
      , set_recovery_email_address = set_recovery_email_address_
      , new_recovery_email_address = new_recovery_email_address_
      }
        = "SetPassword"
          ++ I.cc
          [ "old_password"               `I.p` old_password_
          , "new_password"               `I.p` new_password_
          , "new_hint"                   `I.p` new_hint_
          , "set_recovery_email_address" `I.p` set_recovery_email_address_
          , "new_recovery_email_address" `I.p` new_recovery_email_address_
          ]

instance AT.ToJSON SetPassword where
  toJSON
    SetPassword
      { old_password               = old_password_
      , new_password               = new_password_
      , new_hint                   = new_hint_
      , set_recovery_email_address = set_recovery_email_address_
      , new_recovery_email_address = new_recovery_email_address_
      }
        = A.object
          [ "@type"                      A..= AT.String "setPassword"
          , "old_password"               A..= old_password_
          , "new_password"               A..= new_password_
          , "new_hint"                   A..= new_hint_
          , "set_recovery_email_address" A..= set_recovery_email_address_
          , "new_recovery_email_address" A..= new_recovery_email_address_
          ]

defaultSetPassword :: SetPassword
defaultSetPassword =
  SetPassword
    { old_password               = Nothing
    , new_password               = Nothing
    , new_hint                   = Nothing
    , set_recovery_email_address = Nothing
    , new_recovery_email_address = Nothing
    }

