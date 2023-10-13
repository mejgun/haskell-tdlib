module TD.Query.GetAccountTtl
  (GetAccountTtl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data GetAccountTtl -- ^ Returns the period of inactivity after which the account of the current user will automatically be deleted
  = GetAccountTtl
  deriving (Eq)

instance Show GetAccountTtl where
  show
    GetAccountTtl
        = "GetAccountTtl"

instance AT.ToJSON GetAccountTtl where
  toJSON
    GetAccountTtl
        = A.object
          [ "@type" A..= AT.String "getAccountTtl"
          ]

