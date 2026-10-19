module TD.Data.GramRevenueStatistics
  (GramRevenueStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.GramRevenueStatus as GramRevenueStatus

data GramRevenueStatistics
  = GramRevenueStatistics -- ^ A detailed statistics about TON Grams earned by the current user
    { revenue_by_day_graph :: Maybe StatisticalGraph.StatisticalGraph   -- ^ A graph containing amount of revenue in a given day
    , status               :: Maybe GramRevenueStatus.GramRevenueStatus -- ^ Amount of earned revenue
    , usd_rate             :: Maybe Double                              -- ^ Current exchange rate of nanogram to USD cents
    }
  deriving (Eq, Show)

instance I.ShortShow GramRevenueStatistics where
  shortShow GramRevenueStatistics
    { revenue_by_day_graph = revenue_by_day_graph_
    , status               = status_
    , usd_rate             = usd_rate_
    }
      = "GramRevenueStatistics"
        ++ I.cc
        [ "revenue_by_day_graph" `I.p` revenue_by_day_graph_
        , "status"               `I.p` status_
        , "usd_rate"             `I.p` usd_rate_
        ]

instance AT.FromJSON GramRevenueStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "gramRevenueStatistics" -> parseGramRevenueStatistics v
      _                       -> mempty
    
    where
      parseGramRevenueStatistics :: A.Value -> AT.Parser GramRevenueStatistics
      parseGramRevenueStatistics = A.withObject "GramRevenueStatistics" $ \o -> do
        revenue_by_day_graph_ <- o A..:?  "revenue_by_day_graph"
        status_               <- o A..:?  "status"
        usd_rate_             <- o A..:?  "usd_rate"
        pure $ GramRevenueStatistics
          { revenue_by_day_graph = revenue_by_day_graph_
          , status               = status_
          , usd_rate             = usd_rate_
          }
  parseJSON _ = mempty

