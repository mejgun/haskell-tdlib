{-# LANGUAGE OverloadedStrings #-}

module TD.Query.RemoveTopChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.TopChatCategory as TopChatCategory
import qualified Utils as U

-- |
-- Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled @category Category of frequently used chats @chat_id Chat identifier
data RemoveTopChat = RemoveTopChat
  { -- |
    chat_id :: Maybe Int,
    -- |
    category :: Maybe TopChatCategory.TopChatCategory
  }
  deriving (Eq)

instance Show RemoveTopChat where
  show
    RemoveTopChat
      { chat_id = chat_id,
        category = category
      } =
      "RemoveTopChat"
        ++ U.cc
          [ U.p "chat_id" chat_id,
            U.p "category" category
          ]

instance T.ToJSON RemoveTopChat where
  toJSON
    RemoveTopChat
      { chat_id = chat_id,
        category = category
      } =
      A.object
        [ "@type" A..= T.String "removeTopChat",
          "chat_id" A..= chat_id,
          "category" A..= category
        ]
