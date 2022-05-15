{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerCallbackQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the result of a callback query; for bots only @callback_query_id Identifier of the callback query @text Text of the answer @show_alert Pass true to show an alert to the user instead of a toast notification @url URL to be opened @cache_time Time during which the result of the query can be cached, in seconds
data AnswerCallbackQuery = AnswerCallbackQuery
  { -- |
    cache_time :: Maybe Int,
    -- |
    url :: Maybe String,
    -- |
    show_alert :: Maybe Bool,
    -- |
    text :: Maybe String,
    -- |
    callback_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerCallbackQuery where
  show
    AnswerCallbackQuery
      { cache_time = cache_time_,
        url = url_,
        show_alert = show_alert_,
        text = text_,
        callback_query_id = callback_query_id_
      } =
      "AnswerCallbackQuery"
        ++ U.cc
          [ U.p "cache_time" cache_time_,
            U.p "url" url_,
            U.p "show_alert" show_alert_,
            U.p "text" text_,
            U.p "callback_query_id" callback_query_id_
          ]

instance T.ToJSON AnswerCallbackQuery where
  toJSON
    AnswerCallbackQuery
      { cache_time = cache_time_,
        url = url_,
        show_alert = show_alert_,
        text = text_,
        callback_query_id = callback_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerCallbackQuery",
          "cache_time" A..= cache_time_,
          "url" A..= url_,
          "show_alert" A..= show_alert_,
          "text" A..= text_,
          "callback_query_id" A..= U.toS callback_query_id_
        ]
