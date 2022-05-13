{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a successful payment @chat_id Chat identifier of the PaymentSuccessful message @message_id Message identifier
data GetPaymentReceipt = GetPaymentReceipt
  { -- |
    message_id :: Maybe Int,
    -- |
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetPaymentReceipt where
  show
    GetPaymentReceipt
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      "GetPaymentReceipt"
        ++ U.cc
          [ U.p "message_id" message_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetPaymentReceipt where
  toJSON
    GetPaymentReceipt
      { message_id = message_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getPaymentReceipt",
          "message_id" A..= message_id_,
          "chat_id" A..= chat_id_
        ]
