module TD.Query.GetForumTopic where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetForumTopic -- ^ Returns information about a forum topic
  = GetForumTopic
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier of the forum topic
    }
  deriving (Eq)

instance Show GetForumTopic where
  show
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
