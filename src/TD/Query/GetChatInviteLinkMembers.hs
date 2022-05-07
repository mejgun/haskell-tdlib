{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatInviteLinkMembers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatInviteLinkMember as ChatInviteLinkMember
import qualified Utils as U

-- |
-- Returns chat members joined a chat via an invite link. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links @chat_id Chat identifier @invite_link Invite link for which to return chat members
data GetChatInviteLinkMembers = GetChatInviteLinkMembers
  { -- |
    limit :: Maybe Int,
    -- | A chat member from which to return next chat members; pass null to get results from the beginning @limit The maximum number of chat members to return; up to 100
    offset_member :: Maybe ChatInviteLinkMember.ChatInviteLinkMember,
    -- |
    invite_link :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatInviteLinkMembers where
  show
    GetChatInviteLinkMembers
      { limit = limit,
        offset_member = offset_member,
        invite_link = invite_link,
        chat_id = chat_id
      } =
      "GetChatInviteLinkMembers"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "offset_member" offset_member,
            U.p "invite_link" invite_link,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatInviteLinkMembers where
  toJSON
    GetChatInviteLinkMembers
      { limit = limit,
        offset_member = offset_member,
        invite_link = invite_link,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatInviteLinkMembers",
          "limit" A..= limit,
          "offset_member" A..= offset_member,
          "invite_link" A..= invite_link,
          "chat_id" A..= chat_id
        ]
