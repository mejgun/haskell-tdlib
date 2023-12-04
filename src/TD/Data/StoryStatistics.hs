module TD.Data.StoryStatistics
  (StoryStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph

data StoryStatistics
  = StoryStatistics -- ^ A detailed statistics about a story
    { story_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing number of story views and shares
    , story_reaction_graph    :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing number of story reactions
    }
  deriving (Eq, Show)

instance I.ShortShow StoryStatistics where
  shortShow StoryStatistics
    { story_interaction_graph = story_interaction_graph_
    , story_reaction_graph    = story_reaction_graph_
    }
      = "StoryStatistics"
        ++ I.cc
        [ "story_interaction_graph" `I.p` story_interaction_graph_
        , "story_reaction_graph"    `I.p` story_reaction_graph_
        ]

instance AT.FromJSON StoryStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "storyStatistics" -> parseStoryStatistics v
      _                 -> mempty
    
    where
      parseStoryStatistics :: A.Value -> AT.Parser StoryStatistics
      parseStoryStatistics = A.withObject "StoryStatistics" $ \o -> do
        story_interaction_graph_ <- o A..:?  "story_interaction_graph"
        story_reaction_graph_    <- o A..:?  "story_reaction_graph"
        pure $ StoryStatistics
          { story_interaction_graph = story_interaction_graph_
          , story_reaction_graph    = story_reaction_graph_
          }
  parseJSON _ = mempty

