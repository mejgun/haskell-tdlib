{-# LANGUAGE OverloadedStrings #-}

module TD.Query.LoadChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Loads more chats from a chat list. The loaded chats and their positions in the chat list will be sent through updates. Chats are sorted by the pair (chat.position.order, chat.id) in descending order. Returns a 404 error if all chats have been loaded
data LoadChats = LoadChats
  { -- | The maximum number of chats to be loaded. For optimal performance, the number of loaded chats is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
    limit :: Maybe Int,
    -- | The chat list in which to load chats; pass null to load chats from the main chat list
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show LoadChats where
  show
    LoadChats
      { limit = limit,
        chat_list = chat_list
      } =
      "LoadChats"
        ++ U.cc
          [ U.p "limit" limit,
            U.p "chat_list" chat_list
          ]

instance T.ToJSON LoadChats where
  toJSON
    LoadChats
      { limit = limit,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "loadChats",
          "limit" A..= limit,
          "chat_list" A..= chat_list
        ]
