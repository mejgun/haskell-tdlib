module TD.Data.StoryInfo
  (StoryInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data StoryInfo
  = StoryInfo -- ^ Contains basic information about a story
    { story_id             :: Maybe Int  -- ^ Unique story identifier among stories of the given sender
    , date                 :: Maybe Int  -- ^ Point in time (Unix timestamp) when the story was published
    , is_for_close_friends :: Maybe Bool -- ^ True, if the story is available only to close friends
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInfo where
  shortShow StoryInfo
    { story_id             = story_id_
    , date                 = date_
    , is_for_close_friends = is_for_close_friends_
    }
      = "StoryInfo"
        ++ I.cc
        [ "story_id"             `I.p` story_id_
        , "date"                 `I.p` date_
        , "is_for_close_friends" `I.p` is_for_close_friends_
        ]

instance AT.FromJSON StoryInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyInfo" -> parseStoryInfo v
      _           -> mempty
    
    where
      parseStoryInfo :: A.Value -> AT.Parser StoryInfo
      parseStoryInfo = A.withObject "StoryInfo" $ \o -> do
        story_id_             <- o A..:?  "story_id"
        date_                 <- o A..:?  "date"
        is_for_close_friends_ <- o A..:?  "is_for_close_friends"
        pure $ StoryInfo
          { story_id             = story_id_
          , date                 = date_
          , is_for_close_friends = is_for_close_friends_
          }
  parseJSON _ = mempty

