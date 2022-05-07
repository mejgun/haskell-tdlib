{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns network data usage statistics. Can be called before authorization @only_current Pass true to get statistics only for the current library launch
data GetNetworkStatistics = GetNetworkStatistics
  { -- |
    only_current :: Maybe Bool
  }
  deriving (Eq)

instance Show GetNetworkStatistics where
  show
    GetNetworkStatistics
      { only_current = only_current
      } =
      "GetNetworkStatistics"
        ++ U.cc
          [ U.p "only_current" only_current
          ]

instance T.ToJSON GetNetworkStatistics where
  toJSON
    GetNetworkStatistics
      { only_current = only_current
      } =
      A.object
        [ "@type" A..= T.String "getNetworkStatistics",
          "only_current" A..= only_current
        ]
