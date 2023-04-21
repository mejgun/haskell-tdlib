{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Edits an invite link for a chat folder
data EditChatFolderInviteLink = EditChatFolderInviteLink
  { -- | New identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link editing
    chat_ids :: Maybe [Int],
    -- | New name of the link; 0-32 characters
    name :: Maybe String,
    -- | Invite link to be edited
    invite_link :: Maybe String,
    -- | Chat folder identifier
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditChatFolderInviteLink where
  show
    EditChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        invite_link = invite_link_,
        chat_folder_id = chat_folder_id_
      } =
      "EditChatFolderInviteLink"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_,
            U.p "name" name_,
            U.p "invite_link" invite_link_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON EditChatFolderInviteLink where
  toJSON
    EditChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        invite_link = invite_link_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "editChatFolderInviteLink",
          "chat_ids" A..= chat_ids_,
          "name" A..= name_,
          "invite_link" A..= invite_link_,
          "chat_folder_id" A..= chat_folder_id_
        ]
