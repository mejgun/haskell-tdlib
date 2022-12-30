{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatMessagePosition where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Returns approximate 1-based position of a message among messages, which can be found by the specified filter in the chat. Cannot be used in secret chats
data GetChatMessagePosition = GetChatMessagePosition
  { -- | If not 0, only messages in the specified thread will be considered; supergroups only
    message_thread_id :: Maybe Int,
    -- | Filter for message content; searchMessagesFilterEmpty, searchMessagesFilterUnreadMention, searchMessagesFilterUnreadReaction, and searchMessagesFilterFailedToSend are unsupported in this function
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Identifier of the chat in which to find message position
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatMessagePosition where
  show
    GetChatMessagePosition
      { message_thread_id = message_thread_id_,
        _filter = _filter_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetChatMessagePosition"
        ++ U.cc
          [ U.p "message_thread_id" message_thread_id_,
            U.p "_filter" _filter_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatMessagePosition where
  toJSON
    GetChatMessagePosition
      { message_thread_id = message_thread_id_,
        _filter = _filter_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatMessagePosition",
          "message_thread_id" A..= message_thread_id_,
          "filter" A..= _filter_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
