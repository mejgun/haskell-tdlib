{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatList as ChatList
import qualified Utils as U

-- |
-- Returns an ordered list of chats from the beginning of a chat list. For informational purposes only. Use loadChats and updates processing instead to maintain chat lists in a consistent state
data GetChats = GetChats
  { -- |
    limit :: Maybe Int,
    -- | The chat list in which to return chats; pass null to get chats from the main chat list @limit The maximum number of chats to be returned
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show GetChats where
  show
    GetChats
      { limit = limit,
        chat_list = chat_list
      } =
      "GetChats"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "chat_list" chat_list
          ]

instance T.ToJSON GetChats where
  toJSON
    GetChats
      { limit = limit,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "getChats",
          "limit" A..= limit,
          "chat_list" A..= chat_list
        ]
