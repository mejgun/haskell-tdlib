{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatListsToAddChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns chat lists to which the chat can be added. This is an offline request @chat_id Chat identifier
data GetChatListsToAddChat = GetChatListsToAddChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatListsToAddChat where
  show
    GetChatListsToAddChat
      { chat_id = chat_id_
      } =
      "GetChatListsToAddChat"
        ++ U.cc
          [ U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatListsToAddChat where
  toJSON
    GetChatListsToAddChat
      { chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatListsToAddChat",
          "chat_id" A..= chat_id_
        ]
