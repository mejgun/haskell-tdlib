module TD.Data.ChatRevenueStatistics
  (ChatRevenueStatistics(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.StatisticalGraph as StatisticalGraph
import qualified Data.Text as T

data ChatRevenueStatistics
  = ChatRevenueStatistics -- ^ A detailed statistics about revenue earned from sponsored messages in a chat
    { revenue_by_hour_graph           :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing amount of revenue in a given hour
    , revenue_graph                   :: Maybe StatisticalGraph.StatisticalGraph -- ^ A graph containing amount of revenue
    , cryptocurrency                  :: Maybe T.Text                            -- ^ Cryptocurrency in which revenue is calculated
    , cryptocurrency_total_amount     :: Maybe Int                               -- ^ Total amount of the cryptocurrency earned, in the smallest units of the cryptocurrency
    , cryptocurrency_balance_amount   :: Maybe Int                               -- ^ Amount of the cryptocurrency that isn't withdrawn yet, in the smallest units of the cryptocurrency
    , cryptocurrency_available_amount :: Maybe Int                               -- ^ Amount of the cryptocurrency available for withdrawal, in the smallest units of the cryptocurrency
    , usd_rate                        :: Maybe Double                            -- ^ Current conversion rate of the cryptocurrency to USD
    }
  deriving (Eq, Show)

instance I.ShortShow ChatRevenueStatistics where
  shortShow ChatRevenueStatistics
    { revenue_by_hour_graph           = revenue_by_hour_graph_
    , revenue_graph                   = revenue_graph_
    , cryptocurrency                  = cryptocurrency_
    , cryptocurrency_total_amount     = cryptocurrency_total_amount_
    , cryptocurrency_balance_amount   = cryptocurrency_balance_amount_
    , cryptocurrency_available_amount = cryptocurrency_available_amount_
    , usd_rate                        = usd_rate_
    }
      = "ChatRevenueStatistics"
        ++ I.cc
        [ "revenue_by_hour_graph"           `I.p` revenue_by_hour_graph_
        , "revenue_graph"                   `I.p` revenue_graph_
        , "cryptocurrency"                  `I.p` cryptocurrency_
        , "cryptocurrency_total_amount"     `I.p` cryptocurrency_total_amount_
        , "cryptocurrency_balance_amount"   `I.p` cryptocurrency_balance_amount_
        , "cryptocurrency_available_amount" `I.p` cryptocurrency_available_amount_
        , "usd_rate"                        `I.p` usd_rate_
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
        revenue_by_hour_graph_           <- o A..:?                       "revenue_by_hour_graph"
        revenue_graph_                   <- o A..:?                       "revenue_graph"
        cryptocurrency_                  <- o A..:?                       "cryptocurrency"
        cryptocurrency_total_amount_     <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_total_amount"
        cryptocurrency_balance_amount_   <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_balance_amount"
        cryptocurrency_available_amount_ <- fmap I.readInt64 <$> o A..:?  "cryptocurrency_available_amount"
        usd_rate_                        <- o A..:?                       "usd_rate"
        pure $ ChatRevenueStatistics
          { revenue_by_hour_graph           = revenue_by_hour_graph_
          , revenue_graph                   = revenue_graph_
          , cryptocurrency                  = cryptocurrency_
          , cryptocurrency_total_amount     = cryptocurrency_total_amount_
          , cryptocurrency_balance_amount   = cryptocurrency_balance_amount_
          , cryptocurrency_available_amount = cryptocurrency_available_amount_
          , usd_rate                        = usd_rate_
          }
  parseJSON _ = mempty

