{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ReadChatList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Traverse all chats in a chat list and marks all messages in the chats as read @chat_list Chat list in which to mark all chats as read
data ReadChatList = ReadChatList
  { -- |
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show ReadChatList where
  show
    ReadChatList
      { chat_list = chat_list_
      } =
      "ReadChatList"
        ++ U.cc
          [ U.p "chat_list" chat_list_
          ]

instance T.ToJSON ReadChatList where
  toJSON
    ReadChatList
      { chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "readChatList",
          "chat_list" A..= chat_list_
        ]
