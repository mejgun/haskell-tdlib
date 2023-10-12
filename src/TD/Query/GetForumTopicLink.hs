module TD.Query.GetForumTopicLink where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetForumTopicLink -- ^ Returns an HTTPS link to a topic in a forum chat. This is an offline request
  = GetForumTopicLink
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier of the forum topic
    }
  deriving (Eq)

instance Show GetForumTopicLink where
  show
    GetForumTopicLink
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = "GetForumTopicLink"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "message_thread_id" `I.p` message_thread_id_
          ]

instance AT.ToJSON GetForumTopicLink where
  toJSON
    GetForumTopicLink
      { chat_id           = chat_id_
      , message_thread_id = message_thread_id_
      }
        = A.object
          [ "@type"             A..= AT.String "getForumTopicLink"
          , "chat_id"           A..= chat_id_
          , "message_thread_id" A..= message_thread_id_
          ]
