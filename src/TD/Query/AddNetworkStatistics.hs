{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry
import qualified Utils as U

-- |
-- Adds the specified data to data usage statistics. Can be called before authorization @entry The network statistics entry with the data to be added to statistics
data AddNetworkStatistics = AddNetworkStatistics
  { -- |
    entry :: Maybe NetworkStatisticsEntry.NetworkStatisticsEntry
  }
  deriving (Eq)

instance Show AddNetworkStatistics where
  show
    AddNetworkStatistics
      { entry = entry
      } =
      "AddNetworkStatistics"
        ++ U.cc
          [ U.p "entry" entry
          ]

instance T.ToJSON AddNetworkStatistics where
  toJSON
    AddNetworkStatistics
      { entry = entry
      } =
      A.object
        [ "@type" A..= T.String "addNetworkStatistics",
          "entry" A..= entry
        ]
