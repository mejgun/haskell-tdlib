module TD.Query.ToggleForumTopicIsClosed
  (ToggleForumTopicIsClosed(..)
  , defaultToggleForumTopicIsClosed
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether a topic is closed in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup unless the user is creator of the topic. Returns 'TD.Data.Ok.Ok'
data ToggleForumTopicIsClosed
  = ToggleForumTopicIsClosed
    { chat_id        :: Maybe Int  -- ^ Identifier of the chat
    , forum_topic_id :: Maybe Int  -- ^ Forum topic identifier
    , is_closed      :: Maybe Bool -- ^ Pass true to close the topic; pass false to reopen it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleForumTopicIsClosed where
  shortShow
    ToggleForumTopicIsClosed
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , is_closed      = is_closed_
      }
        = "ToggleForumTopicIsClosed"
          ++ I.cc
          [ "chat_id"        `I.p` chat_id_
          , "forum_topic_id" `I.p` forum_topic_id_
          , "is_closed"      `I.p` is_closed_
          ]

instance AT.ToJSON ToggleForumTopicIsClosed where
  toJSON
    ToggleForumTopicIsClosed
      { chat_id        = chat_id_
      , forum_topic_id = forum_topic_id_
      , is_closed      = is_closed_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleForumTopicIsClosed"
          , "chat_id"        A..= chat_id_
          , "forum_topic_id" A..= forum_topic_id_
          , "is_closed"      A..= is_closed_
          ]

defaultToggleForumTopicIsClosed :: ToggleForumTopicIsClosed
defaultToggleForumTopicIsClosed =
  ToggleForumTopicIsClosed
    { chat_id        = Nothing
    , forum_topic_id = Nothing
    , is_closed      = Nothing
    }

