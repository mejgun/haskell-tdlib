module TD.Query.ClearImportedContacts(ClearImportedContacts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ClearImportedContacts -- ^ Clears all imported contacts, contact list remains unchanged
  = ClearImportedContacts
  deriving (Eq)

instance Show ClearImportedContacts where
  show
    ClearImportedContacts
        = "ClearImportedContacts"

instance AT.ToJSON ClearImportedContacts where
  toJSON
    ClearImportedContacts
        = A.object
          [ "@type" A..= AT.String "clearImportedContacts"
          ]
