module TD.Query.GetImportedContactCount
  (GetImportedContactCount(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the total number of imported contacts. Returns 'TD.Data.Count.Count'
data GetImportedContactCount
  = GetImportedContactCount
  deriving (Eq, Show)

instance I.ShortShow GetImportedContactCount where
  shortShow
    GetImportedContactCount
        = "GetImportedContactCount"

instance AT.ToJSON GetImportedContactCount where
  toJSON
    GetImportedContactCount
        = A.object
          [ "@type" A..= AT.String "getImportedContactCount"
          ]

