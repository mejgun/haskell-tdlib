{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatSparseMessagePositions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Returns sparse positions of messages of the specified type in the chat to be used for shared media scroll implementation. Returns the results in reverse chronological order (i.e., in order of decreasing message_id).
-- Cannot be used in secret chats or with searchMessagesFilterFailedToSend filter without an enabled message database
data GetChatSparseMessagePositions = GetChatSparseMessagePositions
  { -- | The expected number of message positions to be returned; 50-2000. A smaller number of positions can be returned, if there are not enough appropriate messages
    limit :: Maybe Int,
    -- | The message identifier from which to return information about message positions
    from_message_id :: Maybe Int,
    -- | Filter for message content. Filters searchMessagesFilterEmpty, searchMessagesFilterMention, searchMessagesFilterUnreadMention, and searchMessagesFilterUnreadReaction are unsupported in this function
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | Identifier of the chat in which to return information about message positions
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatSparseMessagePositions where
  show
    GetChatSparseMessagePositions
      { limit = limit_,
        from_message_id = from_message_id_,
        _filter = _filter_,
        chat_id = chat_id_
      } =
      "GetChatSparseMessagePositions"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "from_message_id" from_message_id_,
            U.p "_filter" _filter_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatSparseMessagePositions where
  toJSON
    GetChatSparseMessagePositions
      { limit = limit_,
        from_message_id = from_message_id_,
        _filter = _filter_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatSparseMessagePositions",
          "limit" A..= limit_,
          "from_message_id" A..= from_message_id_,
          "filter" A..= _filter_,
          "chat_id" A..= chat_id_
        ]
