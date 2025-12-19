module TD.Query.GetPasskeyParameters
  (GetPasskeyParameters(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns parameters for creating of a new passkey as JSON-serialized string. Returns 'TD.Data.Text.Text'
data GetPasskeyParameters
  = GetPasskeyParameters
  deriving (Eq, Show)

instance I.ShortShow GetPasskeyParameters where
  shortShow
    GetPasskeyParameters
        = "GetPasskeyParameters"

instance AT.ToJSON GetPasskeyParameters where
  toJSON
    GetPasskeyParameters
        = A.object
          [ "@type" A..= AT.String "getPasskeyParameters"
          ]

