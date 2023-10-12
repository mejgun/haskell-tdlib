module TD.Query.GetArchivedStories where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetArchivedStories -- ^ Returns the list of all stories of the current user. The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
  = GetArchivedStories
    { from_story_id :: Maybe Int -- ^ Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    , limit         :: Maybe Int -- ^ The maximum number of stories to be returned For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq)

instance Show GetArchivedStories where
  show
    GetArchivedStories
      { from_story_id = from_story_id_
      , limit         = limit_
      }
        = "GetArchivedStories"
          ++ I.cc
          [ "from_story_id" `I.p` from_story_id_
          , "limit"         `I.p` limit_
          ]

instance AT.ToJSON GetArchivedStories where
  toJSON
    GetArchivedStories
      { from_story_id = from_story_id_
      , limit         = limit_
      }
        = A.object
          [ "@type"         A..= AT.String "getArchivedStories"
          , "from_story_id" A..= from_story_id_
          , "limit"         A..= limit_
          ]
