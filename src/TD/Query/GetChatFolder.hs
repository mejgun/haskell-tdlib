{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolder where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a chat folder by its identifier @chat_folder_id Chat folder identifier
data GetChatFolder = GetChatFolder
  { -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatFolder where
  show
    GetChatFolder
      { chat_folder_id = chat_folder_id_
      } =
      "GetChatFolder"
        ++ U.cc
          [ U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON GetChatFolder where
  toJSON
    GetChatFolder
      { chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolder",
          "chat_folder_id" A..= chat_folder_id_
        ]
