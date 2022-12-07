{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleChatIsPinned where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ChatList as ChatList
import qualified Utils as U

-- |
-- Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list. The limit can be increased with Telegram Premium
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
      { is_pinned = is_pinned_,
        chat_id = chat_id_,
        chat_list = chat_list_
      } =
      "ToggleChatIsPinned"
        ++ U.cc
          [ U.p "is_pinned" is_pinned_,
            U.p "chat_id" chat_id_,
            U.p "chat_list" chat_list_
          ]

instance T.ToJSON ToggleChatIsPinned where
  toJSON
    ToggleChatIsPinned
      { is_pinned = is_pinned_,
        chat_id = chat_id_,
        chat_list = chat_list_
      } =
      A.object
        [ "@type" A..= T.String "toggleChatIsPinned",
          "is_pinned" A..= is_pinned_,
          "chat_id" A..= chat_id_,
          "chat_list" A..= chat_list_
        ]
