{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ChangeImportedContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Contact as Contact
import qualified Utils as U

-- |
-- Changes imported contacts using the list of contacts saved on the device. Imports newly added contacts and, if at least the file database is enabled, deletes recently deleted contacts.
-- Query result depends on the result of the previous query, so only one query is possible at the same time
data ChangeImportedContacts = ChangeImportedContacts
  { -- | The new list of contacts, contact's vCard are ignored and are not imported
    contacts :: Maybe [Contact.Contact]
  }
  deriving (Eq)

instance Show ChangeImportedContacts where
  show
    ChangeImportedContacts
      { contacts = contacts_
      } =
      "ChangeImportedContacts"
        ++ U.cc
          [ U.p "contacts" contacts_
          ]

instance T.ToJSON ChangeImportedContacts where
  toJSON
    ChangeImportedContacts
      { contacts = contacts_
      } =
      A.object
        [ "@type" A..= T.String "changeImportedContacts",
          "contacts" A..= contacts_
        ]
