{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteRevokedChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes revoked chat invite links. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links @chat_id Chat identifier @invite_link Invite link to revoke
data DeleteRevokedChatInviteLink = DeleteRevokedChatInviteLink
  { -- |
    invite_link :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteRevokedChatInviteLink where
  show
    DeleteRevokedChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      "DeleteRevokedChatInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteRevokedChatInviteLink where
  toJSON
    DeleteRevokedChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteRevokedChatInviteLink",
          "invite_link" A..= invite_link,
          "chat_id" A..= chat_id
        ]
