{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetChatDiscussionGroup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the discussion group of a channel chat; requires can_change_info administrator right in the channel if it is specified
data SetChatDiscussionGroup = SetChatDiscussionGroup
  { -- | Identifier of a new channel's discussion group. Use 0 to remove the discussion group. Use the method getSuitableDiscussionChats to find all suitable groups.
    -- Basic group chats must be first upgraded to supergroup chats. If new chat members don't have access to old messages in the supergroup, then toggleSupergroupIsAllHistoryAvailable must be used first to change that
    discussion_chat_id :: Maybe Int,
    -- | Identifier of the channel chat. Pass 0 to remove a link from the supergroup passed in the second argument to a linked channel chat (requires can_pin_messages rights in the supergroup)
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetChatDiscussionGroup where
  show
    SetChatDiscussionGroup
      { discussion_chat_id = discussion_chat_id_,
        chat_id = chat_id_
      } =
      "SetChatDiscussionGroup"
        ++ U.cc
          [ U.p "discussion_chat_id" discussion_chat_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON SetChatDiscussionGroup where
  toJSON
    SetChatDiscussionGroup
      { discussion_chat_id = discussion_chat_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "setChatDiscussionGroup",
          "discussion_chat_id" A..= discussion_chat_id_,
          "chat_id" A..= chat_id_
        ]
