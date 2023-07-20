{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStoryViewers where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageViewer as MessageViewer
import qualified Utils as U

-- |
-- Returns viewers of a recent outgoing story. The method can be called if story.can_get_viewers == true. The views are returned in a reverse chronological order (i.e., in order of decreasing view_date)
-- For optimal performance, the number of returned stories is chosen by TDLib
data GetStoryViewers = GetStoryViewers
  { -- | The maximum number of story viewers to return
    -- For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    limit :: Maybe Int,
    -- | A viewer from which to return next viewers; pass null to get results from the beginning
    offset_viewer :: Maybe MessageViewer.MessageViewer,
    -- | Story identifier
    story_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetStoryViewers where
  show
    GetStoryViewers
      { limit = limit_,
        offset_viewer = offset_viewer_,
        story_id = story_id_
      } =
      "GetStoryViewers"
        ++ U.cc
          [ U.p "limit" limit_,
            U.p "offset_viewer" offset_viewer_,
            U.p "story_id" story_id_
          ]

instance T.ToJSON GetStoryViewers where
  toJSON
    GetStoryViewers
      { limit = limit_,
        offset_viewer = offset_viewer_,
        story_id = story_id_
      } =
      A.object
        [ "@type" A..= T.String "getStoryViewers",
          "limit" A..= limit_,
          "offset_viewer" A..= offset_viewer_,
          "story_id" A..= story_id_
        ]
