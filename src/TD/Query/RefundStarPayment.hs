module TD.Query.RefundStarPayment
  (RefundStarPayment(..)
  , defaultRefundStarPayment
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Refunds a previously done payment in Telegram Stars; for bots only. Returns 'TD.Data.Ok.Ok'
data RefundStarPayment
  = RefundStarPayment
    { user_id                    :: Maybe Int    -- ^ Identifier of the user that did the payment
    , telegram_payment_charge_id :: Maybe T.Text -- ^ Telegram payment identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RefundStarPayment where
  shortShow
    RefundStarPayment
      { user_id                    = user_id_
      , telegram_payment_charge_id = telegram_payment_charge_id_
      }
        = "RefundStarPayment"
          ++ I.cc
          [ "user_id"                    `I.p` user_id_
          , "telegram_payment_charge_id" `I.p` telegram_payment_charge_id_
          ]

instance AT.ToJSON RefundStarPayment where
  toJSON
    RefundStarPayment
      { user_id                    = user_id_
      , telegram_payment_charge_id = telegram_payment_charge_id_
      }
        = A.object
          [ "@type"                      A..= AT.String "refundStarPayment"
          , "user_id"                    A..= user_id_
          , "telegram_payment_charge_id" A..= telegram_payment_charge_id_
          ]

defaultRefundStarPayment :: RefundStarPayment
defaultRefundStarPayment =
  RefundStarPayment
    { user_id                    = Nothing
    , telegram_payment_charge_id = Nothing
    }

