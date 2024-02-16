module TD.Query.SetPinnedSavedMessagesTopics
  (SetPinnedSavedMessagesTopics(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the order of pinned Saved Messages topics. Returns 'TD.Data.Ok.Ok'
data SetPinnedSavedMessagesTopics
  = SetPinnedSavedMessagesTopics
    { saved_messages_topic_ids :: Maybe [Int] -- ^ Identifiers of the new pinned Saved Messages topics
    }
  deriving (Eq, Show)

instance I.ShortShow SetPinnedSavedMessagesTopics where
  shortShow
    SetPinnedSavedMessagesTopics
      { saved_messages_topic_ids = saved_messages_topic_ids_
      }
        = "SetPinnedSavedMessagesTopics"
          ++ I.cc
          [ "saved_messages_topic_ids" `I.p` saved_messages_topic_ids_
          ]

instance AT.ToJSON SetPinnedSavedMessagesTopics where
  toJSON
    SetPinnedSavedMessagesTopics
      { saved_messages_topic_ids = saved_messages_topic_ids_
      }
        = A.object
          [ "@type"                    A..= AT.String "setPinnedSavedMessagesTopics"
          , "saved_messages_topic_ids" A..= saved_messages_topic_ids_
          ]

