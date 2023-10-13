module TD.Query.ToggleChatDefaultDisableNotification(ToggleChatDefaultDisableNotification(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleChatDefaultDisableNotification -- ^ Changes the value of the default disable_notification parameter, used when a message is sent to a chat
  = ToggleChatDefaultDisableNotification
    { chat_id                      :: Maybe Int  -- ^ Chat identifier
    , default_disable_notification :: Maybe Bool -- ^ New value of default_disable_notification
    }
  deriving (Eq)

instance Show ToggleChatDefaultDisableNotification where
  show
    ToggleChatDefaultDisableNotification
      { chat_id                      = chat_id_
      , default_disable_notification = default_disable_notification_
      }
        = "ToggleChatDefaultDisableNotification"
          ++ I.cc
          [ "chat_id"                      `I.p` chat_id_
          , "default_disable_notification" `I.p` default_disable_notification_
          ]

instance AT.ToJSON ToggleChatDefaultDisableNotification where
  toJSON
    ToggleChatDefaultDisableNotification
      { chat_id                      = chat_id_
      , default_disable_notification = default_disable_notification_
      }
        = A.object
          [ "@type"                        A..= AT.String "toggleChatDefaultDisableNotification"
          , "chat_id"                      A..= chat_id_
          , "default_disable_notification" A..= default_disable_notification_
          ]
