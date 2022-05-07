{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteAllRevokedChatInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all revoked chat invite links created by a given chat administrator. Requires administrator privileges and can_invite_users right in the chat for own links and owner privileges for other links
data DeleteAllRevokedChatInviteLinks = DeleteAllRevokedChatInviteLinks
  { -- | User identifier of a chat administrator, which links will be deleted. Must be an identifier of the current user for non-owner
    creator_user_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteAllRevokedChatInviteLinks where
  show
    DeleteAllRevokedChatInviteLinks
      { creator_user_id = creator_user_id,
        chat_id = chat_id
      } =
      "DeleteAllRevokedChatInviteLinks"
        ++ U.cc
          [ U.p "creator_user_id" creator_user_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteAllRevokedChatInviteLinks where
  toJSON
    DeleteAllRevokedChatInviteLinks
      { creator_user_id = creator_user_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteAllRevokedChatInviteLinks",
          "creator_user_id" A..= creator_user_id,
          "chat_id" A..= chat_id
        ]
