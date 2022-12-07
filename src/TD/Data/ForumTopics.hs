{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ForumTopics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ForumTopic as ForumTopic
import qualified Utils as U

-- |
data ForumTopics = -- | Describes a list of forum topics
  ForumTopics
  { -- | Offset message thread identifier for the next getForumTopics request
    next_offset_message_thread_id :: Maybe Int,
    -- | Offset message identifier for the next getForumTopics request
    next_offset_message_id :: Maybe Int,
    -- | Offset date for the next getForumTopics request
    next_offset_date :: Maybe Int,
    -- | List of forum topics
    topics :: Maybe [ForumTopic.ForumTopic],
    -- | Approximate total number of forum topics found
    total_count :: Maybe Int
  }
  deriving (Eq)

instance Show ForumTopics where
  show
    ForumTopics
      { next_offset_message_thread_id = next_offset_message_thread_id_,
        next_offset_message_id = next_offset_message_id_,
        next_offset_date = next_offset_date_,
        topics = topics_,
        total_count = total_count_
      } =
      "ForumTopics"
        ++ U.cc
          [ U.p "next_offset_message_thread_id" next_offset_message_thread_id_,
            U.p "next_offset_message_id" next_offset_message_id_,
            U.p "next_offset_date" next_offset_date_,
            U.p "topics" topics_,
            U.p "total_count" total_count_
          ]

instance T.FromJSON ForumTopics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "forumTopics" -> parseForumTopics v
      _ -> mempty
    where
      parseForumTopics :: A.Value -> T.Parser ForumTopics
      parseForumTopics = A.withObject "ForumTopics" $ \o -> do
        next_offset_message_thread_id_ <- o A..:? "next_offset_message_thread_id"
        next_offset_message_id_ <- o A..:? "next_offset_message_id"
        next_offset_date_ <- o A..:? "next_offset_date"
        topics_ <- o A..:? "topics"
        total_count_ <- o A..:? "total_count"
        return $ ForumTopics {next_offset_message_thread_id = next_offset_message_thread_id_, next_offset_message_id = next_offset_message_id_, next_offset_date = next_offset_date_, topics = topics_, total_count = total_count_}
  parseJSON _ = mempty

instance T.ToJSON ForumTopics where
  toJSON
    ForumTopics
      { next_offset_message_thread_id = next_offset_message_thread_id_,
        next_offset_message_id = next_offset_message_id_,
        next_offset_date = next_offset_date_,
        topics = topics_,
        total_count = total_count_
      } =
      A.object
        [ "@type" A..= T.String "forumTopics",
          "next_offset_message_thread_id" A..= next_offset_message_thread_id_,
          "next_offset_message_id" A..= next_offset_message_id_,
          "next_offset_date" A..= next_offset_date_,
          "topics" A..= topics_,
          "total_count" A..= total_count_
        ]
