{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AddRecentlyFoundChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a chat to the list of recently found chats. The chat is added to the beginning of the list. If the chat is already in the list, it will be removed from the list first @chat_id Identifier of the chat to add
data AddRecentlyFoundChat = AddRecentlyFoundChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show AddRecentlyFoundChat where
  show
    AddRecentlyFoundChat
      { chat_id = chat_id
      } =
      "AddRecentlyFoundChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON AddRecentlyFoundChat where
  toJSON
    AddRecentlyFoundChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "addRecentlyFoundChat",
          "chat_id" A..= chat_id
        ]
