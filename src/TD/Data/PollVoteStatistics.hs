module TD.Data.PollVoteStatistics
  (PollVoteStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph

data PollVoteStatistics
  = PollVoteStatistics -- ^ A detailed statistics about poll votes
    { vote_graph :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing distribution of votes in the poll
    }
  deriving (Eq, Show)

instance I.ShortShow PollVoteStatistics where
  shortShow PollVoteStatistics
    { vote_graph = vote_graph_
    }
      = "PollVoteStatistics"
        ++ I.cc
        [ "vote_graph" `I.p` vote_graph_
        ]

instance AT.FromJSON PollVoteStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollVoteStatistics" -> parsePollVoteStatistics v
      _                    -> mempty
    
    where
      parsePollVoteStatistics :: A.Value -> AT.Parser PollVoteStatistics
      parsePollVoteStatistics = A.withObject "PollVoteStatistics" $ \o -> do
        vote_graph_ <- o A..:?  "vote_graph"
        pure $ PollVoteStatistics
          { vote_graph = vote_graph_
          }
  parseJSON _ = mempty

