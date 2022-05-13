{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetAccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.AccountTtl as AccountTtl
import qualified Utils as U

-- |
-- Changes the period of inactivity after which the account of the current user will automatically be deleted @ttl New account TTL
data SetAccountTtl = SetAccountTtl
  { -- |
    ttl :: Maybe AccountTtl.AccountTtl
  }
  deriving (Eq)

instance Show SetAccountTtl where
  show
    SetAccountTtl
      { ttl = ttl_
      } =
      "SetAccountTtl"
        ++ U.cc
          [ U.p "ttl" ttl_
          ]

instance T.ToJSON SetAccountTtl where
  toJSON
    SetAccountTtl
      { ttl = ttl_
      } =
      A.object
        [ "@type" A..= T.String "setAccountTtl",
          "ttl" A..= ttl_
        ]
