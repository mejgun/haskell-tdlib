module TD.Query.ReadAllDirectMessagesChatTopicReactions
  (ReadAllDirectMessagesChatTopicReactions(..)
  , defaultReadAllDirectMessagesChatTopicReactions
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all unread reactions in the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data ReadAllDirectMessagesChatTopicReactions
  = ReadAllDirectMessagesChatTopicReactions
    { chat_id  :: Maybe Int -- ^ Identifier of the chat
    , topic_id :: Maybe Int -- ^ Topic identifier
    }
  deriving (Eq, Show)

instance I.ShortShow ReadAllDirectMessagesChatTopicReactions where
  shortShow
    ReadAllDirectMessagesChatTopicReactions
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = "ReadAllDirectMessagesChatTopicReactions"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          ]

instance AT.ToJSON ReadAllDirectMessagesChatTopicReactions where
  toJSON
    ReadAllDirectMessagesChatTopicReactions
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = A.object
          [ "@type"    A..= AT.String "readAllDirectMessagesChatTopicReactions"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          ]

defaultReadAllDirectMessagesChatTopicReactions :: ReadAllDirectMessagesChatTopicReactions
defaultReadAllDirectMessagesChatTopicReactions =
  ReadAllDirectMessagesChatTopicReactions
    { chat_id  = Nothing
    , topic_id = Nothing
    }

