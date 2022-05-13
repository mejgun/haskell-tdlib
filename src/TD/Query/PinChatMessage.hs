{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.PinChatMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Pins a message in a chat; requires can_pin_messages rights or can_edit_messages rights in the channel
data PinChatMessage = PinChatMessage
  { -- | Pass true to pin the message only for self; private chats only
    only_for_self :: Maybe Bool,
    -- | Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
    disable_notification :: Maybe Bool,
    -- | Identifier of the new pinned message
    message_id :: Maybe Int,
    -- | Identifier of the chat
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show PinChatMessage where
  show
    PinChatMessage
      { only_for_self = only_for_self_,
        disable_notification = disable_notification_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "PinChatMessage"
        ++ U.cc
          [ U.p "only_for_self" only_for_self_,
            U.p "disable_notification" disable_notification_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON PinChatMessage where
  toJSON
    PinChatMessage
      { only_for_self = only_for_self_,
        disable_notification = disable_notification_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "pinChatMessage",
          "only_for_self" A..= only_for_self_,
          "disable_notification" A..= disable_notification_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
