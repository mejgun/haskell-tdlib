module TD.Query.GetImportedContactCount
  (GetImportedContactCount(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

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

