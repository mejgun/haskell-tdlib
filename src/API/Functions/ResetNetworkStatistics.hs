-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ResetNetworkStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ResetNetworkStatistics = 
 ResetNetworkStatistics -- deriving (Show)

instance T.ToJSON ResetNetworkStatistics where
 toJSON (ResetNetworkStatistics {  }) =
  A.object [ "@type" A..= T.String "resetNetworkStatistics" ]
-- resetNetworkStatistics ResetNetworkStatistics 

