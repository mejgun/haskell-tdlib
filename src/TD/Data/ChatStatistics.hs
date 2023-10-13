module TD.Data.ChatStatistics (ChatStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.DateRange as DateRange
import qualified TD.Data.StatisticalValue as StatisticalValue
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.ChatStatisticsMessageSenderInfo as ChatStatisticsMessageSenderInfo
import qualified TD.Data.ChatStatisticsAdministratorActionsInfo as ChatStatisticsAdministratorActionsInfo
import qualified TD.Data.ChatStatisticsInviterInfo as ChatStatisticsInviterInfo
import qualified TD.Data.ChatStatisticsMessageInteractionInfo as ChatStatisticsMessageInteractionInfo

data ChatStatistics -- ^ Contains a detailed statistics about a chat
  = ChatStatisticsSupergroup -- ^ A detailed statistics about a supergroup chat
    { period                :: Maybe DateRange.DateRange                                                             -- ^ A period to which the statistics applies
    , member_count          :: Maybe StatisticalValue.StatisticalValue                                               -- ^ Number of members in the chat
    , message_count         :: Maybe StatisticalValue.StatisticalValue                                               -- ^ Number of messages sent to the chat
    , viewer_count          :: Maybe StatisticalValue.StatisticalValue                                               -- ^ Number of users who viewed messages in the chat
    , sender_count          :: Maybe StatisticalValue.StatisticalValue                                               -- ^ Number of users who sent messages to the chat
    , member_count_graph    :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing number of members in the chat
    , join_graph            :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing number of members joined and left the chat
    , join_by_source_graph  :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing number of new member joins per source
    , language_graph        :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing distribution of active users per language
    , message_content_graph :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing distribution of sent messages by content type
    , action_graph          :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing number of different actions in the chat
    , day_graph             :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing distribution of message views per hour
    , week_graph            :: Maybe StatisticalGraph.StatisticalGraph                                               -- ^ A graph containing distribution of message views per day of week
    , top_senders           :: Maybe [ChatStatisticsMessageSenderInfo.ChatStatisticsMessageSenderInfo]               -- ^ List of users sent most messages in the last week
    , top_administrators    :: Maybe [ChatStatisticsAdministratorActionsInfo.ChatStatisticsAdministratorActionsInfo] -- ^ List of most active administrators in the last week
    , top_inviters          :: Maybe [ChatStatisticsInviterInfo.ChatStatisticsInviterInfo]                           -- ^ List of most active inviters of new members in the last week
    }
  | ChatStatisticsChannel -- ^ A detailed statistics about a channel chat
    { period                           :: Maybe DateRange.DateRange                                                         -- ^ A period to which the statistics applies
    , member_count                     :: Maybe StatisticalValue.StatisticalValue                                           -- ^ Number of members in the chat
    , mean_view_count                  :: Maybe StatisticalValue.StatisticalValue                                           -- ^ Mean number of times the recently sent messages was viewed
    , mean_share_count                 :: Maybe StatisticalValue.StatisticalValue                                           -- ^ Mean number of times the recently sent messages was shared
    , enabled_notifications_percentage :: Maybe Double                                                                      -- ^ A percentage of users with enabled notifications for the chat
    , member_count_graph               :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of members in the chat
    , join_graph                       :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of members joined and left the chat
    , mute_graph                       :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of members muted and unmuted the chat
    , view_count_by_hour_graph         :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of message views in a given hour in the last two weeks
    , view_count_by_source_graph       :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of message views per source
    , join_by_source_graph             :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of new member joins per source
    , language_graph                   :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of users viewed chat messages per language
    , message_interaction_graph        :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of chat message views and shares
    , instant_view_interaction_graph   :: Maybe StatisticalGraph.StatisticalGraph                                           -- ^ A graph containing number of views of associated with the chat instant views
    , recent_message_interactions      :: Maybe [ChatStatisticsMessageInteractionInfo.ChatStatisticsMessageInteractionInfo] -- ^ Detailed statistics about number of views and shares of recently sent messages
    }
  deriving (Eq)

instance Show ChatStatistics where
  show ChatStatisticsSupergroup
    { period                = period_
    , member_count          = member_count_
    , message_count         = message_count_
    , viewer_count          = viewer_count_
    , sender_count          = sender_count_
    , member_count_graph    = member_count_graph_
    , join_graph            = join_graph_
    , join_by_source_graph  = join_by_source_graph_
    , language_graph        = language_graph_
    , message_content_graph = message_content_graph_
    , action_graph          = action_graph_
    , day_graph             = day_graph_
    , week_graph            = week_graph_
    , top_senders           = top_senders_
    , top_administrators    = top_administrators_
    , top_inviters          = top_inviters_
    }
      = "ChatStatisticsSupergroup"
        ++ I.cc
        [ "period"                `I.p` period_
        , "member_count"          `I.p` member_count_
        , "message_count"         `I.p` message_count_
        , "viewer_count"          `I.p` viewer_count_
        , "sender_count"          `I.p` sender_count_
        , "member_count_graph"    `I.p` member_count_graph_
        , "join_graph"            `I.p` join_graph_
        , "join_by_source_graph"  `I.p` join_by_source_graph_
        , "language_graph"        `I.p` language_graph_
        , "message_content_graph" `I.p` message_content_graph_
        , "action_graph"          `I.p` action_graph_
        , "day_graph"             `I.p` day_graph_
        , "week_graph"            `I.p` week_graph_
        , "top_senders"           `I.p` top_senders_
        , "top_administrators"    `I.p` top_administrators_
        , "top_inviters"          `I.p` top_inviters_
        ]
  show ChatStatisticsChannel
    { period                           = period_
    , member_count                     = member_count_
    , mean_view_count                  = mean_view_count_
    , mean_share_count                 = mean_share_count_
    , enabled_notifications_percentage = enabled_notifications_percentage_
    , member_count_graph               = member_count_graph_
    , join_graph                       = join_graph_
    , mute_graph                       = mute_graph_
    , view_count_by_hour_graph         = view_count_by_hour_graph_
    , view_count_by_source_graph       = view_count_by_source_graph_
    , join_by_source_graph             = join_by_source_graph_
    , language_graph                   = language_graph_
    , message_interaction_graph        = message_interaction_graph_
    , instant_view_interaction_graph   = instant_view_interaction_graph_
    , recent_message_interactions      = recent_message_interactions_
    }
      = "ChatStatisticsChannel"
        ++ I.cc
        [ "period"                           `I.p` period_
        , "member_count"                     `I.p` member_count_
        , "mean_view_count"                  `I.p` mean_view_count_
        , "mean_share_count"                 `I.p` mean_share_count_
        , "enabled_notifications_percentage" `I.p` enabled_notifications_percentage_
        , "member_count_graph"               `I.p` member_count_graph_
        , "join_graph"                       `I.p` join_graph_
        , "mute_graph"                       `I.p` mute_graph_
        , "view_count_by_hour_graph"         `I.p` view_count_by_hour_graph_
        , "view_count_by_source_graph"       `I.p` view_count_by_source_graph_
        , "join_by_source_graph"             `I.p` join_by_source_graph_
        , "language_graph"                   `I.p` language_graph_
        , "message_interaction_graph"        `I.p` message_interaction_graph_
        , "instant_view_interaction_graph"   `I.p` instant_view_interaction_graph_
        , "recent_message_interactions"      `I.p` recent_message_interactions_
        ]

instance AT.FromJSON ChatStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatStatisticsSupergroup" -> parseChatStatisticsSupergroup v
      "chatStatisticsChannel"    -> parseChatStatisticsChannel v
      _                          -> mempty
    
    where
      parseChatStatisticsSupergroup :: A.Value -> AT.Parser ChatStatistics
      parseChatStatisticsSupergroup = A.withObject "ChatStatisticsSupergroup" $ \o -> do
        period_                <- o A..:?  "period"
        member_count_          <- o A..:?  "member_count"
        message_count_         <- o A..:?  "message_count"
        viewer_count_          <- o A..:?  "viewer_count"
        sender_count_          <- o A..:?  "sender_count"
        member_count_graph_    <- o A..:?  "member_count_graph"
        join_graph_            <- o A..:?  "join_graph"
        join_by_source_graph_  <- o A..:?  "join_by_source_graph"
        language_graph_        <- o A..:?  "language_graph"
        message_content_graph_ <- o A..:?  "message_content_graph"
        action_graph_          <- o A..:?  "action_graph"
        day_graph_             <- o A..:?  "day_graph"
        week_graph_            <- o A..:?  "week_graph"
        top_senders_           <- o A..:?  "top_senders"
        top_administrators_    <- o A..:?  "top_administrators"
        top_inviters_          <- o A..:?  "top_inviters"
        pure $ ChatStatisticsSupergroup
          { period                = period_
          , member_count          = member_count_
          , message_count         = message_count_
          , viewer_count          = viewer_count_
          , sender_count          = sender_count_
          , member_count_graph    = member_count_graph_
          , join_graph            = join_graph_
          , join_by_source_graph  = join_by_source_graph_
          , language_graph        = language_graph_
          , message_content_graph = message_content_graph_
          , action_graph          = action_graph_
          , day_graph             = day_graph_
          , week_graph            = week_graph_
          , top_senders           = top_senders_
          , top_administrators    = top_administrators_
          , top_inviters          = top_inviters_
          }
      parseChatStatisticsChannel :: A.Value -> AT.Parser ChatStatistics
      parseChatStatisticsChannel = A.withObject "ChatStatisticsChannel" $ \o -> do
        period_                           <- o A..:?  "period"
        member_count_                     <- o A..:?  "member_count"
        mean_view_count_                  <- o A..:?  "mean_view_count"
        mean_share_count_                 <- o A..:?  "mean_share_count"
        enabled_notifications_percentage_ <- o A..:?  "enabled_notifications_percentage"
        member_count_graph_               <- o A..:?  "member_count_graph"
        join_graph_                       <- o A..:?  "join_graph"
        mute_graph_                       <- o A..:?  "mute_graph"
        view_count_by_hour_graph_         <- o A..:?  "view_count_by_hour_graph"
        view_count_by_source_graph_       <- o A..:?  "view_count_by_source_graph"
        join_by_source_graph_             <- o A..:?  "join_by_source_graph"
        language_graph_                   <- o A..:?  "language_graph"
        message_interaction_graph_        <- o A..:?  "message_interaction_graph"
        instant_view_interaction_graph_   <- o A..:?  "instant_view_interaction_graph"
        recent_message_interactions_      <- o A..:?  "recent_message_interactions"
        pure $ ChatStatisticsChannel
          { period                           = period_
          , member_count                     = member_count_
          , mean_view_count                  = mean_view_count_
          , mean_share_count                 = mean_share_count_
          , enabled_notifications_percentage = enabled_notifications_percentage_
          , member_count_graph               = member_count_graph_
          , join_graph                       = join_graph_
          , mute_graph                       = mute_graph_
          , view_count_by_hour_graph         = view_count_by_hour_graph_
          , view_count_by_source_graph       = view_count_by_source_graph_
          , join_by_source_graph             = join_by_source_graph_
          , language_graph                   = language_graph_
          , message_interaction_graph        = message_interaction_graph_
          , instant_view_interaction_graph   = instant_view_interaction_graph_
          , recent_message_interactions      = recent_message_interactions_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatStatistics where
  toJSON ChatStatisticsSupergroup
    { period                = period_
    , member_count          = member_count_
    , message_count         = message_count_
    , viewer_count          = viewer_count_
    , sender_count          = sender_count_
    , member_count_graph    = member_count_graph_
    , join_graph            = join_graph_
    , join_by_source_graph  = join_by_source_graph_
    , language_graph        = language_graph_
    , message_content_graph = message_content_graph_
    , action_graph          = action_graph_
    , day_graph             = day_graph_
    , week_graph            = week_graph_
    , top_senders           = top_senders_
    , top_administrators    = top_administrators_
    , top_inviters          = top_inviters_
    }
      = A.object
        [ "@type"                 A..= AT.String "chatStatisticsSupergroup"
        , "period"                A..= period_
        , "member_count"          A..= member_count_
        , "message_count"         A..= message_count_
        , "viewer_count"          A..= viewer_count_
        , "sender_count"          A..= sender_count_
        , "member_count_graph"    A..= member_count_graph_
        , "join_graph"            A..= join_graph_
        , "join_by_source_graph"  A..= join_by_source_graph_
        , "language_graph"        A..= language_graph_
        , "message_content_graph" A..= message_content_graph_
        , "action_graph"          A..= action_graph_
        , "day_graph"             A..= day_graph_
        , "week_graph"            A..= week_graph_
        , "top_senders"           A..= top_senders_
        , "top_administrators"    A..= top_administrators_
        , "top_inviters"          A..= top_inviters_
        ]
  toJSON ChatStatisticsChannel
    { period                           = period_
    , member_count                     = member_count_
    , mean_view_count                  = mean_view_count_
    , mean_share_count                 = mean_share_count_
    , enabled_notifications_percentage = enabled_notifications_percentage_
    , member_count_graph               = member_count_graph_
    , join_graph                       = join_graph_
    , mute_graph                       = mute_graph_
    , view_count_by_hour_graph         = view_count_by_hour_graph_
    , view_count_by_source_graph       = view_count_by_source_graph_
    , join_by_source_graph             = join_by_source_graph_
    , language_graph                   = language_graph_
    , message_interaction_graph        = message_interaction_graph_
    , instant_view_interaction_graph   = instant_view_interaction_graph_
    , recent_message_interactions      = recent_message_interactions_
    }
      = A.object
        [ "@type"                            A..= AT.String "chatStatisticsChannel"
        , "period"                           A..= period_
        , "member_count"                     A..= member_count_
        , "mean_view_count"                  A..= mean_view_count_
        , "mean_share_count"                 A..= mean_share_count_
        , "enabled_notifications_percentage" A..= enabled_notifications_percentage_
        , "member_count_graph"               A..= member_count_graph_
        , "join_graph"                       A..= join_graph_
        , "mute_graph"                       A..= mute_graph_
        , "view_count_by_hour_graph"         A..= view_count_by_hour_graph_
        , "view_count_by_source_graph"       A..= view_count_by_source_graph_
        , "join_by_source_graph"             A..= join_by_source_graph_
        , "language_graph"                   A..= language_graph_
        , "message_interaction_graph"        A..= message_interaction_graph_
        , "instant_view_interaction_graph"   A..= instant_view_interaction_graph_
        , "recent_message_interactions"      A..= recent_message_interactions_
        ]
