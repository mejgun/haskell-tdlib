{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolderChatCount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Utils as U

-- |
-- Returns approximate number of chats in a being created chat folder. Main and archive chat lists must be fully preloaded for this function to work correctly @folder The new chat folder
data GetChatFolderChatCount = GetChatFolderChatCount
  { -- |
    folder :: Maybe ChatFolder.ChatFolder
  }
  deriving (Eq)

instance Show GetChatFolderChatCount where
  show
    GetChatFolderChatCount
      { folder = folder_
      } =
      "GetChatFolderChatCount"
        ++ U.cc
          [ U.p "folder" folder_
          ]

instance T.ToJSON GetChatFolderChatCount where
  toJSON
    GetChatFolderChatCount
      { folder = folder_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolderChatCount",
          "folder" A..= folder_
        ]
