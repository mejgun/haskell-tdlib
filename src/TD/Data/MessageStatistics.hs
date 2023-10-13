module TD.Data.MessageStatistics (MessageStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph

data MessageStatistics
  = MessageStatistics -- ^ A detailed statistics about a message
    { message_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing number of message views and shares
    }
  deriving (Eq)

instance Show MessageStatistics where
  show MessageStatistics
    { message_interaction_graph = message_interaction_graph_
    }
      = "MessageStatistics"
        ++ I.cc
        [ "message_interaction_graph" `I.p` message_interaction_graph_
        ]

instance AT.FromJSON MessageStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageStatistics" -> parseMessageStatistics v
      _                   -> mempty
    
    where
      parseMessageStatistics :: A.Value -> AT.Parser MessageStatistics
      parseMessageStatistics = A.withObject "MessageStatistics" $ \o -> do
        message_interaction_graph_ <- o A..:?  "message_interaction_graph"
        pure $ MessageStatistics
          { message_interaction_graph = message_interaction_graph_
          }
  parseJSON _ = mempty

instance AT.ToJSON MessageStatistics where
  toJSON MessageStatistics
    { message_interaction_graph = message_interaction_graph_
    }
      = A.object
        [ "@type"                     A..= AT.String "messageStatistics"
        , "message_interaction_graph" A..= message_interaction_graph_
        ]
