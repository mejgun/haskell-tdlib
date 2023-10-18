module TD.Query.RecoverPassword
  (RecoverPassword(..)
  , defaultRecoverPassword
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Recovers the 2-step verification password using a recovery code sent to an email address that was previously set up. Returns 'TD.Data.PasswordState.PasswordState'
data RecoverPassword
  = RecoverPassword
    { recovery_code :: Maybe T.Text -- ^ Recovery code to check
    , new_password  :: Maybe T.Text -- ^ New 2-step verification password of the user; may be empty to remove the password
    , new_hint      :: Maybe T.Text -- ^ New password hint; may be empty
    }
  deriving (Eq, Show)

instance I.ShortShow RecoverPassword where
  shortShow
    RecoverPassword
      { recovery_code = recovery_code_
      , new_password  = new_password_
      , new_hint      = new_hint_
      }
        = "RecoverPassword"
          ++ I.cc
          [ "recovery_code" `I.p` recovery_code_
          , "new_password"  `I.p` new_password_
          , "new_hint"      `I.p` new_hint_
          ]

instance AT.ToJSON RecoverPassword where
  toJSON
    RecoverPassword
      { recovery_code = recovery_code_
      , new_password  = new_password_
      , new_hint      = new_hint_
      }
        = A.object
          [ "@type"         A..= AT.String "recoverPassword"
          , "recovery_code" A..= recovery_code_
          , "new_password"  A..= new_password_
          , "new_hint"      A..= new_hint_
          ]

defaultRecoverPassword :: RecoverPassword
defaultRecoverPassword =
  RecoverPassword
    { recovery_code = Nothing
    , new_password  = Nothing
    , new_hint      = Nothing
    }

