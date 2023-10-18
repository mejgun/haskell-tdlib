module TD.Query.GetPaymentReceipt
  (GetPaymentReceipt(..)
  , defaultGetPaymentReceipt
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns information about a successful payment. Returns 'TD.Data.PaymentReceipt.PaymentReceipt'
data GetPaymentReceipt
  = GetPaymentReceipt
    { chat_id    :: Maybe Int -- ^ Chat identifier of the messagePaymentSuccessful message
    , message_id :: Maybe Int -- ^ Message identifier
    }
  deriving (Eq, Show)

instance I.ShortShow GetPaymentReceipt where
  shortShow
    GetPaymentReceipt
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = "GetPaymentReceipt"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "message_id" `I.p` message_id_
          ]

instance AT.ToJSON GetPaymentReceipt where
  toJSON
    GetPaymentReceipt
      { chat_id    = chat_id_
      , message_id = message_id_
      }
        = A.object
          [ "@type"      A..= AT.String "getPaymentReceipt"
          , "chat_id"    A..= chat_id_
          , "message_id" A..= message_id_
          ]

defaultGetPaymentReceipt :: GetPaymentReceipt
defaultGetPaymentReceipt =
  GetPaymentReceipt
    { chat_id    = Nothing
    , message_id = Nothing
    }

