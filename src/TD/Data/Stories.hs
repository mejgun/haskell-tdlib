module TD.Data.Stories
  (Stories(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Story as Story

data Stories
  = Stories -- ^ Represents a list of stories
    { total_count      :: Maybe Int           -- ^ Approximate total number of stories found
    , stories          :: Maybe [Story.Story] -- ^ The list of stories
    , pinned_story_ids :: Maybe [Int]         -- ^ Identifiers of the pinned stories; returned only in getChatPostedToChatPageStories with from_story_id == 0
    }
  deriving (Eq, Show)

instance I.ShortShow Stories where
  shortShow Stories
    { total_count      = total_count_
    , stories          = stories_
    , pinned_story_ids = pinned_story_ids_
    }
      = "Stories"
        ++ I.cc
        [ "total_count"      `I.p` total_count_
        , "stories"          `I.p` stories_
        , "pinned_story_ids" `I.p` pinned_story_ids_
        ]

instance AT.FromJSON Stories where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "stories" -> parseStories v
      _         -> mempty
    
    where
      parseStories :: A.Value -> AT.Parser Stories
      parseStories = A.withObject "Stories" $ \o -> do
        total_count_      <- o A..:?  "total_count"
        stories_          <- o A..:?  "stories"
        pinned_story_ids_ <- o A..:?  "pinned_story_ids"
        pure $ Stories
          { total_count      = total_count_
          , stories          = stories_
          , pinned_story_ids = pinned_story_ids_
          }
  parseJSON _ = mempty

