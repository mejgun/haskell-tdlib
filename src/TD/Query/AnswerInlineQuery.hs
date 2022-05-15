{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerInlineQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.InputInlineQueryResult as InputInlineQueryResult
import qualified Utils as U

-- |
-- Sets the result of an inline query; for bots only
data AnswerInlineQuery = AnswerInlineQuery
  { -- | The parameter for the bot start message
    switch_pm_parameter :: Maybe String,
    -- | If non-empty, this text must be shown on the button that opens a private chat with the bot and sends a start message to the bot with the parameter switch_pm_parameter
    switch_pm_text :: Maybe String,
    -- | Offset for the next inline query; pass an empty string if there are no more results
    next_offset :: Maybe String,
    -- | Allowed time to cache the results of the query, in seconds
    cache_time :: Maybe Int,
    -- | The results of the query
    results :: Maybe [InputInlineQueryResult.InputInlineQueryResult],
    -- | Pass true if results may be cached and returned only for the user that sent the query. By default, results may be returned to any user who sends the same query
    is_personal :: Maybe Bool,
    -- | Identifier of the inline query
    inline_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerInlineQuery where
  show
    AnswerInlineQuery
      { switch_pm_parameter = switch_pm_parameter_,
        switch_pm_text = switch_pm_text_,
        next_offset = next_offset_,
        cache_time = cache_time_,
        results = results_,
        is_personal = is_personal_,
        inline_query_id = inline_query_id_
      } =
      "AnswerInlineQuery"
        ++ U.cc
          [ U.p "switch_pm_parameter" switch_pm_parameter_,
            U.p "switch_pm_text" switch_pm_text_,
            U.p "next_offset" next_offset_,
            U.p "cache_time" cache_time_,
            U.p "results" results_,
            U.p "is_personal" is_personal_,
            U.p "inline_query_id" inline_query_id_
          ]

instance T.ToJSON AnswerInlineQuery where
  toJSON
    AnswerInlineQuery
      { switch_pm_parameter = switch_pm_parameter_,
        switch_pm_text = switch_pm_text_,
        next_offset = next_offset_,
        cache_time = cache_time_,
        results = results_,
        is_personal = is_personal_,
        inline_query_id = inline_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerInlineQuery",
          "switch_pm_parameter" A..= switch_pm_parameter_,
          "switch_pm_text" A..= switch_pm_text_,
          "next_offset" A..= next_offset_,
          "cache_time" A..= cache_time_,
          "results" A..= results_,
          "is_personal" A..= is_personal_,
          "inline_query_id" A..= U.toS inline_query_id_
        ]
