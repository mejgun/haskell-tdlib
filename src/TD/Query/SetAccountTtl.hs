{-# LANGUAGE OverloadedStrings #-}

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
      { ttl = ttl
      } =
      "SetAccountTtl"
        ++ U.cc
          [ U.p "ttl" ttl
          ]

instance T.ToJSON SetAccountTtl where
  toJSON
    SetAccountTtl
      { ttl = ttl
      } =
      A.object
        [ "@type" A..= T.String "setAccountTtl",
          "ttl" A..= ttl
        ]
