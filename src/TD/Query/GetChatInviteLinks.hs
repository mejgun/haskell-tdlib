{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns invite links for a chat created by specified administrator. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
data GetChatInviteLinks = GetChatInviteLinks
  { -- | The maximum number of invite links to return; up to 100
    limit :: Maybe Int,
    -- | Invite link starting after which to return invite links; use empty string to get results from the beginning
    offset_invite_link :: Maybe String,
    -- | Creation date of an invite link starting after which to return invite links; use 0 to get results from the beginning
    offset_date :: Maybe Int,
    -- | Pass true if revoked links needs to be returned instead of active or expired
    is_revoked :: Maybe Bool,
    -- | User identifier of a chat administrator. Must be an identifier of the current user for non-owner
    creator_user_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatInviteLinks where
  show
    GetChatInviteLinks
      { limit = limit_,
        offset_invite_link = offset_invite_link_,
        offset_date = offset_date_,
        is_revoked = is_revoked_,
        creator_user_id = creator_user_id_,
        chat_id = chat_id_
      } =
      "GetChatInviteLinks"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_invite_link" offset_invite_link_,
            U.p "offset_date" offset_date_,
            U.p "is_revoked" is_revoked_,
            U.p "creator_user_id" creator_user_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatInviteLinks where
  toJSON
    GetChatInviteLinks
      { limit = limit_,
        offset_invite_link = offset_invite_link_,
        offset_date = offset_date_,
        is_revoked = is_revoked_,
        creator_user_id = creator_user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatInviteLinks",
          "limit" A..= limit_,
          "offset_invite_link" A..= offset_invite_link_,
          "offset_date" A..= offset_date_,
          "is_revoked" A..= is_revoked_,
          "creator_user_id" A..= creator_user_id_,
          "chat_id" A..= chat_id_
        ]
