{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SearchSecretMessages where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.SearchMessagesFilter as SearchMessagesFilter
import qualified Utils as U

-- |
-- Searches for messages in secret chats. Returns the results in reverse chronological order. For optimal performance, the number of returned messages is chosen by TDLib
data SearchSecretMessages = SearchSecretMessages
  { -- | Additional filter for messages to search; pass null to search for all messages
    _filter :: Maybe SearchMessagesFilter.SearchMessagesFilter,
    -- | The maximum number of messages to be returned; up to 100. For optimal performance, the number of returned messages is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Offset of the first entry to return as received from the previous request; use empty string to get the first chunk of results
    offset :: Maybe String,
    -- | Query to search for. If empty, searchChatMessages must be used instead
    query :: Maybe String,
    -- | Identifier of the chat in which to search. Specify 0 to search in all secret chats
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchSecretMessages where
  show
    SearchSecretMessages
      { _filter = _filter,
        limit = limit,
        offset = offset,
        query = query,
        chat_id = chat_id
      } =
      "SearchSecretMessages"
        ++ U.cc
          [ U.p "_filter" _filter,
            U.p "limit" limit,
            U.p "offset" offset,
            U.p "query" query,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON SearchSecretMessages where
  toJSON
    SearchSecretMessages
      { _filter = _filter,
        limit = limit,
        offset = offset,
        query = query,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "searchSecretMessages",
          "filter" A..= _filter,
          "limit" A..= limit,
          "offset" A..= offset,
          "query" A..= query,
          "chat_id" A..= chat_id
        ]
