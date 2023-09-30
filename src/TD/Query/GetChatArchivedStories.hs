{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetChatArchivedStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the list of all stories posted by the given chat; requires can_edit_stories rights for channel chats.
-- The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
data GetChatArchivedStories = GetChatArchivedStories
  { -- | The maximum number of stories to be returned
    -- For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    from_story_id :: Maybe Int,
    -- | Chat identifier
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetChatArchivedStories where
  show
    GetChatArchivedStories
      { limit = limit_,
        from_story_id = from_story_id_,
        chat_id = chat_id_
      } =
      "GetChatArchivedStories"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "from_story_id" from_story_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetChatArchivedStories where
  toJSON
    GetChatArchivedStories
      { limit = limit_,
        from_story_id = from_story_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getChatArchivedStories",
          "limit" A..= limit_,
          "from_story_id" A..= from_story_id_,
          "chat_id" A..= chat_id_
        ]
