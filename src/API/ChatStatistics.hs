-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatStatistics where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatStatisticsInviterInfo as ChatStatisticsInviterInfo
import {-# SOURCE #-} qualified API.ChatStatisticsAdministratorActionsInfo as ChatStatisticsAdministratorActionsInfo
import {-# SOURCE #-} qualified API.ChatStatisticsMessageSenderInfo as ChatStatisticsMessageSenderInfo
import {-# SOURCE #-} qualified API.ChatStatisticsMessageInteractionInfo as ChatStatisticsMessageInteractionInfo
import {-# SOURCE #-} qualified API.StatisticalGraph as StatisticalGraph
import {-# SOURCE #-} qualified API.StatisticalValue as StatisticalValue
import {-# SOURCE #-} qualified API.DateRange as DateRange

-- |
-- 
-- Contains a detailed statistics about a chat
data ChatStatistics = 
 -- |
 -- 
 -- A detailed statistics about a supergroup chat
 -- 
 -- __period__ A period to which the statistics applies
 -- 
 -- __member_count__ Number of members in the chat
 -- 
 -- __message_count__ Number of messages sent to the chat
 -- 
 -- __viewer_count__ Number of users who viewed messages in the chat
 -- 
 -- __sender_count__ Number of users who sent messages to the chat
 -- 
 -- __member_count_graph__ A graph containing number of members in the chat
 -- 
 -- __join_graph__ A graph containing number of members joined and left the chat
 -- 
 -- __join_by_source_graph__ A graph containing number of new member joins per source
 -- 
 -- __language_graph__ A graph containing distribution of active users per language
 -- 
 -- __message_content_graph__ A graph containing distribution of sent messages by content type
 -- 
 -- __action_graph__ A graph containing number of different actions in the chat
 -- 
 -- __day_graph__ A graph containing distribution of message views per hour
 -- 
 -- __week_graph__ A graph containing distribution of message views per day of week
 -- 
 -- __top_senders__ List of users sent most messages in the last week
 -- 
 -- __top_administrators__ List of most active administrators in the last week
 -- 
 -- __top_inviters__ List of most active inviters of new members in the last week
 ChatStatisticsSupergroup { top_inviters :: Maybe [ChatStatisticsInviterInfo.ChatStatisticsInviterInfo], top_administrators :: Maybe [ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo], top_senders :: Maybe [ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo], week_graph :: Maybe StatisticalGraph.StatisticalGraph, day_graph :: Maybe StatisticalGraph.StatisticalGraph, action_graph :: Maybe StatisticalGraph.StatisticalGraph, message_content_graph :: Maybe StatisticalGraph.StatisticalGraph, language_graph :: Maybe StatisticalGraph.StatisticalGraph, join_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph, join_graph :: Maybe StatisticalGraph.StatisticalGraph, member_count_graph :: Maybe StatisticalGraph.StatisticalGraph, sender_count :: Maybe StatisticalValue.StatisticalValue, viewer_count :: Maybe StatisticalValue.StatisticalValue, message_count :: Maybe StatisticalValue.StatisticalValue, member_count :: Maybe StatisticalValue.StatisticalValue, period :: Maybe DateRange.DateRange }  |
 -- |
 -- 
 -- A detailed statistics about a channel chat
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
 ChatStatisticsChannel { recent_message_interactions :: Maybe [ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo], instant_view_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph, message_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph, language_graph :: Maybe StatisticalGraph.StatisticalGraph, join_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph, view_count_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph, view_count_by_hour_graph :: Maybe StatisticalGraph.StatisticalGraph, mute_graph :: Maybe StatisticalGraph.StatisticalGraph, join_graph :: Maybe StatisticalGraph.StatisticalGraph, member_count_graph :: Maybe StatisticalGraph.StatisticalGraph, enabled_notifications_percentage :: Maybe Float, mean_share_count :: Maybe StatisticalValue.StatisticalValue, mean_view_count :: Maybe StatisticalValue.StatisticalValue, member_count :: Maybe StatisticalValue.StatisticalValue, period :: Maybe DateRange.DateRange }  deriving (Show, Eq)

instance T.ToJSON ChatStatistics where
 toJSON (ChatStatisticsSupergroup { top_inviters = top_inviters, top_administrators = top_administrators, top_senders = top_senders, week_graph = week_graph, day_graph = day_graph, action_graph = action_graph, message_content_graph = message_content_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, join_graph = join_graph, member_count_graph = member_count_graph, sender_count = sender_count, viewer_count = viewer_count, message_count = message_count, member_count = member_count, period = period }) =
  A.object [ "@type" A..= T.String "chatStatisticsSupergroup", "top_inviters" A..= top_inviters, "top_administrators" A..= top_administrators, "top_senders" A..= top_senders, "week_graph" A..= week_graph, "day_graph" A..= day_graph, "action_graph" A..= action_graph, "message_content_graph" A..= message_content_graph, "language_graph" A..= language_graph, "join_by_source_graph" A..= join_by_source_graph, "join_graph" A..= join_graph, "member_count_graph" A..= member_count_graph, "sender_count" A..= sender_count, "viewer_count" A..= viewer_count, "message_count" A..= message_count, "member_count" A..= member_count, "period" A..= period ]

 toJSON (ChatStatisticsChannel { recent_message_interactions = recent_message_interactions, instant_view_interaction_graph = instant_view_interaction_graph, message_interaction_graph = message_interaction_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, view_count_by_source_graph = view_count_by_source_graph, view_count_by_hour_graph = view_count_by_hour_graph, mute_graph = mute_graph, join_graph = join_graph, member_count_graph = member_count_graph, enabled_notifications_percentage = enabled_notifications_percentage, mean_share_count = mean_share_count, mean_view_count = mean_view_count, member_count = member_count, period = period }) =
  A.object [ "@type" A..= T.String "chatStatisticsChannel", "recent_message_interactions" A..= recent_message_interactions, "instant_view_interaction_graph" A..= instant_view_interaction_graph, "message_interaction_graph" A..= message_interaction_graph, "language_graph" A..= language_graph, "join_by_source_graph" A..= join_by_source_graph, "view_count_by_source_graph" A..= view_count_by_source_graph, "view_count_by_hour_graph" A..= view_count_by_hour_graph, "mute_graph" A..= mute_graph, "join_graph" A..= join_graph, "member_count_graph" A..= member_count_graph, "enabled_notifications_percentage" A..= enabled_notifications_percentage, "mean_share_count" A..= mean_share_count, "mean_view_count" A..= mean_view_count, "member_count" A..= member_count, "period" A..= period ]

instance T.FromJSON ChatStatistics where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatStatisticsSupergroup" -> parseChatStatisticsSupergroup v
   "chatStatisticsChannel" -> parseChatStatisticsChannel v
   _ -> mempty
  where
   parseChatStatisticsSupergroup :: A.Value -> T.Parser ChatStatistics
   parseChatStatisticsSupergroup = A.withObject "ChatStatisticsSupergroup" $ \o -> do
    top_inviters <- o A..:? "top_inviters"
    top_administrators <- o A..:? "top_administrators"
    top_senders <- o A..:? "top_senders"
    week_graph <- o A..:? "week_graph"
    day_graph <- o A..:? "day_graph"
    action_graph <- o A..:? "action_graph"
    message_content_graph <- o A..:? "message_content_graph"
    language_graph <- o A..:? "language_graph"
    join_by_source_graph <- o A..:? "join_by_source_graph"
    join_graph <- o A..:? "join_graph"
    member_count_graph <- o A..:? "member_count_graph"
    sender_count <- o A..:? "sender_count"
    viewer_count <- o A..:? "viewer_count"
    message_count <- o A..:? "message_count"
    member_count <- o A..:? "member_count"
    period <- o A..:? "period"
    return $ ChatStatisticsSupergroup { top_inviters = top_inviters, top_administrators = top_administrators, top_senders = top_senders, week_graph = week_graph, day_graph = day_graph, action_graph = action_graph, message_content_graph = message_content_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, join_graph = join_graph, member_count_graph = member_count_graph, sender_count = sender_count, viewer_count = viewer_count, message_count = message_count, member_count = member_count, period = period }

   parseChatStatisticsChannel :: A.Value -> T.Parser ChatStatistics
   parseChatStatisticsChannel = A.withObject "ChatStatisticsChannel" $ \o -> do
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
    return $ ChatStatisticsChannel { recent_message_interactions = recent_message_interactions, instant_view_interaction_graph = instant_view_interaction_graph, message_interaction_graph = message_interaction_graph, language_graph = language_graph, join_by_source_graph = join_by_source_graph, view_count_by_source_graph = view_count_by_source_graph, view_count_by_hour_graph = view_count_by_hour_graph, mute_graph = mute_graph, join_graph = join_graph, member_count_graph = member_count_graph, enabled_notifications_percentage = enabled_notifications_percentage, mean_share_count = mean_share_count, mean_view_count = mean_view_count, member_count = member_count, period = period }