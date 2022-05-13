{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetDatabaseStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns database statistics
data GetDatabaseStatistics = GetDatabaseStatistics
  {
  }
  deriving (Eq)

instance Show GetDatabaseStatistics where
  show GetDatabaseStatistics =
    "GetDatabaseStatistics"
      ++ U.cc
        []

instance T.ToJSON GetDatabaseStatistics where
  toJSON GetDatabaseStatistics =
    A.object
      [ "@type" A..= T.String "getDatabaseStatistics"
      ]
