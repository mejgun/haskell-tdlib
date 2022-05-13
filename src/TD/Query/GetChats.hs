{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
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
      { limit = limit_,
        chat_list = chat_list_
      } =
      "GetChats"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "chat_list" chat_list_
          ]

instance T.ToJSON GetChats where
  toJSON
    GetChats
      { limit = limit_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "getChats",
          "limit" A..= limit_,
          "chat_list" A..= chat_list_
        ]
