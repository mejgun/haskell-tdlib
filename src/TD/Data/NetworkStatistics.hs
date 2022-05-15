{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.NetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.NetworkStatisticsEntry as NetworkStatisticsEntry
import qualified Utils as U

-- |
data NetworkStatistics = -- | A full list of available network statistic entries @since_date Point in time (Unix timestamp) from which the statistics are collected @entries Network statistics entries
  NetworkStatistics
  { -- |
    entries :: Maybe [NetworkStatisticsEntry.NetworkStatisticsEntry],
    -- |
    since_date :: Maybe Int
  }
  deriving (Eq)

instance Show NetworkStatistics where
  show
    NetworkStatistics
      { entries = entries_,
        since_date = since_date_
      } =
      "NetworkStatistics"
        ++ U.cc
          [ U.p "entries" entries_,
            U.p "since_date" since_date_
          ]

instance T.FromJSON NetworkStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "networkStatistics" -> parseNetworkStatistics v
      _ -> mempty
    where
      parseNetworkStatistics :: A.Value -> T.Parser NetworkStatistics
      parseNetworkStatistics = A.withObject "NetworkStatistics" $ \o -> do
        entries_ <- o A..:? "entries"
        since_date_ <- o A..:? "since_date"
        return $ NetworkStatistics {entries = entries_, since_date = since_date_}
  parseJSON _ = mempty

instance T.ToJSON NetworkStatistics where
  toJSON
    NetworkStatistics
      { entries = entries_,
        since_date = since_date_
      } =
      A.object
        [ "@type" A..= T.String "networkStatistics",
          "entries" A..= entries_,
          "since_date" A..= since_date_
        ]
