{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleChatDefaultDisableNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the value of the default disable_notification parameter, used when a message is sent to a chat @chat_id Chat identifier @default_disable_notification New value of default_disable_notification
data ToggleChatDefaultDisableNotification = ToggleChatDefaultDisableNotification
  { -- |
    default_disable_notification :: Maybe Bool,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleChatDefaultDisableNotification where
  show
    ToggleChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification_,
        chat_id = chat_id_
      } =
      "ToggleChatDefaultDisableNotification"
        ++ U.cc
          [ U.p "default_disable_notification" default_disable_notification_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleChatDefaultDisableNotification where
  toJSON
    ToggleChatDefaultDisableNotification
      { default_disable_notification = default_disable_notification_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleChatDefaultDisableNotification",
          "default_disable_notification" A..= default_disable_notification_,
          "chat_id" A..= chat_id_
        ]
