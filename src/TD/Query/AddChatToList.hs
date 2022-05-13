{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddChatToList where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Adds a chat to a chat list. A chat can't be simultaneously in Main and Archive chat lists, so it is automatically removed from another one if needed
data AddChatToList = AddChatToList
  { -- |
    chat_list :: Maybe ChatList.ChatList,
    -- | Chat identifier @chat_list The chat list. Use getChatListsToAddChat to get suitable chat lists
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddChatToList where
  show
    AddChatToList
      { chat_list = chat_list_,
        chat_id = chat_id_
      } =
      "AddChatToList"
        ++ U.cc
          [ U.p "chat_list" chat_list_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON AddChatToList where
  toJSON
    AddChatToList
      { chat_list = chat_list_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "addChatToList",
          "chat_list" A..= chat_list_,
          "chat_id" A..= chat_id_
        ]
