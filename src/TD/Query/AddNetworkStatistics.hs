module TD.Query.AddNetworkStatistics
  (AddNetworkStatistics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry

-- | Adds the specified data to data usage statistics. Can be called before authorization. Returns 'TD.Data.Ok.Ok'
data AddNetworkStatistics
  = AddNetworkStatistics
    { entry :: Maybe NetworkStatisticsEntry.NetworkStatisticsEntry -- ^ The network statistics entry with the data to be added to statistics
    }
  deriving (Eq, Show)

instance I.ShortShow AddNetworkStatistics where
  shortShow
    AddNetworkStatistics
      { entry = entry_
      }
        = "AddNetworkStatistics"
          ++ I.cc
          [ "entry" `I.p` entry_
          ]

instance AT.ToJSON AddNetworkStatistics where
  toJSON
    AddNetworkStatistics
      { entry = entry_
      }
        = A.object
          [ "@type" A..= AT.String "addNetworkStatistics"
          , "entry" A..= entry_
          ]

