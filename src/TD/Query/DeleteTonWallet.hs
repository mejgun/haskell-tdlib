module TD.Query.DeleteTonWallet
  (DeleteTonWallet(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Deletes the current TON wallet of the user and creates a new one; can be used only if getOption("can_use_ton_wallet"). Returns 'TD.Data.Ok.Ok'
data DeleteTonWallet
  = DeleteTonWallet
    { password :: Maybe T.Text -- ^ Password of the current user; pass an empty string unless receive an error with a message "PASSWORD_MISSING" for a passwordless request
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteTonWallet where
  shortShow
    DeleteTonWallet
      { password = password_
      }
        = "DeleteTonWallet"
          ++ I.cc
          [ "password" `I.p` password_
          ]

instance AT.ToJSON DeleteTonWallet where
  toJSON
    DeleteTonWallet
      { password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteTonWallet"
          , "password" A..= password_
          ]

