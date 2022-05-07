{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatNotificationSettings as ChatNotificationSettings
import qualified Utils as U

-- |
-- Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
data SetChatNotificationSettings = SetChatNotificationSettings
  { -- |
    notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
    -- | Chat identifier @notification_settings New notification settings for the chat. If the chat is muted for more than 1 week, it is considered to be muted forever
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatNotificationSettings where
  show
    SetChatNotificationSettings
      { notification_settings = notification_settings,
        chat_id = chat_id
      } =
      "SetChatNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SetChatNotificationSettings where
  toJSON
    SetChatNotificationSettings
      { notification_settings = notification_settings,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "setChatNotificationSettings",
          "notification_settings" A..= notification_settings,
          "chat_id" A..= chat_id
        ]
