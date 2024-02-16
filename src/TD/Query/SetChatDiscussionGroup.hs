module TD.Query.SetChatDiscussionGroup
  (SetChatDiscussionGroup(..)
  , defaultSetChatDiscussionGroup
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the discussion group of a channel chat; requires can_change_info administrator right in the channel if it is specified. Returns 'TD.Data.Ok.Ok'
data SetChatDiscussionGroup
  = SetChatDiscussionGroup
    { chat_id            :: Maybe Int -- ^ Identifier of the channel chat. Pass 0 to remove a link from the supergroup passed in the second argument to a linked channel chat (requires can_pin_messages member right in the supergroup)
    , discussion_chat_id :: Maybe Int -- ^ Identifier of a new channel's discussion group. Use 0 to remove the discussion group. Use the method getSuitableDiscussionChats to find all suitable groups. Basic group chats must be first upgraded to supergroup chats. If new chat members don't have access to old messages in the supergroup, then toggleSupergroupIsAllHistoryAvailable must be used first to change that
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatDiscussionGroup where
  shortShow
    SetChatDiscussionGroup
      { chat_id            = chat_id_
      , discussion_chat_id = discussion_chat_id_
      }
        = "SetChatDiscussionGroup"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "discussion_chat_id" `I.p` discussion_chat_id_
          ]

instance AT.ToJSON SetChatDiscussionGroup where
  toJSON
    SetChatDiscussionGroup
      { chat_id            = chat_id_
      , discussion_chat_id = discussion_chat_id_
      }
        = A.object
          [ "@type"              A..= AT.String "setChatDiscussionGroup"
          , "chat_id"            A..= chat_id_
          , "discussion_chat_id" A..= discussion_chat_id_
          ]

defaultSetChatDiscussionGroup :: SetChatDiscussionGroup
defaultSetChatDiscussionGroup =
  SetChatDiscussionGroup
    { chat_id            = Nothing
    , discussion_chat_id = Nothing
    }

