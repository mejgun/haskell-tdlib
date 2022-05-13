{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetPinnedChats where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Changes the order of pinned chats @chat_list Chat list in which to change the order of pinned chats @chat_ids The new list of pinned chats
data SetPinnedChats = SetPinnedChats
  { -- |
    chat_ids :: Maybe [Int],
    -- |
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show SetPinnedChats where
  show
    SetPinnedChats
      { chat_ids = chat_ids_,
        chat_list = chat_list_
      } =
      "SetPinnedChats"
        ++ U.cc
          [ U.p "chat_ids" chat_ids_,
            U.p "chat_list" chat_list_
          ]

instance T.ToJSON SetPinnedChats where
  toJSON
    SetPinnedChats
      { chat_ids = chat_ids_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "setPinnedChats",
          "chat_ids" A..= chat_ids_,
          "chat_list" A..= chat_list_
        ]
