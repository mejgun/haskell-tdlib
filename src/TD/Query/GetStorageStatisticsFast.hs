{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStorageStatisticsFast where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Quickly returns approximate storage usage statistics. Can be called before authorization
data GetStorageStatisticsFast = GetStorageStatisticsFast
  {
  }
  deriving (Eq)

instance Show GetStorageStatisticsFast where
  show GetStorageStatisticsFast =
    "GetStorageStatisticsFast"
      ++ U.cc
        []

instance T.ToJSON GetStorageStatisticsFast where
  toJSON GetStorageStatisticsFast =
    A.object
      [ "@type" A..= T.String "getStorageStatisticsFast"
      ]
