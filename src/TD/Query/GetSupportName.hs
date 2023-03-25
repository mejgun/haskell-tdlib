{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetSupportName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns localized name of the Telegram support user; for Telegram support only
data GetSupportName = GetSupportName
  {
  }
  deriving (Eq)

instance Show GetSupportName where
  show GetSupportName =
    "GetSupportName"
      ++ U.cc
        []

instance T.ToJSON GetSupportName where
  toJSON GetSupportName =
    A.object
      [ "@type" A..= T.String "getSupportName"
      ]
