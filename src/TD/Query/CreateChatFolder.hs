{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CreateChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatFolder as ChatFolder
import qualified Utils as U

-- |
-- Creates new chat folder. Returns information about the created chat folder. There can be up to getOption("chat_folder_count_max") chat folders, but the limit can be increased with Telegram Premium @folder The new chat folder
data CreateChatFolder = CreateChatFolder
  { -- |
    folder :: Maybe ChatFolder.ChatFolder
  }
  deriving (Eq)

instance Show CreateChatFolder where
  show
    CreateChatFolder
      { folder = folder_
      } =
      "CreateChatFolder"
        ++ U.cc
          [ U.p "folder" folder_
          ]

instance T.ToJSON CreateChatFolder where
  toJSON
    CreateChatFolder
      { folder = folder_
      } =
      A.object
        [ "@type" A..= T.String "createChatFolder",
          "folder" A..= folder_
        ]
