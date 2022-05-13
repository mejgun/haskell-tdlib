{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ResetNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Resets all network data usage statistics to zero. Can be called before authorization
data ResetNetworkStatistics = ResetNetworkStatistics
  {
  }
  deriving (Eq)

instance Show ResetNetworkStatistics where
  show ResetNetworkStatistics =
    "ResetNetworkStatistics"
      ++ U.cc
        []

instance T.ToJSON ResetNetworkStatistics where
  toJSON ResetNetworkStatistics =
    A.object
      [ "@type" A..= T.String "resetNetworkStatistics"
      ]
