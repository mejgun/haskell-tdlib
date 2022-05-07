{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.NetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.NetworkStatisticsEntry as NetworkStatisticsEntry
import qualified Utils as U

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
      { entries = entries,
        since_date = since_date
      } =
      "NetworkStatistics"
        ++ U.cc
          [ U.p "entries" entries,
            U.p "since_date" since_date
          ]

instance T.FromJSON NetworkStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "networkStatistics" -> parseNetworkStatistics v
      _ -> fail ""
    where
      parseNetworkStatistics :: A.Value -> T.Parser NetworkStatistics
      parseNetworkStatistics = A.withObject "NetworkStatistics" $ \o -> do
        entries_ <- o A..:? "entries"
        since_date_ <- mconcat [o A..:? "since_date", U.rm <$> (o A..: "since_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ NetworkStatistics {entries = entries_, since_date = since_date_}
  parseJSON _ = fail ""

instance T.ToJSON NetworkStatistics where
  toJSON
    NetworkStatistics
      { entries = entries,
        since_date = since_date
      } =
      A.object
        [ "@type" A..= T.String "networkStatistics",
          "entries" A..= entries,
          "since_date" A..= since_date
        ]
