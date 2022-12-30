{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatInviteLinkMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember
import qualified Utils as U

-- |
-- Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
data GetChatInviteLinkMembers = GetChatInviteLinkMembers
  { -- | The maximum number of chat members to return; up to 100
    limit :: Maybe Int,
    -- | A chat member from which to return next chat members; pass null to get results from the beginning
    offset_member :: Maybe ChatInviteLinkMember.ChatInviteLinkMember,
    -- | Invite link for which to return chat members
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatInviteLinkMembers where
  show
    GetChatInviteLinkMembers
      { limit = limit_,
        offset_member = offset_member_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      "GetChatInviteLinkMembers"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_member" offset_member_,
            U.p "invite_link" invite_link_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatInviteLinkMembers where
  toJSON
    GetChatInviteLinkMembers
      { limit = limit_,
        offset_member = offset_member_,
        invite_link = invite_link_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatInviteLinkMembers",
          "limit" A..= limit_,
          "offset_member" A..= offset_member_,
          "invite_link" A..= invite_link_,
          "chat_id" A..= chat_id_
        ]
