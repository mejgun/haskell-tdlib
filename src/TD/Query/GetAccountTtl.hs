{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetAccountTtl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the period of inactivity after which the account of the current user will automatically be deleted
data GetAccountTtl = GetAccountTtl
  {
  }
  deriving (Eq)

instance Show GetAccountTtl where
  show GetAccountTtl =
    "GetAccountTtl"
      ++ U.cc
        []

instance T.ToJSON GetAccountTtl where
  toJSON GetAccountTtl =
    A.object
      [ "@type" A..= T.String "getAccountTtl"
      ]
