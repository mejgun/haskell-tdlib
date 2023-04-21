{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolderChatsToLeave where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns identifiers of pinned or always included chats from a chat folder, which are suggested to be left when the chat folder is deleted @chat_folder_id Chat folder identifier
data GetChatFolderChatsToLeave = GetChatFolderChatsToLeave
  { -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatFolderChatsToLeave where
  show
    GetChatFolderChatsToLeave
      { chat_folder_id = chat_folder_id_
      } =
      "GetChatFolderChatsToLeave"
        ++ U.cc
          [ U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON GetChatFolderChatsToLeave where
  toJSON
    GetChatFolderChatsToLeave
      { chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolderChatsToLeave",
          "chat_folder_id" A..= chat_folder_id_
        ]
