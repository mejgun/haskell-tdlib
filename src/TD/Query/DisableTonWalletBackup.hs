module TD.Query.DisableTonWalletBackup
  (DisableTonWalletBackup(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Disables backup of the TON wallet of the user. Works only if tonWalletState.is_backup_enabled is true. Returns 'TD.Data.Ok.Ok'
data DisableTonWalletBackup
  = DisableTonWalletBackup
    { password :: Maybe T.Text -- ^ Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
    }
  deriving (Eq, Show)

instance I.ShortShow DisableTonWalletBackup where
  shortShow
    DisableTonWalletBackup
      { password = password_
      }
        = "DisableTonWalletBackup"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON DisableTonWalletBackup where
  toJSON
    DisableTonWalletBackup
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "disableTonWalletBackup"
          , "password" A..= password_
          ]

