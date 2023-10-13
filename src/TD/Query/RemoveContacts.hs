module TD.Query.RemoveContacts(RemoveContacts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data RemoveContacts -- ^ Removes users from the contact list
  = RemoveContacts
    { user_ids :: Maybe [Int] -- ^ Identifiers of users to be deleted
    }
  deriving (Eq)

instance Show RemoveContacts where
  show
    RemoveContacts
      { user_ids = user_ids_
      }
        = "RemoveContacts"
          ++ I.cc
          [ "user_ids" `I.p` user_ids_
          ]

instance AT.ToJSON RemoveContacts where
  toJSON
    RemoveContacts
      { user_ids = user_ids_
      }
        = A.object
          [ "@type"    A..= AT.String "removeContacts"
          , "user_ids" A..= user_ids_
          ]
