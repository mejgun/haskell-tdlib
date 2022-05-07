{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.ChatStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatStatisticsAdministratorActionsInfo as ChatStatisticsAdministratorActionsInfo
import qualified TD.Reply.ChatStatisticsInviterInfo as ChatStatisticsInviterInfo
import qualified TD.Reply.ChatStatisticsMessageInteractionInfo as ChatStatisticsMessageInteractionInfo
import qualified TD.Reply.ChatStatisticsMessageSenderInfo as ChatStatisticsMessageSenderInfo
import qualified TD.Reply.DateRange as DateRange
import qualified TD.Reply.StatisticalGraph as StatisticalGraph
import qualified TD.Reply.StatisticalValue as StatisticalValue
import qualified Utils as U

-- | Contains a detailed statistics about a chat
data ChatStatistics
  = -- | A detailed statistics about a supergroup chat
    ChatStatisticsSupergroup
      { -- | List of most active inviters of new members in the last week
        top_inviters :: Maybe [ChatStatisticsInviterInfo.ChatStatisticsInviterInfo],
        -- | List of most active administrators in the last week
        top_administrators :: Maybe [ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo],
        -- | List of users sent most messages in the last week
        top_senders :: Maybe [ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo],
        -- | A graph containing distribution of message views per day of week
        week_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing distribution of message views per hour
        day_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of different actions in the chat
        action_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing distribution of sent messages by content type
        message_content_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing distribution of active users per language
        language_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of new member joins per source
        join_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of members joined and left the chat
        join_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of members in the chat
        member_count_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | Number of users who sent messages to the chat
        sender_count :: Maybe StatisticalValue.StatisticalValue,
        -- | Number of users who viewed messages in the chat
        viewer_count :: Maybe StatisticalValue.StatisticalValue,
        -- | Number of messages sent to the chat
        message_count :: Maybe StatisticalValue.StatisticalValue,
        -- | Number of members in the chat
        member_count :: Maybe StatisticalValue.StatisticalValue,
        -- | A period to which the statistics applies
        period :: Maybe DateRange.DateRange
      }
  | -- | A detailed statistics about a channel chat
    ChatStatisticsChannel
      { -- | Detailed statistics about number of views and shares of recently sent messages
        recent_message_interactions :: Maybe [ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo],
        -- | A graph containing number of views of associated with the chat instant views
        instant_view_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of chat message views and shares
        message_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of users viewed chat messages per language
        language_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of new member joins per source
        join_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of message views per source
        view_count_by_source_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of message views in a given hour in the last two weeks
        view_count_by_hour_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of members muted and unmuted the chat
        mute_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of members joined and left the chat
        join_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A graph containing number of members in the chat
        member_count_graph :: Maybe StatisticalGraph.StatisticalGraph,
        -- | A percentage of users with enabled notifications for the chat
        enabled_notifications_percentage :: Maybe Float,
        -- | Mean number of times the recently sent messages was shared
        mean_share_count :: Maybe StatisticalValue.StatisticalValue,
        -- | Mean number of times the recently sent messages was viewed
        mean_view_count :: Maybe StatisticalValue.StatisticalValue,
        -- | Number of members in the chat
        member_count :: Maybe StatisticalValue.StatisticalValue,
        -- | A period to which the statistics applies
        period :: Maybe DateRange.DateRange
      }
  deriving (Eq)

instance Show ChatStatistics where
  show
    ChatStatisticsSupergroup
      { top_inviters = top_inviters,
        top_administrators = top_administrators,
        top_senders = top_senders,
        week_graph = week_graph,
        day_graph = day_graph,
        action_graph = action_graph,
        message_content_graph = message_content_graph,
        language_graph = language_graph,
        join_by_source_graph = join_by_source_graph,
        join_graph = join_graph,
        member_count_graph = member_count_graph,
        sender_count = sender_count,
        viewer_count = viewer_count,
        message_count = message_count,
        member_count = member_count,
        period = period
      } =
      "ChatStatisticsSupergroup"
        ++ U.cc
          [ U.p "top_inviters" top_inviters,
            U.p "top_administrators" top_administrators,
            U.p "top_senders" top_senders,
            U.p "week_graph" week_graph,
            U.p "day_graph" day_graph,
            U.p "action_graph" action_graph,
            U.p "message_content_graph" message_content_graph,
            U.p "language_graph" language_graph,
            U.p "join_by_source_graph" join_by_source_graph,
            U.p "join_graph" join_graph,
            U.p "member_count_graph" member_count_graph,
            U.p "sender_count" sender_count,
            U.p "viewer_count" viewer_count,
            U.p "message_count" message_count,
            U.p "member_count" member_count,
            U.p "period" period
          ]
  show
    ChatStatisticsChannel
      { recent_message_interactions = recent_message_interactions,
        instant_view_interaction_graph = instant_view_interaction_graph,
        message_interaction_graph = message_interaction_graph,
        language_graph = language_graph,
        join_by_source_graph = join_by_source_graph,
        view_count_by_source_graph = view_count_by_source_graph,
        view_count_by_hour_graph = view_count_by_hour_graph,
        mute_graph = mute_graph,
        join_graph = join_graph,
        member_count_graph = member_count_graph,
        enabled_notifications_percentage = enabled_notifications_percentage,
        mean_share_count = mean_share_count,
        mean_view_count = mean_view_count,
        member_count = member_count,
        period = period
      } =
      "ChatStatisticsChannel"
        ++ U.cc
          [ U.p "recent_message_interactions" recent_message_interactions,
            U.p "instant_view_interaction_graph" instant_view_interaction_graph,
            U.p "message_interaction_graph" message_interaction_graph,
            U.p "language_graph" language_graph,
            U.p "join_by_source_graph" join_by_source_graph,
            U.p "view_count_by_source_graph" view_count_by_source_graph,
            U.p "view_count_by_hour_graph" view_count_by_hour_graph,
            U.p "mute_graph" mute_graph,
            U.p "join_graph" join_graph,
            U.p "member_count_graph" member_count_graph,
            U.p "enabled_notifications_percentage" enabled_notifications_percentage,
            U.p "mean_share_count" mean_share_count,
            U.p "mean_view_count" mean_view_count,
            U.p "member_count" member_count,
            U.p "period" period
          ]

instance T.FromJSON ChatStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatStatisticsSupergroup" -> parseChatStatisticsSupergroup v
      "chatStatisticsChannel" -> parseChatStatisticsChannel v
      _ -> fail ""
    where
      parseChatStatisticsSupergroup :: A.Value -> T.Parser ChatStatistics
      parseChatStatisticsSupergroup = A.withObject "ChatStatisticsSupergroup" $ \o -> do
        top_inviters_ <- o A..:? "top_inviters"
        top_administrators_ <- o A..:? "top_administrators"
        top_senders_ <- o A..:? "top_senders"
        week_graph_ <- o A..:? "week_graph"
        day_graph_ <- o A..:? "day_graph"
        action_graph_ <- o A..:? "action_graph"
        message_content_graph_ <- o A..:? "message_content_graph"
        language_graph_ <- o A..:? "language_graph"
        join_by_source_graph_ <- o A..:? "join_by_source_graph"
        join_graph_ <- o A..:? "join_graph"
        member_count_graph_ <- o A..:? "member_count_graph"
        sender_count_ <- o A..:? "sender_count"
        viewer_count_ <- o A..:? "viewer_count"
        message_count_ <- o A..:? "message_count"
        member_count_ <- o A..:? "member_count"
        period_ <- o A..:? "period"
        return $ ChatStatisticsSupergroup {top_inviters = top_inviters_, top_administrators = top_administrators_, top_senders = top_senders_, week_graph = week_graph_, day_graph = day_graph_, action_graph = action_graph_, message_content_graph = message_content_graph_, language_graph = language_graph_, join_by_source_graph = join_by_source_graph_, join_graph = join_graph_, member_count_graph = member_count_graph_, sender_count = sender_count_, viewer_count = viewer_count_, message_count = message_count_, member_count = member_count_, period = period_}

      parseChatStatisticsChannel :: A.Value -> T.Parser ChatStatistics
      parseChatStatisticsChannel = A.withObject "ChatStatisticsChannel" $ \o -> do
        recent_message_interactions_ <- o A..:? "recent_message_interactions"
        instant_view_interaction_graph_ <- o A..:? "instant_view_interaction_graph"
        message_interaction_graph_ <- o A..:? "message_interaction_graph"
        language_graph_ <- o A..:? "language_graph"
        join_by_source_graph_ <- o A..:? "join_by_source_graph"
        view_count_by_source_graph_ <- o A..:? "view_count_by_source_graph"
        view_count_by_hour_graph_ <- o A..:? "view_count_by_hour_graph"
        mute_graph_ <- o A..:? "mute_graph"
        join_graph_ <- o A..:? "join_graph"
        member_count_graph_ <- o A..:? "member_count_graph"
        enabled_notifications_percentage_ <- o A..:? "enabled_notifications_percentage"
        mean_share_count_ <- o A..:? "mean_share_count"
        mean_view_count_ <- o A..:? "mean_view_count"
        member_count_ <- o A..:? "member_count"
        period_ <- o A..:? "period"
        return $ ChatStatisticsChannel {recent_message_interactions = recent_message_interactions_, instant_view_interaction_graph = instant_view_interaction_graph_, message_interaction_graph = message_interaction_graph_, language_graph = language_graph_, join_by_source_graph = join_by_source_graph_, view_count_by_source_graph = view_count_by_source_graph_, view_count_by_hour_graph = view_count_by_hour_graph_, mute_graph = mute_graph_, join_graph = join_graph_, member_count_graph = member_count_graph_, enabled_notifications_percentage = enabled_notifications_percentage_, mean_share_count = mean_share_count_, mean_view_count = mean_view_count_, member_count = member_count_, period = period_}
  parseJSON _ = fail ""

instance T.ToJSON ChatStatistics where
  toJSON
    ChatStatisticsSupergroup
      { top_inviters = top_inviters,
        top_administrators = top_administrators,
        top_senders = top_senders,
        week_graph = week_graph,
        day_graph = day_graph,
        action_graph = action_graph,
        message_content_graph = message_content_graph,
        language_graph = language_graph,
        join_by_source_graph = join_by_source_graph,
        join_graph = join_graph,
        member_count_graph = member_count_graph,
        sender_count = sender_count,
        viewer_count = viewer_count,
        message_count = message_count,
        member_count = member_count,
        period = period
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsSupergroup",
          "top_inviters" A..= top_inviters,
          "top_administrators" A..= top_administrators,
          "top_senders" A..= top_senders,
          "week_graph" A..= week_graph,
          "day_graph" A..= day_graph,
          "action_graph" A..= action_graph,
          "message_content_graph" A..= message_content_graph,
          "language_graph" A..= language_graph,
          "join_by_source_graph" A..= join_by_source_graph,
          "join_graph" A..= join_graph,
          "member_count_graph" A..= member_count_graph,
          "sender_count" A..= sender_count,
          "viewer_count" A..= viewer_count,
          "message_count" A..= message_count,
          "member_count" A..= member_count,
          "period" A..= period
        ]
  toJSON
    ChatStatisticsChannel
      { recent_message_interactions = recent_message_interactions,
        instant_view_interaction_graph = instant_view_interaction_graph,
        message_interaction_graph = message_interaction_graph,
        language_graph = language_graph,
        join_by_source_graph = join_by_source_graph,
        view_count_by_source_graph = view_count_by_source_graph,
        view_count_by_hour_graph = view_count_by_hour_graph,
        mute_graph = mute_graph,
        join_graph = join_graph,
        member_count_graph = member_count_graph,
        enabled_notifications_percentage = enabled_notifications_percentage,
        mean_share_count = mean_share_count,
        mean_view_count = mean_view_count,
        member_count = member_count,
        period = period
      } =
      A.object
        [ "@type" A..= T.String "chatStatisticsChannel",
          "recent_message_interactions" A..= recent_message_interactions,
          "instant_view_interaction_graph" A..= instant_view_interaction_graph,
          "message_interaction_graph" A..= message_interaction_graph,
          "language_graph" A..= language_graph,
          "join_by_source_graph" A..= join_by_source_graph,
          "view_count_by_source_graph" A..= view_count_by_source_graph,
          "view_count_by_hour_graph" A..= view_count_by_hour_graph,
          "mute_graph" A..= mute_graph,
          "join_graph" A..= join_graph,
          "member_count_graph" A..= member_count_graph,
          "enabled_notifications_percentage" A..= enabled_notifications_percentage,
          "mean_share_count" A..= mean_share_count,
          "mean_view_count" A..= mean_view_count,
          "member_count" A..= member_count,
          "period" A..= period
        ]
