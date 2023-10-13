module TD.Query.GetStoryViewers
  (GetStoryViewers(..)
  , defaultGetStoryViewers
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageViewer as MessageViewer

data GetStoryViewers -- ^ Returns viewers of a recent outgoing story. The method can be called if story.can_get_viewers == true. The views are returned in a reverse chronological order (i.e., in order of decreasing view_date) For optimal performance, the number of returned stories is chosen by TDLib
  = GetStoryViewers
    { story_id      :: Maybe Int                         -- ^ Story identifier
    , offset_viewer :: Maybe MessageViewer.MessageViewer -- ^ A viewer from which to return next viewers; pass null to get results from the beginning
    , limit         :: Maybe Int                         -- ^ The maximum number of story viewers to return For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq)

instance Show GetStoryViewers where
  show
    GetStoryViewers
      { story_id      = story_id_
      , offset_viewer = offset_viewer_
      , limit         = limit_
      }
        = "GetStoryViewers"
          ++ I.cc
          [ "story_id"      `I.p` story_id_
          , "offset_viewer" `I.p` offset_viewer_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetStoryViewers where
  toJSON
    GetStoryViewers
      { story_id      = story_id_
      , offset_viewer = offset_viewer_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getStoryViewers"
          , "story_id"      A..= story_id_
          , "offset_viewer" A..= offset_viewer_
          , "limit"         A..= limit_
          ]

defaultGetStoryViewers :: GetStoryViewers
defaultGetStoryViewers =
  GetStoryViewers
    { story_id      = Nothing
    , offset_viewer = Nothing
    , limit         = Nothing
    }

