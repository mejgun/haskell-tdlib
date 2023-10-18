module TD.Query.GetAccountTtl
  (GetAccountTtl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the period of inactivity after which the account of the current user will automatically be deleted. Returns 'TD.Data.AccountTtl.AccountTtl'
data GetAccountTtl
  = GetAccountTtl
  deriving (Eq, Show)

instance I.ShortShow GetAccountTtl where
  shortShow
    GetAccountTtl
        = "GetAccountTtl"

instance AT.ToJSON GetAccountTtl where
  toJSON
    GetAccountTtl
        = A.object
          [ "@type" A..= AT.String "getAccountTtl"
          ]

