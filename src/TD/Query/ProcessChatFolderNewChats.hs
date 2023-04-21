{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ProcessChatFolderNewChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Process new chats added to a shareable chat folder by its owner @chat_folder_id Chat folder identifier @added_chat_ids Identifiers of the new chats, which are added to the chat folder. The chats are automatically joined if they aren't joined yet
data ProcessChatFolderNewChats = ProcessChatFolderNewChats
  { -- |
    added_chat_ids :: Maybe [Int],
    -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show ProcessChatFolderNewChats where
  show
    ProcessChatFolderNewChats
      { added_chat_ids = added_chat_ids_,
        chat_folder_id = chat_folder_id_
      } =
      "ProcessChatFolderNewChats"
        ++ U.cc
          [ U.p "added_chat_ids" added_chat_ids_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON ProcessChatFolderNewChats where
  toJSON
    ProcessChatFolderNewChats
      { added_chat_ids = added_chat_ids_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "processChatFolderNewChats",
          "added_chat_ids" A..= added_chat_ids_,
          "chat_folder_id" A..= chat_folder_id_
        ]
