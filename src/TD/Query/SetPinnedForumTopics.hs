module TD.Query.SetPinnedForumTopics(SetPinnedForumTopics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data SetPinnedForumTopics -- ^ Changes the order of pinned forum topics
  = SetPinnedForumTopics
    { chat_id            :: Maybe Int   -- ^ Chat identifier
    , message_thread_ids :: Maybe [Int] -- ^ The new list of pinned forum topics
    }
  deriving (Eq)

instance Show SetPinnedForumTopics where
  show
    SetPinnedForumTopics
      { chat_id            = chat_id_
      , message_thread_ids = message_thread_ids_
      }
        = "SetPinnedForumTopics"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "message_thread_ids" `I.p` message_thread_ids_
          ]

instance AT.ToJSON SetPinnedForumTopics where
  toJSON
    SetPinnedForumTopics
      { chat_id            = chat_id_
      , message_thread_ids = message_thread_ids_
      }
        = A.object
          [ "@type"              A..= AT.String "setPinnedForumTopics"
          , "chat_id"            A..= chat_id_
          , "message_thread_ids" A..= message_thread_ids_
          ]
