module TD.Data.StatisticalGraph
  (StatisticalGraph(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Describes a statistical graph
data StatisticalGraph
  = StatisticalGraphData -- ^ A graph data
    { json_data  :: Maybe T.Text -- ^ Graph data in JSON format
    , zoom_token :: Maybe T.Text -- ^ If non-empty, a token which can be used to receive a zoomed in graph
    }
  | StatisticalGraphAsync -- ^ The graph data to be asynchronously loaded through getStatisticalGraph
    { token :: Maybe T.Text -- ^ The token to use for data loading
    }
  | StatisticalGraphError -- ^ An error message to be shown to the user instead of the graph
    { error_message :: Maybe T.Text -- ^ The error message
    }
  deriving (Eq, Show)

instance I.ShortShow StatisticalGraph where
  shortShow StatisticalGraphData
    { json_data  = json_data_
    , zoom_token = zoom_token_
    }
      = "StatisticalGraphData"
        ++ I.cc
        [ "json_data"  `I.p` json_data_
        , "zoom_token" `I.p` zoom_token_
        ]
  shortShow StatisticalGraphAsync
    { token = token_
    }
      = "StatisticalGraphAsync"
        ++ I.cc
        [ "token" `I.p` token_
        ]
  shortShow StatisticalGraphError
    { error_message = error_message_
    }
      = "StatisticalGraphError"
        ++ I.cc
        [ "error_message" `I.p` error_message_
        ]

instance AT.FromJSON StatisticalGraph where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "statisticalGraphData"  -> parseStatisticalGraphData v
      "statisticalGraphAsync" -> parseStatisticalGraphAsync v
      "statisticalGraphError" -> parseStatisticalGraphError v
      _                       -> mempty
    
    where
      parseStatisticalGraphData :: A.Value -> AT.Parser StatisticalGraph
      parseStatisticalGraphData = A.withObject "StatisticalGraphData" $ \o -> do
        json_data_  <- o A..:?  "json_data"
        zoom_token_ <- o A..:?  "zoom_token"
        pure $ StatisticalGraphData
          { json_data  = json_data_
          , zoom_token = zoom_token_
          }
      parseStatisticalGraphAsync :: A.Value -> AT.Parser StatisticalGraph
      parseStatisticalGraphAsync = A.withObject "StatisticalGraphAsync" $ \o -> do
        token_ <- o A..:?  "token"
        pure $ StatisticalGraphAsync
          { token = token_
          }
      parseStatisticalGraphError :: A.Value -> AT.Parser StatisticalGraph
      parseStatisticalGraphError = A.withObject "StatisticalGraphError" $ \o -> do
        error_message_ <- o A..:?  "error_message"
        pure $ StatisticalGraphError
          { error_message = error_message_
          }
  parseJSON _ = mempty

