-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.NetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkStatisticsEntry as NetworkStatisticsEntry

--main = putStrLn "ok"

data NetworkStatistics = 
 NetworkStatistics { entries :: [NetworkStatisticsEntry.NetworkStatisticsEntry], since_date :: Int }  -- deriving (Show)

instance T.ToJSON NetworkStatistics where
 toJSON (NetworkStatistics { entries = entries, since_date = since_date }) =
  A.object [ "@type" A..= T.String "networkStatistics", "entries" A..= entries, "since_date" A..= since_date ]
-- networkStatistics NetworkStatistics  { entries :: [NetworkStatisticsEntry.NetworkStatisticsEntry], since_date :: Int } 

