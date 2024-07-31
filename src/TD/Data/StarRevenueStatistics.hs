module TD.Data.StarRevenueStatistics
  (StarRevenueStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.StarRevenueStatus as StarRevenueStatus

data StarRevenueStatistics
  = StarRevenueStatistics -- ^ A detailed statistics about Telegram Stars earned by a bot or a chat
    { revenue_by_day_graph :: Maybe StatisticalGraph.StatisticalGraph   -- ^ A graph containing amount of revenue in a given day
    , status               :: Maybe StarRevenueStatus.StarRevenueStatus -- ^ Telegram Star revenue status
    , usd_rate             :: Maybe Double                              -- ^ Current conversion rate of a Telegram Star to USD
    }
  deriving (Eq, Show)

instance I.ShortShow StarRevenueStatistics where
  shortShow StarRevenueStatistics
    { revenue_by_day_graph = revenue_by_day_graph_
    , status               = status_
    , usd_rate             = usd_rate_
    }
      = "StarRevenueStatistics"
        ++ I.cc
        [ "revenue_by_day_graph" `I.p` revenue_by_day_graph_
        , "status"               `I.p` status_
        , "usd_rate"             `I.p` usd_rate_
        ]

instance AT.FromJSON StarRevenueStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "starRevenueStatistics" -> parseStarRevenueStatistics v
      _                       -> mempty
    
    where
      parseStarRevenueStatistics :: A.Value -> AT.Parser StarRevenueStatistics
      parseStarRevenueStatistics = A.withObject "StarRevenueStatistics" $ \o -> do
        revenue_by_day_graph_ <- o A..:?  "revenue_by_day_graph"
        status_               <- o A..:?  "status"
        usd_rate_             <- o A..:?  "usd_rate"
        pure $ StarRevenueStatistics
          { revenue_by_day_graph = revenue_by_day_graph_
          , status               = status_
          , usd_rate             = usd_rate_
          }
  parseJSON _ = mempty

