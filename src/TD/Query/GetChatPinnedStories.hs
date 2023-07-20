{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatPinnedStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the list of pinned stories posted by the given chat. The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id).
-- For optimal performance, the number of returned stories is chosen by TDLib
data GetChatPinnedStories = GetChatPinnedStories
  { -- | The maximum number of stories to be returned
    -- For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    from_story_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatPinnedStories where
  show
    GetChatPinnedStories
      { limit = limit_,
        from_story_id = from_story_id_,
        chat_id = chat_id_
      } =
      "GetChatPinnedStories"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "from_story_id" from_story_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatPinnedStories where
  toJSON
    GetChatPinnedStories
      { limit = limit_,
        from_story_id = from_story_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatPinnedStories",
          "limit" A..= limit_,
          "from_story_id" A..= from_story_id_,
          "chat_id" A..= chat_id_
        ]
