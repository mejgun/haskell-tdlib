{-# LANGUAGE OverloadedStrings #-}

-- |
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
      { allow_save = allow_save_,
        order_info = order_info_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      "ValidateOrderInfo"
        ++ U.cc
          [ U.p "allow_save" allow_save_,
            U.p "order_info" order_info_,
            U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON ValidateOrderInfo where
  toJSON
    ValidateOrderInfo
      { allow_save = allow_save_,
        order_info = order_info_,
        message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "validateOrderInfo",
          "allow_save" A..= allow_save_,
          "order_info" A..= order_info_,
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]