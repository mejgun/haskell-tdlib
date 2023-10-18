module TD.Query.GetTemporaryPasswordState
  (GetTemporaryPasswordState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about the current temporary password. Returns 'TD.Data.TemporaryPasswordState.TemporaryPasswordState'
data GetTemporaryPasswordState
  = GetTemporaryPasswordState
  deriving (Eq, Show)

instance I.ShortShow GetTemporaryPasswordState where
  shortShow
    GetTemporaryPasswordState
        = "GetTemporaryPasswordState"

instance AT.ToJSON GetTemporaryPasswordState where
  toJSON
    GetTemporaryPasswordState
        = A.object
          [ "@type" A..= AT.String "getTemporaryPasswordState"
          ]

