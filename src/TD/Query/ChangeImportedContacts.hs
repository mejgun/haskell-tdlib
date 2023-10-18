module TD.Query.ChangeImportedContacts
  (ChangeImportedContacts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Contact as Contact

-- | Changes imported contacts using the list of contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts. Query result depends on the result of the previous query, so only one query is possible at the same time. Returns 'TD.Data.ImportedContacts.ImportedContacts'
data ChangeImportedContacts
  = ChangeImportedContacts
    { contacts :: Maybe [Contact.Contact] -- ^ The new list of contacts, contact's vCard are ignored and are not imported
    }
  deriving (Eq, Show)

instance I.ShortShow ChangeImportedContacts where
  shortShow
    ChangeImportedContacts
      { contacts = contacts_
      }
        = "ChangeImportedContacts"
          ++ I.cc
          [ "contacts" `I.p` contacts_
          ]

instance AT.ToJSON ChangeImportedContacts where
  toJSON
    ChangeImportedContacts
      { contacts = contacts_
      }
        = A.object
          [ "@type"    A..= AT.String "changeImportedContacts"
          , "contacts" A..= contacts_
          ]

