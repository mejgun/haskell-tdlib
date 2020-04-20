-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatStatisticsMessageInteractionCounters as ChatStatisticsMessageInteractionCounters
import {-# SOURCE #-} qualified API.StatisticsGraph as StatisticsGraph
import {-# SOURCE #-} qualified API.StatisticsValue as StatisticsValue
import {-# SOURCE #-} qualified API.DateRange as DateRange

--main = putStrLn "ok"

data ChatStatistics = 
 ChatStatistics { recent_message_interactions :: [ChatStatisticsMessageInteractionCounters.ChatStatisticsMessageInteractionCounters], instant_view_interaction_graph :: StatisticsGraph.StatisticsGraph, message_interaction_graph :: StatisticsGraph.StatisticsGraph, language_graph :: StatisticsGraph.StatisticsGraph, join_by_source_graph :: StatisticsGraph.StatisticsGraph, view_count_by_source_graph :: StatisticsGraph.StatisticsGraph, view_count_by_hour_graph :: StatisticsGraph.StatisticsGraph, mute_graph :: StatisticsGraph.StatisticsGraph, join_graph :: StatisticsGraph.StatisticsGraph, member_count_graph :: StatisticsGraph.StatisticsGraph, enabled_notifications_percentage :: Float, mean_share_count :: StatisticsValue.StatisticsValue, mean_view_count :: StatisticsValue.StatisticsValue, member_count :: StatisticsValue.StatisticsValue, period :: DateRange.DateRange }  -- deriving (Show)

instance T.ToJSON ChatStatistics where
 toJSON (ChatStatistics { recent_message_interactions = recent_message_interactions, instant_view_interaction_graph = instant_view_interaction_graph, message_interaction_graph = message_interaction_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, view_count_by_source_graph = view_count_by_source_graph, view_count_by_hour_graph = view_count_by_hour_graph, mute_graph = mute_graph, join_graph = join_graph, member_count_graph = member_count_graph, enabled_notifications_percentage = enabled_notifications_percentage, mean_share_count = mean_share_count, mean_view_count = mean_view_count, member_count = member_count, period = period }) =
  A.object [ "@type" A..= T.String "chatStatistics", "recent_message_interactions" A..= recent_message_interactions, "instant_view_interaction_graph" A..= instant_view_interaction_graph, "message_interaction_graph" A..= message_interaction_graph, "language_graph" A..= language_graph, "join_by_source_graph" A..= join_by_source_graph, "view_count_by_source_graph" A..= view_count_by_source_graph, "view_count_by_hour_graph" A..= view_count_by_hour_graph, "mute_graph" A..= mute_graph, "join_graph" A..= join_graph, "member_count_graph" A..= member_count_graph, "enabled_notifications_percentage" A..= enabled_notifications_percentage, "mean_share_count" A..= mean_share_count, "mean_view_count" A..= mean_view_count, "member_count" A..= member_count, "period" A..= period ]
-- chatStatistics ChatStatistics  { recent_message_interactions :: [ChatStatisticsMessageInteractionCounters.ChatStatisticsMessageInteractionCounters], instant_view_interaction_graph :: StatisticsGraph.StatisticsGraph, message_interaction_graph :: StatisticsGraph.StatisticsGraph, language_graph :: StatisticsGraph.StatisticsGraph, join_by_source_graph :: StatisticsGraph.StatisticsGraph, view_count_by_source_graph :: StatisticsGraph.StatisticsGraph, view_count_by_hour_graph :: StatisticsGraph.StatisticsGraph, mute_graph :: StatisticsGraph.StatisticsGraph, join_graph :: StatisticsGraph.StatisticsGraph, member_count_graph :: StatisticsGraph.StatisticsGraph, enabled_notifications_percentage :: Float, mean_share_count :: StatisticsValue.StatisticsValue, mean_view_count :: StatisticsValue.StatisticsValue, member_count :: StatisticsValue.StatisticsValue, period :: DateRange.DateRange } 

