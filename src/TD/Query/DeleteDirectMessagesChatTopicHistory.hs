module TD.Query.DeleteDirectMessagesChatTopicHistory
  (DeleteDirectMessagesChatTopicHistory(..)
  , defaultDeleteDirectMessagesChatTopicHistory
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes all messages in the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data DeleteDirectMessagesChatTopicHistory
  = DeleteDirectMessagesChatTopicHistory
    { chat_id  :: Maybe Int -- ^ Chat identifier of the channel direct messages chat
    , topic_id :: Maybe Int -- ^ Identifier of the topic which messages will be deleted
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteDirectMessagesChatTopicHistory where
  shortShow
    DeleteDirectMessagesChatTopicHistory
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = "DeleteDirectMessagesChatTopicHistory"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          ]

instance AT.ToJSON DeleteDirectMessagesChatTopicHistory where
  toJSON
    DeleteDirectMessagesChatTopicHistory
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = A.object
          [ "@type"    A..= AT.String "deleteDirectMessagesChatTopicHistory"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          ]

defaultDeleteDirectMessagesChatTopicHistory :: DeleteDirectMessagesChatTopicHistory
defaultDeleteDirectMessagesChatTopicHistory =
  DeleteDirectMessagesChatTopicHistory
    { chat_id  = Nothing
    , topic_id = Nothing
    }

