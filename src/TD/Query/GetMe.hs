module TD.Query.GetMe
  (GetMe(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetMe -- ^ Returns the current user
  = GetMe
  deriving (Eq)

instance Show GetMe where
  show
    GetMe
        = "GetMe"

instance AT.ToJSON GetMe where
  toJSON
    GetMe
        = A.object
          [ "@type" A..= AT.String "getMe"
          ]

