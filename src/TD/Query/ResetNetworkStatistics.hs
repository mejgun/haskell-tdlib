module TD.Query.ResetNetworkStatistics
  (ResetNetworkStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data ResetNetworkStatistics -- ^ Resets all network data usage statistics to zero. Can be called before authorization
  = ResetNetworkStatistics
  deriving (Eq)

instance Show ResetNetworkStatistics where
  show
    ResetNetworkStatistics
        = "ResetNetworkStatistics"

instance AT.ToJSON ResetNetworkStatistics where
  toJSON
    ResetNetworkStatistics
        = A.object
          [ "@type" A..= AT.String "resetNetworkStatistics"
          ]

