{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolderDefaultIconName where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Utils as U

-- |
-- Returns default icon name for a folder. Can be called synchronously @folder Chat folder
data GetChatFolderDefaultIconName = GetChatFolderDefaultIconName
  { -- |
    folder :: Maybe ChatFolder.ChatFolder
  }
  deriving (Eq)

instance Show GetChatFolderDefaultIconName where
  show
    GetChatFolderDefaultIconName
      { folder = folder_
      } =
      "GetChatFolderDefaultIconName"
        ++ U.cc
          [ U.p "folder" folder_
          ]

instance T.ToJSON GetChatFolderDefaultIconName where
  toJSON
    GetChatFolderDefaultIconName
      { folder = folder_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolderDefaultIconName",
          "folder" A..= folder_
        ]
