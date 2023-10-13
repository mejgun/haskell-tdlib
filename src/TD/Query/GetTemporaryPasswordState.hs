module TD.Query.GetTemporaryPasswordState
  (GetTemporaryPasswordState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetTemporaryPasswordState -- ^ Returns information about the current temporary password
  = GetTemporaryPasswordState
  deriving (Eq)

instance Show GetTemporaryPasswordState where
  show
    GetTemporaryPasswordState
        = "GetTemporaryPasswordState"

instance AT.ToJSON GetTemporaryPasswordState where
  toJSON
    GetTemporaryPasswordState
        = A.object
          [ "@type" A..= AT.String "getTemporaryPasswordState"
          ]

