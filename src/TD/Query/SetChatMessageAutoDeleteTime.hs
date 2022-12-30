{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatMessageAutoDeleteTime where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires change_info administrator right in basic groups, supergroups and channels
-- Message auto-delete time can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
data SetChatMessageAutoDeleteTime = SetChatMessageAutoDeleteTime
  { -- | New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    message_auto_delete_time :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatMessageAutoDeleteTime where
  show
    SetChatMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_,
        chat_id = chat_id_
      } =
      "SetChatMessageAutoDeleteTime"
        ++ U.cc
          [ U.p "message_auto_delete_time" message_auto_delete_time_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatMessageAutoDeleteTime where
  toJSON
    SetChatMessageAutoDeleteTime
      { message_auto_delete_time = message_auto_delete_time_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatMessageAutoDeleteTime",
          "message_auto_delete_time" A..= message_auto_delete_time_,
          "chat_id" A..= chat_id_
        ]
