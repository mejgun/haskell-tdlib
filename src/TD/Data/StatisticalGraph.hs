{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.StatisticalGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- | Describes a statistical graph
data StatisticalGraph
  = -- | A graph data @json_data Graph data in JSON format @zoom_token If non-empty, a token which can be used to receive a zoomed in graph
    StatisticalGraphData
      { -- |
        zoom_token :: Maybe String,
        -- |
        json_data :: Maybe String
      }
  | -- | The graph data to be asynchronously loaded through getStatisticalGraph @token The token to use for data loading
    StatisticalGraphAsync
      { -- |
        token :: Maybe String
      }
  | -- | An error message to be shown to the user instead of the graph @error_message The error message
    StatisticalGraphError
      { -- |
        error_message :: Maybe String
      }
  deriving (Eq)

instance Show StatisticalGraph where
  show
    StatisticalGraphData
      { zoom_token = zoom_token_,
        json_data = json_data_
      } =
      "StatisticalGraphData"
        ++ U.cc
          [ U.p "zoom_token" zoom_token_,
            U.p "json_data" json_data_
          ]
  show
    StatisticalGraphAsync
      { token = token_
      } =
      "StatisticalGraphAsync"
        ++ U.cc
          [ U.p "token" token_
          ]
  show
    StatisticalGraphError
      { error_message = error_message_
      } =
      "StatisticalGraphError"
        ++ U.cc
          [ U.p "error_message" error_message_
          ]

instance T.FromJSON StatisticalGraph where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "statisticalGraphData" -> parseStatisticalGraphData v
      "statisticalGraphAsync" -> parseStatisticalGraphAsync v
      "statisticalGraphError" -> parseStatisticalGraphError v
      _ -> mempty
    where
      parseStatisticalGraphData :: A.Value -> T.Parser StatisticalGraph
      parseStatisticalGraphData = A.withObject "StatisticalGraphData" $ \o -> do
        zoom_token_ <- o A..:? "zoom_token"
        json_data_ <- o A..:? "json_data"
        return $ StatisticalGraphData {zoom_token = zoom_token_, json_data = json_data_}

      parseStatisticalGraphAsync :: A.Value -> T.Parser StatisticalGraph
      parseStatisticalGraphAsync = A.withObject "StatisticalGraphAsync" $ \o -> do
        token_ <- o A..:? "token"
        return $ StatisticalGraphAsync {token = token_}

      parseStatisticalGraphError :: A.Value -> T.Parser StatisticalGraph
      parseStatisticalGraphError = A.withObject "StatisticalGraphError" $ \o -> do
        error_message_ <- o A..:? "error_message"
        return $ StatisticalGraphError {error_message = error_message_}
  parseJSON _ = mempty

instance T.ToJSON StatisticalGraph where
  toJSON
    StatisticalGraphData
      { zoom_token = zoom_token_,
        json_data = json_data_
      } =
      A.object
        [ "@type" A..= T.String "statisticalGraphData",
          "zoom_token" A..= zoom_token_,
          "json_data" A..= json_data_
        ]
  toJSON
    StatisticalGraphAsync
      { token = token_
      } =
      A.object
        [ "@type" A..= T.String "statisticalGraphAsync",
          "token" A..= token_
        ]
  toJSON
    StatisticalGraphError
      { error_message = error_message_
      } =
      A.object
        [ "@type" A..= T.String "statisticalGraphError",
          "error_message" A..= error_message_
        ]
