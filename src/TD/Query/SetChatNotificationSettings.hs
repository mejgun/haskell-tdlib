{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatNotificationSettings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified Utils as U

-- |
-- Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
data SetChatNotificationSettings = SetChatNotificationSettings
  { -- | New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever
    notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatNotificationSettings where
  show
    SetChatNotificationSettings
      { notification_settings = notification_settings_,
        chat_id = chat_id_
      } =
      "SetChatNotificationSettings"
        ++ U.cc
          [ U.p "notification_settings" notification_settings_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatNotificationSettings where
  toJSON
    SetChatNotificationSettings
      { notification_settings = notification_settings_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatNotificationSettings",
          "notification_settings" A..= notification_settings_,
          "chat_id" A..= chat_id_
        ]
