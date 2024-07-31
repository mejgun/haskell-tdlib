module TD.Data.PaymentReceiptType
  (PaymentReceiptType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.ShippingOption as ShippingOption
import qualified Data.Text as T

-- | Describes type of successful payment
data PaymentReceiptType
  = PaymentReceiptTypeRegular -- ^ The payment was done using a third-party payment provider
    { payment_provider_user_id :: Maybe Int                           -- ^ User identifier of the payment provider bot
    , invoice                  :: Maybe Invoice.Invoice               -- ^ Information about the invoice
    , order_info               :: Maybe OrderInfo.OrderInfo           -- ^ Order information; may be null
    , shipping_option          :: Maybe ShippingOption.ShippingOption -- ^ Chosen shipping option; may be null
    , credentials_title        :: Maybe T.Text                        -- ^ Title of the saved credentials chosen by the buyer
    , tip_amount               :: Maybe Int                           -- ^ The amount of tip chosen by the buyer in the smallest units of the currency
    }
  | PaymentReceiptTypeStars -- ^ The payment was done using Telegram Stars
    { star_count     :: Maybe Int    -- ^ Number of Telegram Stars that were paid
    , transaction_id :: Maybe T.Text -- ^ Unique identifier of the transaction that can be used to dispute it
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentReceiptType where
  shortShow PaymentReceiptTypeRegular
    { payment_provider_user_id = payment_provider_user_id_
    , invoice                  = invoice_
    , order_info               = order_info_
    , shipping_option          = shipping_option_
    , credentials_title        = credentials_title_
    , tip_amount               = tip_amount_
    }
      = "PaymentReceiptTypeRegular"
        ++ I.cc
        [ "payment_provider_user_id" `I.p` payment_provider_user_id_
        , "invoice"                  `I.p` invoice_
        , "order_info"               `I.p` order_info_
        , "shipping_option"          `I.p` shipping_option_
        , "credentials_title"        `I.p` credentials_title_
        , "tip_amount"               `I.p` tip_amount_
        ]
  shortShow PaymentReceiptTypeStars
    { star_count     = star_count_
    , transaction_id = transaction_id_
    }
      = "PaymentReceiptTypeStars"
        ++ I.cc
        [ "star_count"     `I.p` star_count_
        , "transaction_id" `I.p` transaction_id_
        ]

instance AT.FromJSON PaymentReceiptType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentReceiptTypeRegular" -> parsePaymentReceiptTypeRegular v
      "paymentReceiptTypeStars"   -> parsePaymentReceiptTypeStars v
      _                           -> mempty
    
    where
      parsePaymentReceiptTypeRegular :: A.Value -> AT.Parser PaymentReceiptType
      parsePaymentReceiptTypeRegular = A.withObject "PaymentReceiptTypeRegular" $ \o -> do
        payment_provider_user_id_ <- o A..:?  "payment_provider_user_id"
        invoice_                  <- o A..:?  "invoice"
        order_info_               <- o A..:?  "order_info"
        shipping_option_          <- o A..:?  "shipping_option"
        credentials_title_        <- o A..:?  "credentials_title"
        tip_amount_               <- o A..:?  "tip_amount"
        pure $ PaymentReceiptTypeRegular
          { payment_provider_user_id = payment_provider_user_id_
          , invoice                  = invoice_
          , order_info               = order_info_
          , shipping_option          = shipping_option_
          , credentials_title        = credentials_title_
          , tip_amount               = tip_amount_
          }
      parsePaymentReceiptTypeStars :: A.Value -> AT.Parser PaymentReceiptType
      parsePaymentReceiptTypeStars = A.withObject "PaymentReceiptTypeStars" $ \o -> do
        star_count_     <- o A..:?  "star_count"
        transaction_id_ <- o A..:?  "transaction_id"
        pure $ PaymentReceiptTypeStars
          { star_count     = star_count_
          , transaction_id = transaction_id_
          }
  parseJSON _ = mempty

