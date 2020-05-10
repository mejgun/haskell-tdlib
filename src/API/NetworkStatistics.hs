-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkStatisticsEntry as NetworkStatisticsEntry

-- |
-- 
-- A full list of available network statistic entries 
-- 
-- __since_date__ Point in time (Unix timestamp) when the app began collecting statistics
-- 
-- __entries__ Network statistics entries
data NetworkStatistics = 

 NetworkStatistics { entries :: Maybe [NetworkStatisticsEntry.NetworkStatisticsEntry], since_date :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON NetworkStatistics where
 toJSON (NetworkStatistics { entries = entries, since_date = since_date }) =
  A.object [ "@type" A..= T.String "networkStatistics", "entries" A..= entries, "since_date" A..= since_date ]

instance T.FromJSON NetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "networkStatistics" -> parseNetworkStatistics v
   _ -> mempty
  where
   parseNetworkStatistics :: A.Value -> T.Parser NetworkStatistics
   parseNetworkStatistics = A.withObject "NetworkStatistics" $ \o -> do
    entries <- o A..:? "entries"
    since_date <- mconcat [ o A..:? "since_date", readMaybe <$> (o A..: "since_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ NetworkStatistics { entries = entries, since_date = since_date }