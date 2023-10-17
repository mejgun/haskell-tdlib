module TD.Data.ForumTopics
  (ForumTopics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ForumTopic as ForumTopic

data ForumTopics
  = ForumTopics -- ^ Describes a list of forum topics
    { total_count                   :: Maybe Int                     -- ^ Approximate total number of forum topics found
    , topics                        :: Maybe [ForumTopic.ForumTopic] -- ^ List of forum topics
    , next_offset_date              :: Maybe Int                     -- ^ Offset date for the next getForumTopics request
    , next_offset_message_id        :: Maybe Int                     -- ^ Offset message identifier for the next getForumTopics request
    , next_offset_message_thread_id :: Maybe Int                     -- ^ Offset message thread identifier for the next getForumTopics request
    }
  deriving (Eq, Show)

instance I.ShortShow ForumTopics where
  shortShow ForumTopics
    { total_count                   = total_count_
    , topics                        = topics_
    , next_offset_date              = next_offset_date_
    , next_offset_message_id        = next_offset_message_id_
    , next_offset_message_thread_id = next_offset_message_thread_id_
    }
      = "ForumTopics"
        ++ I.cc
        [ "total_count"                   `I.p` total_count_
        , "topics"                        `I.p` topics_
        , "next_offset_date"              `I.p` next_offset_date_
        , "next_offset_message_id"        `I.p` next_offset_message_id_
        , "next_offset_message_thread_id" `I.p` next_offset_message_thread_id_
        ]

instance AT.FromJSON ForumTopics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "forumTopics" -> parseForumTopics v
      _             -> mempty
    
    where
      parseForumTopics :: A.Value -> AT.Parser ForumTopics
      parseForumTopics = A.withObject "ForumTopics" $ \o -> do
        total_count_                   <- o A..:?  "total_count"
        topics_                        <- o A..:?  "topics"
        next_offset_date_              <- o A..:?  "next_offset_date"
        next_offset_message_id_        <- o A..:?  "next_offset_message_id"
        next_offset_message_thread_id_ <- o A..:?  "next_offset_message_thread_id"
        pure $ ForumTopics
          { total_count                   = total_count_
          , topics                        = topics_
          , next_offset_date              = next_offset_date_
          , next_offset_message_id        = next_offset_message_id_
          , next_offset_message_thread_id = next_offset_message_thread_id_
          }
  parseJSON _ = mempty

