{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerInlineQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InlineQueryResultsButton as InlineQueryResultsButton
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified Utils as U

-- |
-- Sets the result of an inline query; for bots only
data AnswerInlineQuery = AnswerInlineQuery
  { -- | Offset for the next inline query; pass an empty string if there are no more results
    next_offset :: Maybe String,
    -- | Allowed time to cache the results of the query, in seconds
    cache_time :: Maybe Int,
    -- | The results of the query
    results :: Maybe [InputInlineQueryResult.InputInlineQueryResult],
    -- | Button to be shown above inline query results; pass null if none
    button :: Maybe InlineQueryResultsButton.InlineQueryResultsButton,
    -- | Pass true if results may be cached and returned only for the user that sent the query. By default, results may be returned to any user who sends the same query
    is_personal :: Maybe Bool,
    -- | Identifier of the inline query
    inline_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerInlineQuery where
  show
    AnswerInlineQuery
      { next_offset = next_offset_,
        cache_time = cache_time_,
        results = results_,
        button = button_,
        is_personal = is_personal_,
        inline_query_id = inline_query_id_
      } =
      "AnswerInlineQuery"
        ++ U.cc
          [ U.p "next_offset" next_offset_,
            U.p "cache_time" cache_time_,
            U.p "results" results_,
            U.p "button" button_,
            U.p "is_personal" is_personal_,
            U.p "inline_query_id" inline_query_id_
          ]

instance T.ToJSON AnswerInlineQuery where
  toJSON
    AnswerInlineQuery
      { next_offset = next_offset_,
        cache_time = cache_time_,
        results = results_,
        button = button_,
        is_personal = is_personal_,
        inline_query_id = inline_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerInlineQuery",
          "next_offset" A..= next_offset_,
          "cache_time" A..= cache_time_,
          "results" A..= results_,
          "button" A..= button_,
          "is_personal" A..= is_personal_,
          "inline_query_id" A..= U.toS inline_query_id_
        ]
