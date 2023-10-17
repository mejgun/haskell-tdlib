module TD.Data.NetworkStatistics
  (NetworkStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry

data NetworkStatistics
  = NetworkStatistics -- ^ A full list of available network statistic entries
    { since_date :: Maybe Int                                             -- ^ Point in time (Unix timestamp) from which the statistics are collected
    , entries    :: Maybe [NetworkStatisticsEntry.NetworkStatisticsEntry] -- ^ Network statistics entries
    }
  deriving (Eq, Show)

instance I.ShortShow NetworkStatistics where
  shortShow NetworkStatistics
    { since_date = since_date_
    , entries    = entries_
    }
      = "NetworkStatistics"
        ++ I.cc
        [ "since_date" `I.p` since_date_
        , "entries"    `I.p` entries_
        ]

instance AT.FromJSON NetworkStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "networkStatistics" -> parseNetworkStatistics v
      _                   -> mempty
    
    where
      parseNetworkStatistics :: A.Value -> AT.Parser NetworkStatistics
      parseNetworkStatistics = A.withObject "NetworkStatistics" $ \o -> do
        since_date_ <- o A..:?  "since_date"
        entries_    <- o A..:?  "entries"
        pure $ NetworkStatistics
          { since_date = since_date_
          , entries    = entries_
          }
  parseJSON _ = mempty

