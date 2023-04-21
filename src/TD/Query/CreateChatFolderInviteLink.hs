{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Creates a new invite link for a chat folder. A link can be created for a chat folder if it has only pinned and included chats
data CreateChatFolderInviteLink = CreateChatFolderInviteLink
  { -- | Identifiers of chats to be accessible by the invite link. Use getChatsForChatFolderInviteLink to get suitable chats. Basic groups will be automatically converted to supergroups before link creation
    chat_ids :: Maybe [Int],
    -- | Name of the link; 0-32 characters
    name :: Maybe String,
    -- | Chat folder identifier
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show CreateChatFolderInviteLink where
  show
    CreateChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        chat_folder_id = chat_folder_id_
      } =
      "CreateChatFolderInviteLink"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_,
            U.p "name" name_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON CreateChatFolderInviteLink where
  toJSON
    CreateChatFolderInviteLink
      { chat_ids = chat_ids_,
        name = name_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "createChatFolderInviteLink",
          "chat_ids" A..= chat_ids_,
          "name" A..= name_,
          "chat_folder_id" A..= chat_folder_id_
        ]
