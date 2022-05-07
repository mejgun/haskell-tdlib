{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ImportContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Contact as Contact
import qualified Utils as U

-- |
-- Adds new contacts or edits existing contacts by their phone numbers; contacts' user identifiers are ignored @contacts The list of contacts to import or edit; contacts' vCard are ignored and are not imported
data ImportContacts = ImportContacts
  { -- |
    contacts :: Maybe [Contact.Contact]
  }
  deriving (Eq)

instance Show ImportContacts where
  show
    ImportContacts
      { contacts = contacts
      } =
      "ImportContacts"
        ++ U.cc
          [ U.p "contacts" contacts
          ]

instance T.ToJSON ImportContacts where
  toJSON
    ImportContacts
      { contacts = contacts
      } =
      A.object
        [ "@type" A..= T.String "importContacts",
          "contacts" A..= contacts
        ]
