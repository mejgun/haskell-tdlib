{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatMessagesByDate where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
data DeleteChatMessagesByDate = DeleteChatMessagesByDate
  { -- | Pass true to delete chat messages for all users; private chats only
    revoke :: Maybe Bool,
    -- | The maximum date of the messages to delete
    max_date :: Maybe Int,
    -- | The minimum date of the messages to delete
    min_date :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatMessagesByDate where
  show
    DeleteChatMessagesByDate
      { revoke = revoke_,
        max_date = max_date_,
        min_date = min_date_,
        chat_id = chat_id_
      } =
      "DeleteChatMessagesByDate"
        ++ U.cc
          [ U.p "revoke" revoke_,
            U.p "max_date" max_date_,
            U.p "min_date" min_date_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON DeleteChatMessagesByDate where
  toJSON
    DeleteChatMessagesByDate
      { revoke = revoke_,
        max_date = max_date_,
        min_date = min_date_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatMessagesByDate",
          "revoke" A..= revoke_,
          "max_date" A..= max_date_,
          "min_date" A..= min_date_,
          "chat_id" A..= chat_id_
        ]
