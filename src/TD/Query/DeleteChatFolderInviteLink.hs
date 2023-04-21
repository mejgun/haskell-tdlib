{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes an invite link for a chat folder
data DeleteChatFolderInviteLink = DeleteChatFolderInviteLink
  { -- | Invite link to be deleted
    invite_link :: Maybe String,
    -- | Chat folder identifier
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatFolderInviteLink where
  show
    DeleteChatFolderInviteLink
      { invite_link = invite_link_,
        chat_folder_id = chat_folder_id_
      } =
      "DeleteChatFolderInviteLink"
        ++ U.cc
          [ U.p "invite_link" invite_link_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON DeleteChatFolderInviteLink where
  toJSON
    DeleteChatFolderInviteLink
      { invite_link = invite_link_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatFolderInviteLink",
          "invite_link" A..= invite_link_,
          "chat_folder_id" A..= chat_folder_id_
        ]
