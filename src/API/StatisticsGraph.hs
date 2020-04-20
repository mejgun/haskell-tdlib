-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticsGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data StatisticsGraph = 
 StatisticsGraphData { zoom_token :: String, json_data :: String }  
 | StatisticsGraphAsync { token :: String }  
 | StatisticsGraphError { error_message :: String }  -- deriving (Show)

instance T.ToJSON StatisticsGraph where
 toJSON (StatisticsGraphData { zoom_token = zoom_token, json_data = json_data }) =
  A.object [ "@type" A..= T.String "statisticsGraphData", "zoom_token" A..= zoom_token, "json_data" A..= json_data ]

 toJSON (StatisticsGraphAsync { token = token }) =
  A.object [ "@type" A..= T.String "statisticsGraphAsync", "token" A..= token ]

 toJSON (StatisticsGraphError { error_message = error_message }) =
  A.object [ "@type" A..= T.String "statisticsGraphError", "error_message" A..= error_message ]
-- statisticsGraphData StatisticsGraph  { zoom_token :: String, json_data :: String } 

-- statisticsGraphAsync StatisticsGraph  { token :: String } 

-- statisticsGraphError StatisticsGraph  { error_message :: String } 

