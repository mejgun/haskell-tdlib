{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes existing chat folder @chat_folder_id Chat folder identifier @leave_chat_ids Identifiers of the chats to leave. The chats must be pinned or always included in the folder
data DeleteChatFolder = DeleteChatFolder
  { -- |
    leave_chat_ids :: Maybe [Int],
    -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatFolder where
  show
    DeleteChatFolder
      { leave_chat_ids = leave_chat_ids_,
        chat_folder_id = chat_folder_id_
      } =
      "DeleteChatFolder"
        ++ U.cc
          [ U.p "leave_chat_ids" leave_chat_ids_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON DeleteChatFolder where
  toJSON
    DeleteChatFolder
      { leave_chat_ids = leave_chat_ids_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatFolder",
          "leave_chat_ids" A..= leave_chat_ids_,
          "chat_folder_id" A..= chat_folder_id_
        ]
