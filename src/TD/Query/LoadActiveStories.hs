module TD.Query.LoadActiveStories
  (LoadActiveStories(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryList as StoryList

-- | Loads more active stories from a story list. The loaded stories will be sent through updates. Active stories are sorted by the pair (active_stories.order, active_stories.story_sender_chat_id) in descending order. Returns a 404 error if all active stories have been loaded. Returns 'TD.Data.Ok.Ok'
data LoadActiveStories
  = LoadActiveStories
    { story_list :: Maybe StoryList.StoryList -- ^ The story list in which to load active stories
    }
  deriving (Eq, Show)

instance I.ShortShow LoadActiveStories where
  shortShow
    LoadActiveStories
      { story_list = story_list_
      }
        = "LoadActiveStories"
          ++ I.cc
          [ "story_list" `I.p` story_list_
          ]

instance AT.ToJSON LoadActiveStories where
  toJSON
    LoadActiveStories
      { story_list = story_list_
      }
        = A.object
          [ "@type"      A..= AT.String "loadActiveStories"
          , "story_list" A..= story_list_
          ]

