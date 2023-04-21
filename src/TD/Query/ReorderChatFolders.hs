{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReorderChatFolders where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the order of chat folders @chat_folder_ids Identifiers of chat folders in the new correct order @main_chat_list_position Position of the main chat list among chat folders, 0-based. Can be non-zero only for Premium users
data ReorderChatFolders = ReorderChatFolders
  { -- |
    main_chat_list_position :: Maybe Int,
    -- |
    chat_folder_ids :: Maybe [Int]
  }
  deriving (Eq)

instance Show ReorderChatFolders where
  show
    ReorderChatFolders
      { main_chat_list_position = main_chat_list_position_,
        chat_folder_ids = chat_folder_ids_
      } =
      "ReorderChatFolders"
        ++ U.cc
          [ U.p "main_chat_list_position" main_chat_list_position_,
            U.p "chat_folder_ids" chat_folder_ids_
          ]

instance T.ToJSON ReorderChatFolders where
  toJSON
    ReorderChatFolders
      { main_chat_list_position = main_chat_list_position_,
        chat_folder_ids = chat_folder_ids_
      } =
      A.object
        [ "@type" A..= T.String "reorderChatFolders",
          "main_chat_list_position" A..= main_chat_list_position_,
          "chat_folder_ids" A..= chat_folder_ids_
        ]
