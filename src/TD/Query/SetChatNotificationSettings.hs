module TD.Query.SetChatNotificationSettings(SetChatNotificationSettings(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings

data SetChatNotificationSettings -- ^ Changes the notification settings of a chat. Notification settings of a chat with the current user (Saved Messages) can't be changed
  = SetChatNotificationSettings
    { chat_id               :: Maybe Int                                               -- ^ Chat identifier
    , notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ New notification settings for the chat. If the chat is muted for more than 366 days, it is considered to be muted forever
    }
  deriving (Eq)

instance Show SetChatNotificationSettings where
  show
    SetChatNotificationSettings
      { chat_id               = chat_id_
      , notification_settings = notification_settings_
      }
        = "SetChatNotificationSettings"
          ++ I.cc
          [ "chat_id"               `I.p` chat_id_
          , "notification_settings" `I.p` notification_settings_
          ]

instance AT.ToJSON SetChatNotificationSettings where
  toJSON
    SetChatNotificationSettings
      { chat_id               = chat_id_
      , notification_settings = notification_settings_
      }
        = A.object
          [ "@type"                 A..= AT.String "setChatNotificationSettings"
          , "chat_id"               A..= chat_id_
          , "notification_settings" A..= notification_settings_
          ]
