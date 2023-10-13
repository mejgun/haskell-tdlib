module TD.Query.GetPasswordState
  (GetPasswordState(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

-- | Returns the current state of 2-step verification
data GetPasswordState
  = GetPasswordState
  deriving (Eq)

instance Show GetPasswordState where
  show
    GetPasswordState
        = "GetPasswordState"

instance AT.ToJSON GetPasswordState where
  toJSON
    GetPasswordState
        = A.object
          [ "@type" A..= AT.String "getPasswordState"
          ]

