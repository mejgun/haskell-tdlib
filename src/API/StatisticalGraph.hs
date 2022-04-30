-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.StatisticalGraph where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes a statistical graph
data StatisticalGraph = 
 -- |
 -- 
 -- A graph data 
 -- 
 -- __json_data__ Graph data in JSON format
 -- 
 -- __zoom_token__ If non-empty, a token which can be used to receive a zoomed in graph
 StatisticalGraphData { zoom_token :: Maybe String, json_data :: Maybe String }  |
 -- |
 -- 
 -- The graph data to be asynchronously loaded through getStatisticalGraph 
 -- 
 -- __token__ The token to use for data loading
 StatisticalGraphAsync { token :: Maybe String }  |
 -- |
 -- 
 -- An error message to be shown to the user instead of the graph 
 -- 
 -- __error_message__ The error message
 StatisticalGraphError { error_message :: Maybe String }  deriving (Eq)

instance Show StatisticalGraph where
 show StatisticalGraphData { zoom_token=zoom_token, json_data=json_data } =
  "StatisticalGraphData" ++ U.cc [U.p "zoom_token" zoom_token, U.p "json_data" json_data ]

 show StatisticalGraphAsync { token=token } =
  "StatisticalGraphAsync" ++ U.cc [U.p "token" token ]

 show StatisticalGraphError { error_message=error_message } =
  "StatisticalGraphError" ++ U.cc [U.p "error_message" error_message ]

instance T.ToJSON StatisticalGraph where
 toJSON StatisticalGraphData { zoom_token = zoom_token, json_data = json_data } =
  A.object [ "@type" A..= T.String "statisticalGraphData", "zoom_token" A..= zoom_token, "json_data" A..= json_data ]

 toJSON StatisticalGraphAsync { token = token } =
  A.object [ "@type" A..= T.String "statisticalGraphAsync", "token" A..= token ]

 toJSON StatisticalGraphError { error_message = error_message } =
  A.object [ "@type" A..= T.String "statisticalGraphError", "error_message" A..= error_message ]

instance T.FromJSON StatisticalGraph where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "statisticalGraphData" -> parseStatisticalGraphData v
   "statisticalGraphAsync" -> parseStatisticalGraphAsync v
   "statisticalGraphError" -> parseStatisticalGraphError v
   _ -> mempty
  where
   parseStatisticalGraphData :: A.Value -> T.Parser StatisticalGraph
   parseStatisticalGraphData = A.withObject "StatisticalGraphData" $ \o -> do
    zoom_token <- o A..:? "zoom_token"
    json_data <- o A..:? "json_data"
    return $ StatisticalGraphData { zoom_token = zoom_token, json_data = json_data }

   parseStatisticalGraphAsync :: A.Value -> T.Parser StatisticalGraph
   parseStatisticalGraphAsync = A.withObject "StatisticalGraphAsync" $ \o -> do
    token <- o A..:? "token"
    return $ StatisticalGraphAsync { token = token }

   parseStatisticalGraphError :: A.Value -> T.Parser StatisticalGraph
   parseStatisticalGraphError = A.withObject "StatisticalGraphError" $ \o -> do
    error_message <- o A..:? "error_message"
    return $ StatisticalGraphError { error_message = error_message }
 parseJSON _ = mempty
