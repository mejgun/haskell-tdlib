module TD.Data.PaymentReceipt
  (PaymentReceipt(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ProductInfo as ProductInfo
import qualified TD.Data.PaymentReceiptType as PaymentReceiptType

data PaymentReceipt
  = PaymentReceipt -- ^ Contains information about a successful payment
    { product_info       :: Maybe ProductInfo.ProductInfo               -- ^ Information about the product
    , date               :: Maybe Int                                   -- ^ Point in time (Unix timestamp) when the payment was made
    , seller_bot_user_id :: Maybe Int                                   -- ^ User identifier of the seller bot
    , _type              :: Maybe PaymentReceiptType.PaymentReceiptType -- ^ Type of the payment receipt
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentReceipt where
  shortShow PaymentReceipt
    { product_info       = product_info_
    , date               = date_
    , seller_bot_user_id = seller_bot_user_id_
    , _type              = _type_
    }
      = "PaymentReceipt"
        ++ I.cc
        [ "product_info"       `I.p` product_info_
        , "date"               `I.p` date_
        , "seller_bot_user_id" `I.p` seller_bot_user_id_
        , "_type"              `I.p` _type_
        ]

instance AT.FromJSON PaymentReceipt where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentReceipt" -> parsePaymentReceipt v
      _                -> mempty
    
    where
      parsePaymentReceipt :: A.Value -> AT.Parser PaymentReceipt
      parsePaymentReceipt = A.withObject "PaymentReceipt" $ \o -> do
        product_info_       <- o A..:?  "product_info"
        date_               <- o A..:?  "date"
        seller_bot_user_id_ <- o A..:?  "seller_bot_user_id"
        _type_              <- o A..:?  "type"
        pure $ PaymentReceipt
          { product_info       = product_info_
          , date               = date_
          , seller_bot_user_id = seller_bot_user_id_
          , _type              = _type_
          }
  parseJSON _ = mempty

