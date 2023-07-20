{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.LoadActiveStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StoryList as StoryList
import qualified Utils as U

-- |
-- Loads more active stories from a story list. The loaded stories will be sent through updates. Active stories are sorted by
-- the pair (active_stories.order, active_stories.story_sender_chat_id) in descending order. Returns a 404 error if all active stories have been loaded
data LoadActiveStories = LoadActiveStories
  { -- | The story list in which to load active stories
    story_list :: Maybe StoryList.StoryList
  }
  deriving (Eq)

instance Show LoadActiveStories where
  show
    LoadActiveStories
      { story_list = story_list_
      } =
      "LoadActiveStories"
        ++ U.cc
          [ U.p "story_list" story_list_
          ]

instance T.ToJSON LoadActiveStories where
  toJSON
    LoadActiveStories
      { story_list = story_list_
      } =
      A.object
        [ "@type" A..= T.String "loadActiveStories",
          "story_list" A..= story_list_
        ]
