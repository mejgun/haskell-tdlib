module TD.Query.ToggleChatIsMarkedAsUnread
  (ToggleChatIsMarkedAsUnread(..)
  , defaultToggleChatIsMarkedAsUnread
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ToggleChatIsMarkedAsUnread -- ^ Changes the marked as unread state of a chat
  = ToggleChatIsMarkedAsUnread
    { chat_id             :: Maybe Int  -- ^ Chat identifier
    , is_marked_as_unread :: Maybe Bool -- ^ New value of is_marked_as_unread
    }
  deriving (Eq)

instance Show ToggleChatIsMarkedAsUnread where
  show
    ToggleChatIsMarkedAsUnread
      { chat_id             = chat_id_
      , is_marked_as_unread = is_marked_as_unread_
      }
        = "ToggleChatIsMarkedAsUnread"
          ++ I.cc
          [ "chat_id"             `I.p` chat_id_
          , "is_marked_as_unread" `I.p` is_marked_as_unread_
          ]

instance AT.ToJSON ToggleChatIsMarkedAsUnread where
  toJSON
    ToggleChatIsMarkedAsUnread
      { chat_id             = chat_id_
      , is_marked_as_unread = is_marked_as_unread_
      }
        = A.object
          [ "@type"               A..= AT.String "toggleChatIsMarkedAsUnread"
          , "chat_id"             A..= chat_id_
          , "is_marked_as_unread" A..= is_marked_as_unread_
          ]

defaultToggleChatIsMarkedAsUnread :: ToggleChatIsMarkedAsUnread
defaultToggleChatIsMarkedAsUnread =
  ToggleChatIsMarkedAsUnread
    { chat_id             = Nothing
    , is_marked_as_unread = Nothing
    }

