module TD.Query.DeleteAccount
  (DeleteAccount(..)
  , defaultDeleteAccount
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data DeleteAccount -- ^ Deletes the account of the current user, deleting all information associated with the user from the server. The phone number of the account can be used to create a new account. Can be called before authorization when the current authorization state is authorizationStateWaitPassword
  = DeleteAccount
    { reason   :: Maybe T.Text -- ^ The reason why the account was deleted; optional
    , password :: Maybe T.Text -- ^ The 2-step verification password of the current user. If not specified, account deletion can be canceled within one week
    }
  deriving (Eq)

instance Show DeleteAccount where
  show
    DeleteAccount
      { reason   = reason_
      , password = password_
      }
        = "DeleteAccount"
          ++ I.cc
          [ "reason"   `I.p` reason_
          , "password" `I.p` password_
          ]

instance AT.ToJSON DeleteAccount where
  toJSON
    DeleteAccount
      { reason   = reason_
      , password = password_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteAccount"
          , "reason"   A..= reason_
          , "password" A..= password_
          ]

defaultDeleteAccount :: DeleteAccount
defaultDeleteAccount =
  DeleteAccount
    { reason   = Nothing
    , password = Nothing
    }

