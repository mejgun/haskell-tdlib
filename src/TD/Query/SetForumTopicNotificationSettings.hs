{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetForumTopicNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified Utils as U

-- |
-- Changes the notification settings of a forum topic
data SetForumTopicNotificationSettings = SetForumTopicNotificationSettings
  { -- | New notification settings for the forum topic. If the topic is muted for more than 366 days, it is considered to be muted forever
    notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
    -- | Message thread identifier of the forum topic
    message_thread_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetForumTopicNotificationSettings where
  show
    SetForumTopicNotificationSettings
      { notification_settings = notification_settings_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      "SetForumTopicNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings_,
            U.p "message_thread_id" message_thread_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetForumTopicNotificationSettings where
  toJSON
    SetForumTopicNotificationSettings
      { notification_settings = notification_settings_,
        message_thread_id = message_thread_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setForumTopicNotificationSettings",
          "notification_settings" A..= notification_settings_,
          "message_thread_id" A..= message_thread_id_,
          "chat_id" A..= chat_id_
        ]
