{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteChatMessagesByDate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
data DeleteChatMessagesByDate = DeleteChatMessagesByDate
  { -- |
    revoke :: Maybe Bool,
    -- |
    max_date :: Maybe Int,
    -- |
    min_date :: Maybe Int,
    -- | Chat identifier @min_date The minimum date of the messages to delete @max_date The maximum date of the messages to delete @revoke Pass true to delete chat messages for all users; private chats only
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatMessagesByDate where
  show
    DeleteChatMessagesByDate
      { revoke = revoke,
        max_date = max_date,
        min_date = min_date,
        chat_id = chat_id
      } =
      "DeleteChatMessagesByDate"
        ++ U.cc
          [ U.p "revoke" revoke,
            U.p "max_date" max_date,
            U.p "min_date" min_date,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteChatMessagesByDate where
  toJSON
    DeleteChatMessagesByDate
      { revoke = revoke,
        max_date = max_date,
        min_date = min_date,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteChatMessagesByDate",
          "revoke" A..= revoke,
          "max_date" A..= max_date,
          "min_date" A..= min_date,
          "chat_id" A..= chat_id
        ]
