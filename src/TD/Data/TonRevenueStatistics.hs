module TD.Data.TonRevenueStatistics
  (TonRevenueStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified TD.Data.TonRevenueStatus as TonRevenueStatus

data TonRevenueStatistics
  = TonRevenueStatistics -- ^ A detailed statistics about Toncoins earned by the current user
    { revenue_by_day_graph :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing amount of revenue in a given day
    , status               :: Maybe TonRevenueStatus.TonRevenueStatus -- ^ Amount of earned revenue
    , usd_rate             :: Maybe Double                            -- ^ Current conversion rate of nanotoncoin to USD cents
    }
  deriving (Eq, Show)

instance I.ShortShow TonRevenueStatistics where
  shortShow TonRevenueStatistics
    { revenue_by_day_graph = revenue_by_day_graph_
    , status               = status_
    , usd_rate             = usd_rate_
    }
      = "TonRevenueStatistics"
        ++ I.cc
        [ "revenue_by_day_graph" `I.p` revenue_by_day_graph_
        , "status"               `I.p` status_
        , "usd_rate"             `I.p` usd_rate_
        ]

instance AT.FromJSON TonRevenueStatistics where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonRevenueStatistics" -> parseTonRevenueStatistics v
      _                      -> mempty
    
    where
      parseTonRevenueStatistics :: A.Value -> AT.Parser TonRevenueStatistics
      parseTonRevenueStatistics = A.withObject "TonRevenueStatistics" $ \o -> do
        revenue_by_day_graph_ <- o A..:?  "revenue_by_day_graph"
        status_               <- o A..:?  "status"
        usd_rate_             <- o A..:?  "usd_rate"
        pure $ TonRevenueStatistics
          { revenue_by_day_graph = revenue_by_day_graph_
          , status               = status_
          , usd_rate             = usd_rate_
          }
  parseJSON _ = mempty

