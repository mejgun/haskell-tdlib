module TD.Query.ToggleSavedMessagesTopicIsPinned
  (ToggleSavedMessagesTopicIsPinned(..)
  , defaultToggleSavedMessagesTopicIsPinned
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the pinned state of a Saved Messages topic. There can be up to getOption("pinned_saved_messages_topic_count_max") pinned topics. The limit can be increased with Telegram Premium. Returns 'TD.Data.Ok.Ok'
data ToggleSavedMessagesTopicIsPinned
  = ToggleSavedMessagesTopicIsPinned
    { saved_messages_topic_id :: Maybe Int  -- ^ Identifier of Saved Messages topic to pin or unpin
    , is_pinned               :: Maybe Bool -- ^ Pass true to pin the topic; pass false to unpin it
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleSavedMessagesTopicIsPinned where
  shortShow
    ToggleSavedMessagesTopicIsPinned
      { saved_messages_topic_id = saved_messages_topic_id_
      , is_pinned               = is_pinned_
      }
        = "ToggleSavedMessagesTopicIsPinned"
          ++ I.cc
          [ "saved_messages_topic_id" `I.p` saved_messages_topic_id_
          , "is_pinned"               `I.p` is_pinned_
          ]

instance AT.ToJSON ToggleSavedMessagesTopicIsPinned where
  toJSON
    ToggleSavedMessagesTopicIsPinned
      { saved_messages_topic_id = saved_messages_topic_id_
      , is_pinned               = is_pinned_
      }
        = A.object
          [ "@type"                   A..= AT.String "toggleSavedMessagesTopicIsPinned"
          , "saved_messages_topic_id" A..= saved_messages_topic_id_
          , "is_pinned"               A..= is_pinned_
          ]

defaultToggleSavedMessagesTopicIsPinned :: ToggleSavedMessagesTopicIsPinned
defaultToggleSavedMessagesTopicIsPinned =
  ToggleSavedMessagesTopicIsPinned
    { saved_messages_topic_id = Nothing
    , is_pinned               = Nothing
    }

