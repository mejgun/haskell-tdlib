module TD.Query.SetChatMessageAutoDeleteTime(SetChatMessageAutoDeleteTime(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data SetChatMessageAutoDeleteTime -- ^ Changes the message auto-delete or self-destruct (for secret chats) time in a chat. Requires change_info administrator right in basic groups, supergroups and channels Message auto-delete time can't be changed in a chat with the current user (Saved Messages) and the chat 777000 (Telegram).
  = SetChatMessageAutoDeleteTime
    { chat_id                  :: Maybe Int -- ^ Chat identifier
    , message_auto_delete_time :: Maybe Int -- ^ New time value, in seconds; unless the chat is secret, it must be from 0 up to 365 * 86400 and be divisible by 86400. If 0, then messages aren't deleted automatically
    }
  deriving (Eq)

instance Show SetChatMessageAutoDeleteTime where
  show
    SetChatMessageAutoDeleteTime
      { chat_id                  = chat_id_
      , message_auto_delete_time = message_auto_delete_time_
      }
        = "SetChatMessageAutoDeleteTime"
          ++ I.cc
          [ "chat_id"                  `I.p` chat_id_
          , "message_auto_delete_time" `I.p` message_auto_delete_time_
          ]

instance AT.ToJSON SetChatMessageAutoDeleteTime where
  toJSON
    SetChatMessageAutoDeleteTime
      { chat_id                  = chat_id_
      , message_auto_delete_time = message_auto_delete_time_
      }
        = A.object
          [ "@type"                    A..= AT.String "setChatMessageAutoDeleteTime"
          , "chat_id"                  A..= chat_id_
          , "message_auto_delete_time" A..= message_auto_delete_time_
          ]
