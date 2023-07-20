{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatActiveStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryInfo as StoryInfo
import qualified TD.Data.StoryList as StoryList
import qualified Utils as U

-- |
data ChatActiveStories = -- | Describes active stories posted by a chat
  ChatActiveStories
  { -- | Basic information about the stories; use getStory to get full information about the stories. The stories are in a chronological order (i.e., in order of increasing story identifiers)
    stories :: Maybe [StoryInfo.StoryInfo],
    -- | Identifier of the last read active story
    max_read_story_id :: Maybe Int,
    -- | A parameter used to determine order of the stories in the story list; 0 if the stories doesn't need to be shown in the story list. Stories must be sorted by the pair (order, story_sender_chat_id) in descending order
    order :: Maybe Int,
    -- | Identifier of the story list in which the stories are shown; may be null if the stories aren't shown in a story list
    list :: Maybe StoryList.StoryList,
    -- | Identifier of the chat that posted the stories
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ChatActiveStories where
  show
    ChatActiveStories
      { stories = stories_,
        max_read_story_id = max_read_story_id_,
        order = order_,
        list = list_,
        chat_id = chat_id_
      } =
      "ChatActiveStories"
        ++ U.cc
          [ U.p "stories" stories_,
            U.p "max_read_story_id" max_read_story_id_,
            U.p "order" order_,
            U.p "list" list_,
            U.p "chat_id" chat_id_
          ]

instance T.FromJSON ChatActiveStories where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatActiveStories" -> parseChatActiveStories v
      _ -> mempty
    where
      parseChatActiveStories :: A.Value -> T.Parser ChatActiveStories
      parseChatActiveStories = A.withObject "ChatActiveStories" $ \o -> do
        stories_ <- o A..:? "stories"
        max_read_story_id_ <- o A..:? "max_read_story_id"
        order_ <- o A..:? "order"
        list_ <- o A..:? "list"
        chat_id_ <- o A..:? "chat_id"
        return $ ChatActiveStories {stories = stories_, max_read_story_id = max_read_story_id_, order = order_, list = list_, chat_id = chat_id_}
  parseJSON _ = mempty

instance T.ToJSON ChatActiveStories where
  toJSON
    ChatActiveStories
      { stories = stories_,
        max_read_story_id = max_read_story_id_,
        order = order_,
        list = list_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "chatActiveStories",
          "stories" A..= stories_,
          "max_read_story_id" A..= max_read_story_id_,
          "order" A..= order_,
          "list" A..= list_,
          "chat_id" A..= chat_id_
        ]
