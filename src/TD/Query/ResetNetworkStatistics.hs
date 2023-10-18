module TD.Query.ResetNetworkStatistics
  (ResetNetworkStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Resets all network data usage statistics to zero. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data ResetNetworkStatistics
  = ResetNetworkStatistics
  deriving (Eq, Show)

instance I.ShortShow ResetNetworkStatistics where
  shortShow
    ResetNetworkStatistics
        = "ResetNetworkStatistics"

instance AT.ToJSON ResetNetworkStatistics where
  toJSON
    ResetNetworkStatistics
        = A.object
          [ "@type" A..= AT.String "resetNetworkStatistics"
          ]

