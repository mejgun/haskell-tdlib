-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticsGraph where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data StatisticsGraph = 
 StatisticsGraphData { zoom_token :: Maybe String, json_data :: Maybe String }  
 | StatisticsGraphAsync { token :: Maybe String }  
 | StatisticsGraphError { error_message :: Maybe String }  deriving (Show)

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
    zoom_token <- optional $ o A..: "zoom_token"
    json_data <- optional $ o A..: "json_data"
    return $ StatisticsGraphData { zoom_token = zoom_token, json_data = json_data }

   parseStatisticsGraphAsync :: A.Value -> T.Parser StatisticsGraph
   parseStatisticsGraphAsync = A.withObject "StatisticsGraphAsync" $ \o -> do
    token <- optional $ o A..: "token"
    return $ StatisticsGraphAsync { token = token }

   parseStatisticsGraphError :: A.Value -> T.Parser StatisticsGraph
   parseStatisticsGraphError = A.withObject "StatisticsGraphError" $ \o -> do
    error_message <- optional $ o A..: "error_message"
    return $ StatisticsGraphError { error_message = error_message }