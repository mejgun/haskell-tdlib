-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticsGraph where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes a statistics graph
data StatisticsGraph = 
 -- |
 -- 
 -- A graph data 
 -- 
 -- __json_data__ Graph data in JSON format
 -- 
 -- __zoom_token__ If non-empty, a token which can be used to receive a zoomed in graph
 StatisticsGraphData { zoom_token :: Maybe String, json_data :: Maybe String }  |
 -- |
 -- 
 -- The graph data to be asynchronously loaded through getChatStatisticsGraph 
 -- 
 -- __token__ The token to use for data loading
 StatisticsGraphAsync { token :: Maybe String }  |
 -- |
 -- 
 -- An error message to be shown to the user instead of the graph 
 -- 
 -- __error_message__ The error message
 StatisticsGraphError { error_message :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON StatisticsGraph where
 toJSON (StatisticsGraphData { zoom_token = zoom_token, json_data = json_data }) =
  A.object [ "@type" A..= T.String "statisticsGraphData", "zoom_token" A..= zoom_token, "json_data" A..= json_data ]

 toJSON (StatisticsGraphAsync { token = token }) =
  A.object [ "@type" A..= T.String "statisticsGraphAsync", "token" A..= token ]

 toJSON (StatisticsGraphError { error_message = error_message }) =
  A.object [ "@type" A..= T.String "statisticsGraphError", "error_message" A..= error_message ]

instance T.FromJSON StatisticsGraph where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "statisticsGraphData" -> parseStatisticsGraphData v
   "statisticsGraphAsync" -> parseStatisticsGraphAsync v
   "statisticsGraphError" -> parseStatisticsGraphError v
   _ -> mempty
  where
   parseStatisticsGraphData :: A.Value -> T.Parser StatisticsGraph
   parseStatisticsGraphData = A.withObject "StatisticsGraphData" $ \o -> do
    zoom_token <- o A..:? "zoom_token"
    json_data <- o A..:? "json_data"
    return $ StatisticsGraphData { zoom_token = zoom_token, json_data = json_data }

   parseStatisticsGraphAsync :: A.Value -> T.Parser StatisticsGraph
   parseStatisticsGraphAsync = A.withObject "StatisticsGraphAsync" $ \o -> do
    token <- o A..:? "token"
    return $ StatisticsGraphAsync { token = token }

   parseStatisticsGraphError :: A.Value -> T.Parser StatisticsGraph
   parseStatisticsGraphError = A.withObject "StatisticsGraphError" $ \o -> do
    error_message <- o A..:? "error_message"
    return $ StatisticsGraphError { error_message = error_message }