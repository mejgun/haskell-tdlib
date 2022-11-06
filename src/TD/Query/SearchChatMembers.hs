{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchChatMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatMembersFilter as ChatMembersFilter
import qualified Utils as U

-- |
-- Searches for a specified query in the first name, last name and usernames of the members of a specified chat. Requires administrator rights in channels
data SearchChatMembers = SearchChatMembers
  { -- | The type of users to search for; pass null to search among all chat members
    _filter :: Maybe ChatMembersFilter.ChatMembersFilter,
    -- | The maximum number of users to be returned; up to 200
    limit :: Maybe Int,
    -- | Query to search for
    query :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchChatMembers where
  show
    SearchChatMembers
      { _filter = _filter_,
        limit = limit_,
        query = query_,
        chat_id = chat_id_
      } =
      "SearchChatMembers"
        ++ U.cc
          [ U.p "_filter" _filter_,
            U.p "limit" limit_,
            U.p "query" query_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SearchChatMembers where
  toJSON
    SearchChatMembers
      { _filter = _filter_,
        limit = limit_,
        query = query_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "searchChatMembers",
          "filter" A..= _filter_,
          "limit" A..= limit_,
          "query" A..= query_,
          "chat_id" A..= chat_id_
        ]
