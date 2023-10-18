module TD.Query.GetContacts
  (GetContacts(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns all contacts of the user. Returns 'TD.Data.Users.Users'
data GetContacts
  = GetContacts
  deriving (Eq, Show)

instance I.ShortShow GetContacts where
  shortShow
    GetContacts
        = "GetContacts"

instance AT.ToJSON GetContacts where
  toJSON
    GetContacts
        = A.object
          [ "@type" A..= AT.String "getContacts"
          ]

