module TD.Data.ChatRevenueStatistics
  (ChatRevenueStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.ChatRevenueAmount as ChatRevenueAmount

data ChatRevenueStatistics
  = ChatRevenueStatistics -- ^ A detailed statistics about revenue earned from sponsored messages in a chat
    { revenue_by_hour_graph :: Maybe StatisticalGraph.StatisticalGraph   -- ^ A graph containing amount of revenue in a given hour
    , revenue_graph         :: Maybe StatisticalGraph.StatisticalGraph   -- ^ A graph containing amount of revenue
    , revenue_amount        :: Maybe ChatRevenueAmount.ChatRevenueAmount -- ^ Amount of earned revenue
    , usd_rate              :: Maybe Double                              -- ^ Current conversion rate of the cryptocurrency in which revenue is calculated to USD
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueStatistics where
  shortShow ChatRevenueStatistics
    { revenue_by_hour_graph = revenue_by_hour_graph_
    , revenue_graph         = revenue_graph_
    , revenue_amount        = revenue_amount_
    , usd_rate              = usd_rate_
    }
      = "ChatRevenueStatistics"
        ++ I.cc
        [ "revenue_by_hour_graph" `I.p` revenue_by_hour_graph_
        , "revenue_graph"         `I.p` revenue_graph_
        , "revenue_amount"        `I.p` revenue_amount_
        , "usd_rate"              `I.p` usd_rate_
        ]

instance AT.FromJSON ChatRevenueStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatRevenueStatistics" -> parseChatRevenueStatistics v
      _                       -> mempty
    
    where
      parseChatRevenueStatistics :: A.Value -> AT.Parser ChatRevenueStatistics
      parseChatRevenueStatistics = A.withObject "ChatRevenueStatistics" $ \o -> do
        revenue_by_hour_graph_ <- o A..:?  "revenue_by_hour_graph"
        revenue_graph_         <- o A..:?  "revenue_graph"
        revenue_amount_        <- o A..:?  "revenue_amount"
        usd_rate_              <- o A..:?  "usd_rate"
        pure $ ChatRevenueStatistics
          { revenue_by_hour_graph = revenue_by_hour_graph_
          , revenue_graph         = revenue_graph_
          , revenue_amount        = revenue_amount_
          , usd_rate              = usd_rate_
          }
  parseJSON _ = mempty

