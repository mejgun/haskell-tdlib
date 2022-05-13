{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteChatHistory where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all messages in the chat. Use chat.can_be_deleted_only_for_self and chat.can_be_deleted_for_all_users fields to find whether and how the method can be applied to the chat
data DeleteChatHistory = DeleteChatHistory
  { -- |
    revoke :: Maybe Bool,
    -- |
    remove_from_chat_list :: Maybe Bool,
    -- | Chat identifier @remove_from_chat_list Pass true to remove the chat from all chat lists @revoke Pass true to delete chat history for all users
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show DeleteChatHistory where
  show
    DeleteChatHistory
      { revoke = revoke_,
        remove_from_chat_list = remove_from_chat_list_,
        chat_id = chat_id_
      } =
      "DeleteChatHistory"
        ++ U.cc
          [ U.p "revoke" revoke_,
            U.p "remove_from_chat_list" remove_from_chat_list_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON DeleteChatHistory where
  toJSON
    DeleteChatHistory
      { revoke = revoke_,
        remove_from_chat_list = remove_from_chat_list_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteChatHistory",
          "revoke" A..= revoke_,
          "remove_from_chat_list" A..= remove_from_chat_list_,
          "chat_id" A..= chat_id_
        ]
