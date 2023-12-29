module TD.Data.StoryInteractions
  (StoryInteractions(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StoryInteraction as StoryInteraction
import qualified Data.Text as T

data StoryInteractions
  = StoryInteractions -- ^ Represents a list of interactions with a story
    { total_count          :: Maybe Int                                 -- ^ Approximate total number of interactions found
    , total_forward_count  :: Maybe Int                                 -- ^ Approximate total number of found forwards and reposts; always 0 for chat stories
    , total_reaction_count :: Maybe Int                                 -- ^ Approximate total number of found reactions; always 0 for chat stories
    , interactions         :: Maybe [StoryInteraction.StoryInteraction] -- ^ List of story interactions
    , next_offset          :: Maybe T.Text                              -- ^ The offset for the next request. If empty, then there are no more results
    }
  deriving (Eq, Show)

instance I.ShortShow StoryInteractions where
  shortShow StoryInteractions
    { total_count          = total_count_
    , total_forward_count  = total_forward_count_
    , total_reaction_count = total_reaction_count_
    , interactions         = interactions_
    , next_offset          = next_offset_
    }
      = "StoryInteractions"
        ++ I.cc
        [ "total_count"          `I.p` total_count_
        , "total_forward_count"  `I.p` total_forward_count_
        , "total_reaction_count" `I.p` total_reaction_count_
        , "interactions"         `I.p` interactions_
        , "next_offset"          `I.p` next_offset_
        ]

instance AT.FromJSON StoryInteractions where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyInteractions" -> parseStoryInteractions v
      _                   -> mempty
    
    where
      parseStoryInteractions :: A.Value -> AT.Parser StoryInteractions
      parseStoryInteractions = A.withObject "StoryInteractions" $ \o -> do
        total_count_          <- o A..:?  "total_count"
        total_forward_count_  <- o A..:?  "total_forward_count"
        total_reaction_count_ <- o A..:?  "total_reaction_count"
        interactions_         <- o A..:?  "interactions"
        next_offset_          <- o A..:?  "next_offset"
        pure $ StoryInteractions
          { total_count          = total_count_
          , total_forward_count  = total_forward_count_
          , total_reaction_count = total_reaction_count_
          , interactions         = interactions_
          , next_offset          = next_offset_
          }
  parseJSON _ = mempty

