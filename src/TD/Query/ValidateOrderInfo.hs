{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ValidateOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.OrderInfo as OrderInfo
import qualified Utils as U

-- |
-- Validates the order information provided by a user and returns the available shipping options for a flexible invoice
data ValidateOrderInfo = ValidateOrderInfo
  { -- | Pass true to save the order information
    allow_save :: Maybe Bool,
    -- | The order information, provided by the user; pass null if empty
    order_info :: Maybe OrderInfo.OrderInfo,
    -- | Message identifier
    message_id :: Maybe Int,
    -- | Chat identifier of the Invoice message
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show ValidateOrderInfo where
  show
    ValidateOrderInfo
      { allow_save = allow_save,
        order_info = order_info,
        message_id = message_id,
        chat_id = chat_id
      } =
      "ValidateOrderInfo"
        ++ U.cc
          [ U.p "allow_save" allow_save,
            U.p "order_info" order_info,
            U.p "message_id" message_id,
            U.p "chat_id" chat_id
          ]

instance T.ToJSON ValidateOrderInfo where
  toJSON
    ValidateOrderInfo
      { allow_save = allow_save,
        order_info = order_info,
        message_id = message_id,
        chat_id = chat_id
      } =
      A.object
        [ "@type" A..= T.String "validateOrderInfo",
          "allow_save" A..= allow_save,
          "order_info" A..= order_info,
          "message_id" A..= message_id,
          "chat_id" A..= chat_id
        ]
