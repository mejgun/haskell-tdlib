{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RevokeChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Revokes invite link for a chat. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links.
-- If a primary link is revoked, then additionally to the revoked link returns new primary link
data RevokeChatInviteLink = RevokeChatInviteLink
  { -- | Invite link to be revoked
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show RevokeChatInviteLink where
  show
    RevokeChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      "RevokeChatInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON RevokeChatInviteLink where
  toJSON
    RevokeChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "revokeChatInviteLink",
          "invite_link" A..= invite_link,
          "chat_id" A..= chat_id
        ]
