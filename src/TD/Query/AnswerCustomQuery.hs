{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerCustomQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Answers a custom query; for bots only @custom_query_id Identifier of a custom query @data JSON-serialized answer to the query
data AnswerCustomQuery = AnswerCustomQuery
  { -- |
    _data :: Maybe String,
    -- |
    custom_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerCustomQuery where
  show
    AnswerCustomQuery
      { _data = _data_,
        custom_query_id = custom_query_id_
      } =
      "AnswerCustomQuery"
        ++ U.cc
          [ U.p "_data" _data_,
            U.p "custom_query_id" custom_query_id_
          ]

instance T.ToJSON AnswerCustomQuery where
  toJSON
    AnswerCustomQuery
      { _data = _data_,
        custom_query_id = custom_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerCustomQuery",
          "data" A..= _data_,
          "custom_query_id" A..= U.toS custom_query_id_
        ]
