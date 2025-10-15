module TD.Query.SetForumTopicNotificationSettings
  (SetForumTopicNotificationSettings(..)
  , defaultSetForumTopicNotificationSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings

-- | Changes the notification settings of a forum topic in a forum supergroup chat or a chat with a bot with topics. Returns 'TD.Data.Ok.Ok'
data SetForumTopicNotificationSettings
  = SetForumTopicNotificationSettings
    { chat_id               :: Maybe Int                                               -- ^ Chat identifier
    , forum_topic_id        :: Maybe Int                                               -- ^ Forum topic identifier
    , notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever
    }
  deriving (Eq, Show)

instance I.ShortShow SetForumTopicNotificationSettings where
  shortShow
    SetForumTopicNotificationSettings
      { chat_id               = chat_id_
      , forum_topic_id        = forum_topic_id_
      , notification_settings = notification_settings_
      }
        = "SetForumTopicNotificationSettings"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "forum_topic_id"        `I.p` forum_topic_id_
          , "notification_settings" `I.p` notification_settings_
          ]

instance AT.ToJSON SetForumTopicNotificationSettings where
  toJSON
    SetForumTopicNotificationSettings
      { chat_id               = chat_id_
      , forum_topic_id        = forum_topic_id_
      , notification_settings = notification_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setForumTopicNotificationSettings"
          , "chat_id"               A..= chat_id_
          , "forum_topic_id"        A..= forum_topic_id_
          , "notification_settings" A..= notification_settings_
          ]

defaultSetForumTopicNotificationSettings :: SetForumTopicNotificationSettings
defaultSetForumTopicNotificationSettings =
  SetForumTopicNotificationSettings
    { chat_id               = Nothing
    , forum_topic_id        = Nothing
    , notification_settings = Nothing
    }

