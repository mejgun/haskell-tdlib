{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatJoinRequests where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatJoinRequest as ChatJoinRequest
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
      { limit = limit,
        offset_request = offset_request,
        query = query,
        invite_link = invite_link,
        chat_id = chat_id
      } =
      "GetChatJoinRequests"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset_request" offset_request,
            U.p "query" query,
            U.p "invite_link" invite_link,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatJoinRequests where
  toJSON
    GetChatJoinRequests
      { limit = limit,
        offset_request = offset_request,
        query = query,
        invite_link = invite_link,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatJoinRequests",
          "limit" A..= limit,
          "offset_request" A..= offset_request,
          "query" A..= query,
          "invite_link" A..= invite_link,
          "chat_id" A..= chat_id
        ]
