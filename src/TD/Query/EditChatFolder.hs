{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.EditChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Utils as U

-- |
-- Edits existing chat folder. Returns information about the edited chat folder @chat_folder_id Chat folder identifier @folder The edited chat folder
data EditChatFolder = EditChatFolder
  { -- |
    folder :: Maybe ChatFolder.ChatFolder,
    -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show EditChatFolder where
  show
    EditChatFolder
      { folder = folder_,
        chat_folder_id = chat_folder_id_
      } =
      "EditChatFolder"
        ++ U.cc
          [ U.p "folder" folder_,
            U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON EditChatFolder where
  toJSON
    EditChatFolder
      { folder = folder_,
        chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "editChatFolder",
          "folder" A..= folder_,
          "chat_folder_id" A..= chat_folder_id_
        ]
