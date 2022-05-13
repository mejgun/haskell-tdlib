{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AnswerShippingQuery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ShippingOption as ShippingOption
import qualified Utils as U

-- |
-- Sets the result of a shipping query; for bots only @shipping_query_id Identifier of the shipping query @shipping_options Available shipping options @error_message An error message, empty on success
data AnswerShippingQuery = AnswerShippingQuery
  { -- |
    error_message :: Maybe String,
    -- |
    shipping_options :: Maybe [ShippingOption.ShippingOption],
    -- |
    shipping_query_id :: Maybe Int
  }
  deriving (Eq)

instance Show AnswerShippingQuery where
  show
    AnswerShippingQuery
      { error_message = error_message_,
        shipping_options = shipping_options_,
        shipping_query_id = shipping_query_id_
      } =
      "AnswerShippingQuery"
        ++ U.cc
          [ U.p "error_message" error_message_,
            U.p "shipping_options" shipping_options_,
            U.p "shipping_query_id" shipping_query_id_
          ]

instance T.ToJSON AnswerShippingQuery where
  toJSON
    AnswerShippingQuery
      { error_message = error_message_,
        shipping_options = shipping_options_,
        shipping_query_id = shipping_query_id_
      } =
      A.object
        [ "@type" A..= T.String "answerShippingQuery",
          "error_message" A..= error_message_,
          "shipping_options" A..= shipping_options_,
          "shipping_query_id" A..= shipping_query_id_
        ]
