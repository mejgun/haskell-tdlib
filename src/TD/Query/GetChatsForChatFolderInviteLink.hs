{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatsForChatFolderInviteLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns identifiers of chats from a chat folder, suitable for adding to a chat folder invite link @chat_folder_id Chat folder identifier
data GetChatsForChatFolderInviteLink = GetChatsForChatFolderInviteLink
  { -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatsForChatFolderInviteLink where
  show
    GetChatsForChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      } =
      "GetChatsForChatFolderInviteLink"
        ++ U.cc
          [ U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON GetChatsForChatFolderInviteLink where
  toJSON
    GetChatsForChatFolderInviteLink
      { chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatsForChatFolderInviteLink",
          "chat_folder_id" A..= chat_folder_id_
        ]
