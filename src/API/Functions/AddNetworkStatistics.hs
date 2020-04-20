-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.NetworkStatisticsEntry as NetworkStatisticsEntry

--main = putStrLn "ok"

data AddNetworkStatistics = 
 AddNetworkStatistics { entry :: NetworkStatisticsEntry.NetworkStatisticsEntry }  -- deriving (Show)

instance T.ToJSON AddNetworkStatistics where
 toJSON (AddNetworkStatistics { entry = entry }) =
  A.object [ "@type" A..= T.String "addNetworkStatistics", "entry" A..= entry ]
-- addNetworkStatistics AddNetworkStatistics  { entry :: NetworkStatisticsEntry.NetworkStatisticsEntry } 



instance T.FromJSON AddNetworkStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addNetworkStatistics" -> parseAddNetworkStatistics v
  where
   parseAddNetworkStatistics :: A.Value -> T.Parser AddNetworkStatistics
   parseAddNetworkStatistics = A.withObject "AddNetworkStatistics" $ \o -> do
    entry <- o A..: "entry"
    return $ AddNetworkStatistics { entry = entry }