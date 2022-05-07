{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about an invite link. Requires administrator privileges and can_invite_users right in the chat to get own links and owner privileges to get other links
data GetChatInviteLink = GetChatInviteLink
  { -- | Invite link to get
    invite_link :: Maybe String,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatInviteLink where
  show
    GetChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      "GetChatInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON GetChatInviteLink where
  toJSON
    GetChatInviteLink
      { invite_link = invite_link,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "getChatInviteLink",
          "invite_link" A..= invite_link,
          "chat_id" A..= chat_id
        ]
