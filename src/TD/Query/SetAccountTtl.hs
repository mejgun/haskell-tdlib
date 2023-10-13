module TD.Query.SetAccountTtl
  (SetAccountTtl(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.AccountTtl as AccountTtl

-- | Changes the period of inactivity after which the account of the current user will automatically be deleted
data SetAccountTtl
  = SetAccountTtl
    { ttl :: Maybe AccountTtl.AccountTtl -- ^ New account TTL
    }
  deriving (Eq)

instance Show SetAccountTtl where
  show
    SetAccountTtl
      { ttl = ttl_
      }
        = "SetAccountTtl"
          ++ I.cc
          [ "ttl" `I.p` ttl_
          ]

instance AT.ToJSON SetAccountTtl where
  toJSON
    SetAccountTtl
      { ttl = ttl_
      }
        = A.object
          [ "@type" A..= AT.String "setAccountTtl"
          , "ttl"   A..= ttl_
          ]

