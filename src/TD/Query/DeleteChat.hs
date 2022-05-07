{-# LANGUAGE OverloadedStrings #-}

module TD.Query.DeleteChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes a chat along with all messages in the corresponding chat for all chat members. For group chats this will release the username and remove all members. Use the field chat.can_be_deleted_for_all_users to find whether the method can be applied to the chat @chat_id Chat identifier
data DeleteChat = DeleteChat
  { -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChat where
  show
    DeleteChat
      { chat_id = chat_id
      } =
      "DeleteChat"
        ++ U.cc
          [ U.p "chat_id" chat_id
          ]

instance T.ToJSON DeleteChat where
  toJSON
    DeleteChat
      { chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "deleteChat",
          "chat_id" A..= chat_id
        ]
