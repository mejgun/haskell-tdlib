module TD.Query.ToggleChatIsPinned
  (ToggleChatIsPinned(..)
  , defaultToggleChatIsPinned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatList as ChatList

-- | Changes the pinned state of a chat. There can be up to getOption("pinned_chat_count_max")/getOption("pinned_archived_chat_count_max") pinned non-secret chats and the same number of secret chats in the main/archive chat list. The limit can be increased with Telegram Premium. Returns 'TD.Data.Ok.Ok'
data ToggleChatIsPinned
  = ToggleChatIsPinned
    { chat_list :: Maybe ChatList.ChatList -- ^ Chat list in which to change the pinned state of the chat
    , chat_id   :: Maybe Int               -- ^ Chat identifier
    , is_pinned :: Maybe Bool              -- ^ Pass true to pin the chat; pass false to unpin it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleChatIsPinned where
  shortShow
    ToggleChatIsPinned
      { chat_list = chat_list_
      , chat_id   = chat_id_
      , is_pinned = is_pinned_
      }
        = "ToggleChatIsPinned"
          ++ I.cc
          [ "chat_list" `I.p` chat_list_
          , "chat_id"   `I.p` chat_id_
          , "is_pinned" `I.p` is_pinned_
          ]

instance AT.ToJSON ToggleChatIsPinned where
  toJSON
    ToggleChatIsPinned
      { chat_list = chat_list_
      , chat_id   = chat_id_
      , is_pinned = is_pinned_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleChatIsPinned"
          , "chat_list" A..= chat_list_
          , "chat_id"   A..= chat_id_
          , "is_pinned" A..= is_pinned_
          ]

defaultToggleChatIsPinned :: ToggleChatIsPinned
defaultToggleChatIsPinned =
  ToggleChatIsPinned
    { chat_list = Nothing
    , chat_id   = Nothing
    , is_pinned = Nothing
    }

