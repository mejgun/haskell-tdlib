module TD.Data.PaymentForm
  (PaymentForm(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PaymentFormType as PaymentFormType
import qualified TD.Data.ProductInfo as ProductInfo

data PaymentForm
  = PaymentForm -- ^ Contains information about an invoice payment form
    { _id                :: Maybe Int                             -- ^ The payment form identifier
    , _type              :: Maybe PaymentFormType.PaymentFormType -- ^ Type of the payment form
    , seller_bot_user_id :: Maybe Int                             -- ^ User identifier of the seller bot
    , product_info       :: Maybe ProductInfo.ProductInfo         -- ^ Information about the product
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentForm where
  shortShow PaymentForm
    { _id                = _id_
    , _type              = _type_
    , seller_bot_user_id = seller_bot_user_id_
    , product_info       = product_info_
    }
      = "PaymentForm"
        ++ I.cc
        [ "_id"                `I.p` _id_
        , "_type"              `I.p` _type_
        , "seller_bot_user_id" `I.p` seller_bot_user_id_
        , "product_info"       `I.p` product_info_
        ]

instance AT.FromJSON PaymentForm where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentForm" -> parsePaymentForm v
      _             -> mempty
    
    where
      parsePaymentForm :: A.Value -> AT.Parser PaymentForm
      parsePaymentForm = A.withObject "PaymentForm" $ \o -> do
        _id_                <- fmap I.readInt64 <$> o A..:?  "id"
        _type_              <- o A..:?                       "type"
        seller_bot_user_id_ <- o A..:?                       "seller_bot_user_id"
        product_info_       <- o A..:?                       "product_info"
        pure $ PaymentForm
          { _id                = _id_
          , _type              = _type_
          , seller_bot_user_id = seller_bot_user_id_
          , product_info       = product_info_
          }
  parseJSON _ = mempty

