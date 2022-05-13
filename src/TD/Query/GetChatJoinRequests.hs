{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatJoinRequests where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatJoinRequest as ChatJoinRequest
import qualified Utils as U

-- |
-- Returns pending join requests in a chat
data GetChatJoinRequests = GetChatJoinRequests
  { -- | The maximum number of requests to join the chat to return
    limit :: Maybe Int,
    -- | A chat join request from which to return next requests; pass null to get results from the beginning
    offset_request :: Maybe ChatJoinRequest.ChatJoinRequest,
    -- | A query to search for in the first names, last names and usernames of the users to return
    query :: Maybe String,
    -- | Invite link for which to return join requests. If empty, all join requests will be returned. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatJoinRequests where
  show
    GetChatJoinRequests
      { limit = limit_,
        offset_request = offset_request_,
        query = query_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      "GetChatJoinRequests"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_request" offset_request_,
            U.p "query" query_,
            U.p "invite_link" invite_link_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatJoinRequests where
  toJSON
    GetChatJoinRequests
      { limit = limit_,
        offset_request = offset_request_,
        query = query_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatJoinRequests",
          "limit" A..= limit_,
          "offset_request" A..= offset_request_,
          "query" A..= query_,
          "invite_link" A..= invite_link_,
          "chat_id" A..= chat_id_
        ]
