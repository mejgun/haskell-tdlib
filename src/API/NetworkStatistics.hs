-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkStatisticsEntry as NetworkStatisticsEntry

data NetworkStatistics = 
 NetworkStatistics { entries :: [NetworkStatisticsEntry.NetworkStatisticsEntry], since_date :: Int }  deriving (Show)

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
    entries <- o A..: "entries"
    since_date <- o A..: "since_date"
    return $ NetworkStatistics { entries = entries, since_date = since_date }