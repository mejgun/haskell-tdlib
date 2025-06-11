module TD.Query.SetDirectMessagesChatTopicIsMarkedAsUnread
  (SetDirectMessagesChatTopicIsMarkedAsUnread(..)
  , defaultSetDirectMessagesChatTopicIsMarkedAsUnread
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the marked as unread state of the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data SetDirectMessagesChatTopicIsMarkedAsUnread
  = SetDirectMessagesChatTopicIsMarkedAsUnread
    { chat_id             :: Maybe Int  -- ^ Chat identifier of the channel direct messages chat
    , topic_id            :: Maybe Int  -- ^ Topic identifier
    , is_marked_as_unread :: Maybe Bool -- ^ New value of is_marked_as_unread
    }
  deriving (Eq, Show)

instance I.ShortShow SetDirectMessagesChatTopicIsMarkedAsUnread where
  shortShow
    SetDirectMessagesChatTopicIsMarkedAsUnread
      { chat_id             = chat_id_
      , topic_id            = topic_id_
      , is_marked_as_unread = is_marked_as_unread_
      }
        = "SetDirectMessagesChatTopicIsMarkedAsUnread"
          ++ I.cc
          [ "chat_id"             `I.p` chat_id_
          , "topic_id"            `I.p` topic_id_
          , "is_marked_as_unread" `I.p` is_marked_as_unread_
          ]

instance AT.ToJSON SetDirectMessagesChatTopicIsMarkedAsUnread where
  toJSON
    SetDirectMessagesChatTopicIsMarkedAsUnread
      { chat_id             = chat_id_
      , topic_id            = topic_id_
      , is_marked_as_unread = is_marked_as_unread_
      }
        = A.object
          [ "@type"               A..= AT.String "setDirectMessagesChatTopicIsMarkedAsUnread"
          , "chat_id"             A..= chat_id_
          , "topic_id"            A..= topic_id_
          , "is_marked_as_unread" A..= is_marked_as_unread_
          ]

defaultSetDirectMessagesChatTopicIsMarkedAsUnread :: SetDirectMessagesChatTopicIsMarkedAsUnread
defaultSetDirectMessagesChatTopicIsMarkedAsUnread =
  SetDirectMessagesChatTopicIsMarkedAsUnread
    { chat_id             = Nothing
    , topic_id            = Nothing
    , is_marked_as_unread = Nothing
    }

