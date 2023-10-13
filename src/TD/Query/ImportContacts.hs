module TD.Query.ImportContacts
  (ImportContacts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Contact as Contact

data ImportContacts -- ^ Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored
  = ImportContacts
    { contacts :: Maybe [Contact.Contact] -- ^ The list of contacts to import or edit; contacts' vCard are ignored and are not imported
    }
  deriving (Eq)

instance Show ImportContacts where
  show
    ImportContacts
      { contacts = contacts_
      }
        = "ImportContacts"
          ++ I.cc
          [ "contacts" `I.p` contacts_
          ]

instance AT.ToJSON ImportContacts where
  toJSON
    ImportContacts
      { contacts = contacts_
      }
        = A.object
          [ "@type"    A..= AT.String "importContacts"
          , "contacts" A..= contacts_
          ]

