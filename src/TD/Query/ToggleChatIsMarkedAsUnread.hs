{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleChatIsMarkedAsUnread where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Changes the marked as unread state of a chat @chat_id Chat identifier @is_marked_as_unread New value of is_marked_as_unread
data ToggleChatIsMarkedAsUnread = ToggleChatIsMarkedAsUnread
  { -- |
    is_marked_as_unread :: Maybe Bool,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleChatIsMarkedAsUnread where
  show
    ToggleChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread_,
        chat_id = chat_id_
      } =
      "ToggleChatIsMarkedAsUnread"
        ++ U.cc
          [ U.p "is_marked_as_unread" is_marked_as_unread_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ToggleChatIsMarkedAsUnread where
  toJSON
    ToggleChatIsMarkedAsUnread
      { is_marked_as_unread = is_marked_as_unread_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleChatIsMarkedAsUnread",
          "is_marked_as_unread" A..= is_marked_as_unread_,
          "chat_id" A..= chat_id_
        ]
