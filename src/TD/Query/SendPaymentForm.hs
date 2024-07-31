module TD.Query.SendPaymentForm
  (SendPaymentForm(..)
  , defaultSendPaymentForm
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputInvoice as InputInvoice
import qualified Data.Text as T
import qualified TD.Data.InputCredentials as InputCredentials

-- | Sends a filled-out payment form to the bot for final verification. Returns 'TD.Data.PaymentResult.PaymentResult'
data SendPaymentForm
  = SendPaymentForm
    { input_invoice      :: Maybe InputInvoice.InputInvoice         -- ^ The invoice
    , payment_form_id    :: Maybe Int                               -- ^ Payment form identifier returned by getPaymentForm
    , order_info_id      :: Maybe T.Text                            -- ^ Identifier returned by validateOrderInfo, or an empty string
    , shipping_option_id :: Maybe T.Text                            -- ^ Identifier of a chosen shipping option, if applicable
    , credentials        :: Maybe InputCredentials.InputCredentials -- ^ The credentials chosen by user for payment; pass null for a payment in Telegram Stars
    , tip_amount         :: Maybe Int                               -- ^ Chosen by the user amount of tip in the smallest units of the currency
    }
  deriving (Eq, Show)

instance I.ShortShow SendPaymentForm where
  shortShow
    SendPaymentForm
      { input_invoice      = input_invoice_
      , payment_form_id    = payment_form_id_
      , order_info_id      = order_info_id_
      , shipping_option_id = shipping_option_id_
      , credentials        = credentials_
      , tip_amount         = tip_amount_
      }
        = "SendPaymentForm"
          ++ I.cc
          [ "input_invoice"      `I.p` input_invoice_
          , "payment_form_id"    `I.p` payment_form_id_
          , "order_info_id"      `I.p` order_info_id_
          , "shipping_option_id" `I.p` shipping_option_id_
          , "credentials"        `I.p` credentials_
          , "tip_amount"         `I.p` tip_amount_
          ]

instance AT.ToJSON SendPaymentForm where
  toJSON
    SendPaymentForm
      { input_invoice      = input_invoice_
      , payment_form_id    = payment_form_id_
      , order_info_id      = order_info_id_
      , shipping_option_id = shipping_option_id_
      , credentials        = credentials_
      , tip_amount         = tip_amount_
      }
        = A.object
          [ "@type"              A..= AT.String "sendPaymentForm"
          , "input_invoice"      A..= input_invoice_
          , "payment_form_id"    A..= fmap I.writeInt64  payment_form_id_
          , "order_info_id"      A..= order_info_id_
          , "shipping_option_id" A..= shipping_option_id_
          , "credentials"        A..= credentials_
          , "tip_amount"         A..= tip_amount_
          ]

defaultSendPaymentForm :: SendPaymentForm
defaultSendPaymentForm =
  SendPaymentForm
    { input_invoice      = Nothing
    , payment_form_id    = Nothing
    , order_info_id      = Nothing
    , shipping_option_id = Nothing
    , credentials        = Nothing
    , tip_amount         = Nothing
    }

