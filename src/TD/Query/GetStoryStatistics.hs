module TD.Query.GetStoryStatistics
  (GetStoryStatistics(..)
  , defaultGetStoryStatistics
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns detailed statistics about a story. Can be used only if story.can_get_statistics == true. Returns 'TD.Data.StoryStatistics.StoryStatistics'
data GetStoryStatistics
  = GetStoryStatistics
    { chat_id  :: Maybe Int  -- ^ Chat identifier
    , story_id :: Maybe Int  -- ^ Story identifier
    , is_dark  :: Maybe Bool -- ^ Pass true if a dark theme is used by the application
    }
  deriving (Eq, Show)

instance I.ShortShow GetStoryStatistics where
  shortShow
    GetStoryStatistics
      { chat_id  = chat_id_
      , story_id = story_id_
      , is_dark  = is_dark_
      }
        = "GetStoryStatistics"
          ++ I.cc
          [ "chat_id"  `I.p` chat_id_
          , "story_id" `I.p` story_id_
          , "is_dark"  `I.p` is_dark_
          ]

instance AT.ToJSON GetStoryStatistics where
  toJSON
    GetStoryStatistics
      { chat_id  = chat_id_
      , story_id = story_id_
      , is_dark  = is_dark_
      }
        = A.object
          [ "@type"    A..= AT.String "getStoryStatistics"
          , "chat_id"  A..= chat_id_
          , "story_id" A..= story_id_
          , "is_dark"  A..= is_dark_
          ]

defaultGetStoryStatistics :: GetStoryStatistics
defaultGetStoryStatistics =
  GetStoryStatistics
    { chat_id  = Nothing
    , story_id = Nothing
    , is_dark  = Nothing
    }

