{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ReplacePrimaryChatInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right @chat_id Chat identifier
data ReplacePrimaryChatInviteLink = ReplacePrimaryChatInviteLink
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ReplacePrimaryChatInviteLink where
  show
    ReplacePrimaryChatInviteLink
      { chat_id = chat_id
      } =
      "ReplacePrimaryChatInviteLink"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON ReplacePrimaryChatInviteLink where
  toJSON
    ReplacePrimaryChatInviteLink
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "replacePrimaryChatInviteLink",
          "chat_id" A..= chat_id
        ]
