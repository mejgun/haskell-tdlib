module TD.Query.GetForumTopic
  (GetForumTopic(..)
  , defaultGetForumTopic
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a forum topic. Returns 'TD.Data.ForumTopic.ForumTopic'
data GetForumTopic
  = GetForumTopic
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier of the forum topic
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopic where
  shortShow
    GetForumTopic
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "GetForumTopic"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON GetForumTopic where
  toJSON
    GetForumTopic
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "getForumTopic"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]

defaultGetForumTopic :: GetForumTopic
defaultGetForumTopic =
  GetForumTopic
    { chat_id           = Nothing
    , message_thread_id = Nothing
    }

