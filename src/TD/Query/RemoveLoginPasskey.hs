module TD.Query.RemoveLoginPasskey
  (RemoveLoginPasskey(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Removes a passkey from the list of passkeys allowed to be used for the login by the current user. Returns 'TD.Data.Ok.Ok'
data RemoveLoginPasskey
  = RemoveLoginPasskey
    { passkey_id :: Maybe T.Text -- ^ Unique identifier of the passkey to remove
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveLoginPasskey where
  shortShow
    RemoveLoginPasskey
      { passkey_id = passkey_id_
      }
        = "RemoveLoginPasskey"
          ++ I.cc
          [ "passkey_id" `I.p` passkey_id_
          ]

instance AT.ToJSON RemoveLoginPasskey where
  toJSON
    RemoveLoginPasskey
      { passkey_id = passkey_id_
      }
        = A.object
          [ "@type"      A..= AT.String "removeLoginPasskey"
          , "passkey_id" A..= passkey_id_
          ]

