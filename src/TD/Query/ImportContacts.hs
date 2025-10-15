module TD.Query.ImportContacts
  (ImportContacts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ImportedContact as ImportedContact

-- | Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored. Returns 'TD.Data.ImportedContacts.ImportedContacts'
data ImportContacts
  = ImportContacts
    { contacts :: Maybe [ImportedContact.ImportedContact] -- ^ The list of contacts to import or edit
    }
  deriving (Eq, Show)

instance I.ShortShow ImportContacts where
  shortShow
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

