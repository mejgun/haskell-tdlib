{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetStatisticalGraph where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Loads an asynchronous or a zoomed in statistical graph @chat_id Chat identifier @token The token for graph loading @x X-value for zoomed in graph or 0 otherwise
data GetStatisticalGraph = GetStatisticalGraph
  { -- |
    x :: Maybe Int,
    -- |
    token :: Maybe String,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetStatisticalGraph where
  show
    GetStatisticalGraph
      { x = x_,
        token = token_,
        chat_id = chat_id_
      } =
      "GetStatisticalGraph"
        ++ U.cc
          [ U.p "x" x_,
            U.p "token" token_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetStatisticalGraph where
  toJSON
    GetStatisticalGraph
      { x = x_,
        token = token_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getStatisticalGraph",
          "x" A..= x_,
          "token" A..= token_,
          "chat_id" A..= chat_id_
        ]
