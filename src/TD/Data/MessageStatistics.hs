{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.MessageStatistics where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified Utils as U

-- |
data MessageStatistics = -- | A detailed statistics about a message @message_interaction_graph A graph containing number of message views and shares
  MessageStatistics
  { -- |
    message_interaction_graph :: Maybe StatisticalGraph.StatisticalGraph
  }
  deriving (Eq)

instance Show MessageStatistics where
  show
    MessageStatistics
      { message_interaction_graph = message_interaction_graph_
      } =
      "MessageStatistics"
        ++ U.cc
          [ U.p "message_interaction_graph" message_interaction_graph_
          ]

instance T.FromJSON MessageStatistics where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "messageStatistics" -> parseMessageStatistics v
      _ -> mempty
    where
      parseMessageStatistics :: A.Value -> T.Parser MessageStatistics
      parseMessageStatistics = A.withObject "MessageStatistics" $ \o -> do
        message_interaction_graph_ <- o A..:? "message_interaction_graph"
        return $ MessageStatistics {message_interaction_graph = message_interaction_graph_}
  parseJSON _ = mempty

instance T.ToJSON MessageStatistics where
  toJSON
    MessageStatistics
      { message_interaction_graph = message_interaction_graph_
      } =
      A.object
        [ "@type" A..= T.String "messageStatistics",
          "message_interaction_graph" A..= message_interaction_graph_
        ]
