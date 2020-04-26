-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatStatisticsMessageInteractionCounters as ChatStatisticsMessageInteractionCounters
import {-# SOURCE #-} qualified API.StatisticsGraph as StatisticsGraph
import {-# SOURCE #-} qualified API.StatisticsValue as StatisticsValue
import {-# SOURCE #-} qualified API.DateRange as DateRange

-- |
-- 
-- A detailed statistics about a chat
-- 
-- __period__ A period to which the statistics applies
-- 
-- __member_count__ Number of members in the chat
-- 
-- __mean_view_count__ Mean number of times the recently sent messages was viewed
-- 
-- __mean_share_count__ Mean number of times the recently sent messages was shared
-- 
-- __enabled_notifications_percentage__ A percentage of users with enabled notifications for the chat
-- 
-- __member_count_graph__ A graph containing number of members in the chat
-- 
-- __join_graph__ A graph containing number of members joined and left the chat
-- 
-- __mute_graph__ A graph containing number of members muted and unmuted the chat
-- 
-- __view_count_by_hour_graph__ A graph containing number of message views in a given hour in the last two weeks
-- 
-- __view_count_by_source_graph__ A graph containing number of message views per source
-- 
-- __join_by_source_graph__ A graph containing number of new member joins per source
-- 
-- __language_graph__ A graph containing number of users viewed chat messages per language
-- 
-- __message_interaction_graph__ A graph containing number of chat message views and shares
-- 
-- __instant_view_interaction_graph__ A graph containing number of views of associated with the chat instant views
-- 
-- __recent_message_interactions__ Detailed statistics about number of views and shares of recently sent messages
data ChatStatistics = 
 ChatStatistics { recent_message_interactions :: Maybe [ChatStatisticsMessageInteractionCounters.ChatStatisticsMessageInteractionCounters], instant_view_interaction_graph :: Maybe StatisticsGraph.StatisticsGraph, message_interaction_graph :: Maybe StatisticsGraph.StatisticsGraph, language_graph :: Maybe StatisticsGraph.StatisticsGraph, join_by_source_graph :: Maybe StatisticsGraph.StatisticsGraph, view_count_by_source_graph :: Maybe StatisticsGraph.StatisticsGraph, view_count_by_hour_graph :: Maybe StatisticsGraph.StatisticsGraph, mute_graph :: Maybe StatisticsGraph.StatisticsGraph, join_graph :: Maybe StatisticsGraph.StatisticsGraph, member_count_graph :: Maybe StatisticsGraph.StatisticsGraph, enabled_notifications_percentage :: Maybe Float, mean_share_count :: Maybe StatisticsValue.StatisticsValue, mean_view_count :: Maybe StatisticsValue.StatisticsValue, member_count :: Maybe StatisticsValue.StatisticsValue, period :: Maybe DateRange.DateRange }  deriving (Show, Eq)

instance T.ToJSON ChatStatistics where
 toJSON (ChatStatistics { recent_message_interactions = recent_message_interactions, instant_view_interaction_graph = instant_view_interaction_graph, message_interaction_graph = message_interaction_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, view_count_by_source_graph = view_count_by_source_graph, view_count_by_hour_graph = view_count_by_hour_graph, mute_graph = mute_graph, join_graph = join_graph, member_count_graph = member_count_graph, enabled_notifications_percentage = enabled_notifications_percentage, mean_share_count = mean_share_count, mean_view_count = mean_view_count, member_count = member_count, period = period }) =
  A.object [ "@type" A..= T.String "chatStatistics", "recent_message_interactions" A..= recent_message_interactions, "instant_view_interaction_graph" A..= instant_view_interaction_graph, "message_interaction_graph" A..= message_interaction_graph, "language_graph" A..= language_graph, "join_by_source_graph" A..= join_by_source_graph, "view_count_by_source_graph" A..= view_count_by_source_graph, "view_count_by_hour_graph" A..= view_count_by_hour_graph, "mute_graph" A..= mute_graph, "join_graph" A..= join_graph, "member_count_graph" A..= member_count_graph, "enabled_notifications_percentage" A..= enabled_notifications_percentage, "mean_share_count" A..= mean_share_count, "mean_view_count" A..= mean_view_count, "member_count" A..= member_count, "period" A..= period ]

instance T.FromJSON ChatStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatistics" -> parseChatStatistics v
   _ -> mempty
  where
   parseChatStatistics :: A.Value -> T.Parser ChatStatistics
   parseChatStatistics = A.withObject "ChatStatistics" $ \o -> do
    recent_message_interactions <- o A..:? "recent_message_interactions"
    instant_view_interaction_graph <- o A..:? "instant_view_interaction_graph"
    message_interaction_graph <- o A..:? "message_interaction_graph"
    language_graph <- o A..:? "language_graph"
    join_by_source_graph <- o A..:? "join_by_source_graph"
    view_count_by_source_graph <- o A..:? "view_count_by_source_graph"
    view_count_by_hour_graph <- o A..:? "view_count_by_hour_graph"
    mute_graph <- o A..:? "mute_graph"
    join_graph <- o A..:? "join_graph"
    member_count_graph <- o A..:? "member_count_graph"
    enabled_notifications_percentage <- o A..:? "enabled_notifications_percentage"
    mean_share_count <- o A..:? "mean_share_count"
    mean_view_count <- o A..:? "mean_view_count"
    member_count <- o A..:? "member_count"
    period <- o A..:? "period"
    return $ ChatStatistics { recent_message_interactions = recent_message_interactions, instant_view_interaction_graph = instant_view_interaction_graph, message_interaction_graph = message_interaction_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, view_count_by_source_graph = view_count_by_source_graph, view_count_by_hour_graph = view_count_by_hour_graph, mute_graph = mute_graph, join_graph = join_graph, member_count_graph = member_count_graph, enabled_notifications_percentage = enabled_notifications_percentage, mean_share_count = mean_share_count, mean_view_count = mean_view_count, member_count = member_count, period = period }