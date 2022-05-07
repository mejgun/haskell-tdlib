{-# LANGUAGE OverloadedStrings #-}

module TD.Query.AnswerPreCheckoutQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Sets the result of a pre-checkout query; for bots only @pre_checkout_query_id Identifier of the pre-checkout query @error_message An error message, empty on success
data AnswerPreCheckoutQuery = AnswerPreCheckoutQuery
  { -- |
    error_message :: Maybe String,
    -- |
    pre_checkout_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerPreCheckoutQuery where
  show
    AnswerPreCheckoutQuery
      { error_message = error_message,
        pre_checkout_query_id = pre_checkout_query_id
      } =
      "AnswerPreCheckoutQuery"
        ++ U.cc
          [ U.p "error_message" error_message,
            U.p "pre_checkout_query_id" pre_checkout_query_id
          ]

instance T.ToJSON AnswerPreCheckoutQuery where
  toJSON
    AnswerPreCheckoutQuery
      { error_message = error_message,
        pre_checkout_query_id = pre_checkout_query_id
      } =
      A.object
        [ "@type" A..= T.String "answerPreCheckoutQuery",
          "error_message" A..= error_message,
          "pre_checkout_query_id" A..= pre_checkout_query_id
        ]
