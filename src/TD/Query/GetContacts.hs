module TD.Query.GetContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

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
