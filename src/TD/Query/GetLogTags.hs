{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLogTags where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns list of available TDLib internal log tags, for example, ["actor", "binlog", "connections", "notifications", "proxy"]. Can be called synchronously
data GetLogTags = GetLogTags
  {
  }
  deriving (Eq)

instance Show GetLogTags where
  show GetLogTags =
    "GetLogTags"
      ++ U.cc
        []

instance T.ToJSON GetLogTags where
  toJSON GetLogTags =
    A.object
      [ "@type" A..= T.String "getLogTags"
      ]
