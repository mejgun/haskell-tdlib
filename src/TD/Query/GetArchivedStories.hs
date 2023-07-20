{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetArchivedStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns the list of all stories of the current user. The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id).
-- For optimal performance, the number of returned stories is chosen by TDLib
data GetArchivedStories = GetArchivedStories
  { -- | The maximum number of stories to be returned
    -- For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    from_story_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetArchivedStories where
  show
    GetArchivedStories
      { limit = limit_,
        from_story_id = from_story_id_
      } =
      "GetArchivedStories"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "from_story_id" from_story_id_
          ]

instance T.ToJSON GetArchivedStories where
  toJSON
    GetArchivedStories
      { limit = limit_,
        from_story_id = from_story_id_
      } =
      A.object
        [ "@type" A..= T.String "getArchivedStories",
          "limit" A..= limit_,
          "from_story_id" A..= from_story_id_
        ]
