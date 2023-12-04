module TD.Data.StoryViewers
  (StoryViewers(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryViewer as StoryViewer
import qualified Data.Text as T

data StoryViewers
  = StoryViewers -- ^ Represents a list of story viewers
    { total_count          :: Maybe Int                       -- ^ Approximate total number of story viewers found
    , total_reaction_count :: Maybe Int                       -- ^ Approximate total number of reactions set by found story viewers
    , viewers              :: Maybe [StoryViewer.StoryViewer] -- ^ List of story viewers
    , next_offset          :: Maybe T.Text                    -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StoryViewers where
  shortShow StoryViewers
    { total_count          = total_count_
    , total_reaction_count = total_reaction_count_
    , viewers              = viewers_
    , next_offset          = next_offset_
    }
      = "StoryViewers"
        ++ I.cc
        [ "total_count"          `I.p` total_count_
        , "total_reaction_count" `I.p` total_reaction_count_
        , "viewers"              `I.p` viewers_
        , "next_offset"          `I.p` next_offset_
        ]

instance AT.FromJSON StoryViewers where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyViewers" -> parseStoryViewers v
      _              -> mempty
    
    where
      parseStoryViewers :: A.Value -> AT.Parser StoryViewers
      parseStoryViewers = A.withObject "StoryViewers" $ \o -> do
        total_count_          <- o A..:?  "total_count"
        total_reaction_count_ <- o A..:?  "total_reaction_count"
        viewers_              <- o A..:?  "viewers"
        next_offset_          <- o A..:?  "next_offset"
        pure $ StoryViewers
          { total_count          = total_count_
          , total_reaction_count = total_reaction_count_
          , viewers              = viewers_
          , next_offset          = next_offset_
          }
  parseJSON _ = mempty

