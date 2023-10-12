module TD.Query.AddNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry

data AddNetworkStatistics -- ^ Adds the specified data to data usage statistics. Can be called before authorization
  = AddNetworkStatistics
    { entry :: Maybe NetworkStatisticsEntry.NetworkStatisticsEntry -- ^ The network statistics entry with the data to be added to statistics
    }
  deriving (Eq)

instance Show AddNetworkStatistics where
  show
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
