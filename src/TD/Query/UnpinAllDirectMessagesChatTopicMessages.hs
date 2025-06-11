module TD.Query.UnpinAllDirectMessagesChatTopicMessages
  (UnpinAllDirectMessagesChatTopicMessages(..)
  , defaultUnpinAllDirectMessagesChatTopicMessages
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes all pinned messages from the topic in a channel direct messages chat administered by the current user. Returns 'TD.Data.Ok.Ok'
data UnpinAllDirectMessagesChatTopicMessages
  = UnpinAllDirectMessagesChatTopicMessages
    { chat_id  :: Maybe Int -- ^ Identifier of the chat
    , topic_id :: Maybe Int -- ^ Topic identifier
    }
  deriving (Eq, Show)

instance I.ShortShow UnpinAllDirectMessagesChatTopicMessages where
  shortShow
    UnpinAllDirectMessagesChatTopicMessages
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = "UnpinAllDirectMessagesChatTopicMessages"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "topic_id" `I.p` topic_id_
          ]

instance AT.ToJSON UnpinAllDirectMessagesChatTopicMessages where
  toJSON
    UnpinAllDirectMessagesChatTopicMessages
      { chat_id  = chat_id_
      , topic_id = topic_id_
      }
        = A.object
          [ "@type"    A..= AT.String "unpinAllDirectMessagesChatTopicMessages"
          , "chat_id"  A..= chat_id_
          , "topic_id" A..= topic_id_
          ]

defaultUnpinAllDirectMessagesChatTopicMessages :: UnpinAllDirectMessagesChatTopicMessages
defaultUnpinAllDirectMessagesChatTopicMessages =
  UnpinAllDirectMessagesChatTopicMessages
    { chat_id  = Nothing
    , topic_id = Nothing
    }

