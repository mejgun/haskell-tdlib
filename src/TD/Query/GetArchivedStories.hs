module TD.Query.GetArchivedStories
  (GetArchivedStories(..)
  , defaultGetArchivedStories
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns the list of all stories of the current user. The stories are returned in a reverse chronological order (i.e., in order of decreasing story_id). For optimal performance, the number of returned stories is chosen by TDLib
data GetArchivedStories
  = GetArchivedStories
    { from_story_id :: Maybe Int -- ^ Identifier of the story starting from which stories must be returned; use 0 to get results from the last story
    , limit         :: Maybe Int -- ^ The maximum number of stories to be returned For optimal performance, the number of returned stories is chosen by TDLib and can be smaller than the specified limit
    }
  deriving (Eq, Show)

instance I.ShortShow GetArchivedStories where
  shortShow
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

defaultGetArchivedStories :: GetArchivedStories
defaultGetArchivedStories =
  GetArchivedStories
    { from_story_id = Nothing
    , limit         = Nothing
    }

