{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatFolderInviteLinks where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns invite links created by the current user for a shareable chat folder @chat_folder_id Chat folder identifier
data GetChatFolderInviteLinks = GetChatFolderInviteLinks
  { -- |
    chat_folder_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatFolderInviteLinks where
  show
    GetChatFolderInviteLinks
      { chat_folder_id = chat_folder_id_
      } =
      "GetChatFolderInviteLinks"
        ++ U.cc
          [ U.p "chat_folder_id" chat_folder_id_
          ]

instance T.ToJSON GetChatFolderInviteLinks where
  toJSON
    GetChatFolderInviteLinks
      { chat_folder_id = chat_folder_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatFolderInviteLinks",
          "chat_folder_id" A..= chat_folder_id_
        ]
