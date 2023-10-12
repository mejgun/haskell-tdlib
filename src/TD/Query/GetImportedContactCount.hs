module TD.Query.GetImportedContactCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetImportedContactCount -- ^ Returns the total number of imported contacts
  = GetImportedContactCount
  deriving (Eq)

instance Show GetImportedContactCount where
  show
    GetImportedContactCount
        = "GetImportedContactCount"

instance AT.ToJSON GetImportedContactCount where
  toJSON
    GetImportedContactCount
        = A.object
          [ "@type" A..= AT.String "getImportedContactCount"
          ]
