module TD.Query.ClearImportedContacts
  (ClearImportedContacts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Clears all imported contacts, contact list remains unchanged. Returns 'TD.Data.Ok.Ok'
data ClearImportedContacts
  = ClearImportedContacts
  deriving (Eq, Show)

instance I.ShortShow ClearImportedContacts where
  shortShow
    ClearImportedContacts
        = "ClearImportedContacts"

instance AT.ToJSON ClearImportedContacts where
  toJSON
    ClearImportedContacts
        = A.object
          [ "@type" A..= AT.String "clearImportedContacts"
          ]

