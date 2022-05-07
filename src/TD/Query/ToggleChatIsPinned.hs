{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleChatIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Changes the pinned state of a chat. There can be up to GetOption("pinned_chat_count_max")/GetOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list
data ToggleChatIsPinned = ToggleChatIsPinned
  { -- |
    is_pinned :: Maybe Bool,
    -- |
    chat_id :: Maybe Int,
    -- | Chat list in which to change the pinned state of the chat @chat_id Chat identifier @is_pinned Pass true to pin the chat; pass false to unpin it
    chat_list :: Maybe ChatList.ChatList
  }
  deriving (Eq)

instance Show ToggleChatIsPinned where
  show
    ToggleChatIsPinned
      { is_pinned = is_pinned,
        chat_id = chat_id,
        chat_list = chat_list
      } =
      "ToggleChatIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned,
            U.p "chat_id" chat_id,
            U.p "chat_list" chat_list
          ]

instance T.ToJSON ToggleChatIsPinned where
  toJSON
    ToggleChatIsPinned
      { is_pinned = is_pinned,
        chat_id = chat_id,
        chat_list = chat_list
      } =
      A.object
        [ "@type" A..= T.String "toggleChatIsPinned",
          "is_pinned" A..= is_pinned,
          "chat_id" A..= chat_id,
          "chat_list" A..= chat_list
        ]
