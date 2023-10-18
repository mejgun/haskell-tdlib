module TD.Query.GetForumTopicLink
  (GetForumTopicLink(..)
  , defaultGetForumTopicLink
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTPS link to a topic in a forum chat. This is an offline request. Returns 'TD.Data.MessageLink.MessageLink'
data GetForumTopicLink
  = GetForumTopicLink
    { chat_id           :: Maybe Int -- ^ Identifier of the chat
    , message_thread_id :: Maybe Int -- ^ Message thread identifier of the forum topic
    }
  deriving (Eq, Show)

instance I.ShortShow GetForumTopicLink where
  shortShow
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

defaultGetForumTopicLink :: GetForumTopicLink
defaultGetForumTopicLink =
  GetForumTopicLink
    { chat_id           = Nothing
    , message_thread_id = Nothing
    }

