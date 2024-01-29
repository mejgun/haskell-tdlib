module TD.Query.SetPinnedSavedMessagesTopics
  (SetPinnedSavedMessagesTopics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.SavedMessagesTopic as SavedMessagesTopic

-- | Changes the order of pinned Saved Messages topics. Returns 'TD.Data.Ok.Ok'
data SetPinnedSavedMessagesTopics
  = SetPinnedSavedMessagesTopics
    { saved_messages_topics :: Maybe [SavedMessagesTopic.SavedMessagesTopic] -- ^ The new list of pinned Saved Messages topics
    }
  deriving (Eq, Show)

instance I.ShortShow SetPinnedSavedMessagesTopics where
  shortShow
    SetPinnedSavedMessagesTopics
      { saved_messages_topics = saved_messages_topics_
      }
        = "SetPinnedSavedMessagesTopics"
          ++ I.cc
          [ "saved_messages_topics" `I.p` saved_messages_topics_
          ]

instance AT.ToJSON SetPinnedSavedMessagesTopics where
  toJSON
    SetPinnedSavedMessagesTopics
      { saved_messages_topics = saved_messages_topics_
      }
        = A.object
          [ "@type"                 A..= AT.String "setPinnedSavedMessagesTopics"
          , "saved_messages_topics" A..= saved_messages_topics_
          ]

