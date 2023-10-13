module TD.Query.GetContacts(GetContacts(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetContacts -- ^ Returns all contacts of the user
  = GetContacts
  deriving (Eq)

instance Show GetContacts where
  show
    GetContacts
        = "GetContacts"

instance AT.ToJSON GetContacts where
  toJSON
    GetContacts
        = A.object
          [ "@type" A..= AT.String "getContacts"
          ]
