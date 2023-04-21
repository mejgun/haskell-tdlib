{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolderNewChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns new chats added to a shareable chat folder by its owner. The method must be called at most once in getOption("chat_folder_new_chats_update_period") for the given chat folder @chat_folder_id Chat folder identifier
data GetChatFolderNewChats = GetChatFolderNewChats
  { -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatFolderNewChats where
  show
    GetChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      } =
      "GetChatFolderNewChats"
        ++ U.cc
          [ U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON GetChatFolderNewChats where
  toJSON
    GetChatFolderNewChats
      { chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolderNewChats",
          "chat_folder_id" A..= chat_folder_id_
        ]
