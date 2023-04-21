{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddChatFolderByInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a chat folder by an invite link @invite_link Invite link for the chat folder @chat_ids Identifiers of the chats added to the chat folder. The chats are automatically joined if they aren't joined yet
data AddChatFolderByInviteLink = AddChatFolderByInviteLink
  { -- |
    chat_ids :: Maybe [Int],
    -- |
    invite_link :: Maybe String
  }
  deriving (Eq)

instance Show AddChatFolderByInviteLink where
  show
    AddChatFolderByInviteLink
      { chat_ids = chat_ids_,
        invite_link = invite_link_
      } =
      "AddChatFolderByInviteLink"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_,
            U.p "invite_link" invite_link_
          ]

instance T.ToJSON AddChatFolderByInviteLink where
  toJSON
    AddChatFolderByInviteLink
      { chat_ids = chat_ids_,
        invite_link = invite_link_
      } =
      A.object
        [ "@type" A..= T.String "addChatFolderByInviteLink",
          "chat_ids" A..= chat_ids_,
          "invite_link" A..= invite_link_
        ]
