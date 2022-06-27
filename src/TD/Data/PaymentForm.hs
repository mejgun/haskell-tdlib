{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.PaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.PaymentProvider as PaymentProvider
import qualified TD.Data.Photo as Photo
import qualified TD.Data.SavedCredentials as SavedCredentials
import qualified Utils as U

-- |
data PaymentForm = -- | Contains information about an invoice payment form
  PaymentForm
  { -- | Product photo; may be null
    product_photo :: Maybe Photo.Photo,
    -- | Product description
    product_description :: Maybe FormattedText.FormattedText,
    -- | Product title
    product_title :: Maybe String,
    -- | True, if the user will be able to save credentials protected by a password they set up
    need_password :: Maybe Bool,
    -- | True, if the user can choose to save credentials
    can_save_credentials :: Maybe Bool,
    -- | Information about saved card credentials; may be null
    saved_credentials :: Maybe SavedCredentials.SavedCredentials,
    -- | Saved server-side order information; may be null
    saved_order_info :: Maybe OrderInfo.OrderInfo,
    -- | Information about the payment provider
    payment_provider :: Maybe PaymentProvider.PaymentProvider,
    -- | User identifier of the payment provider bot
    payment_provider_user_id :: Maybe Int,
    -- | User identifier of the seller bot
    seller_bot_user_id :: Maybe Int,
    -- | Full information about the invoice
    invoice :: Maybe Invoice.Invoice,
    -- | The payment form identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show PaymentForm where
  show
    PaymentForm
      { product_photo = product_photo_,
        product_description = product_description_,
        product_title = product_title_,
        need_password = need_password_,
        can_save_credentials = can_save_credentials_,
        saved_credentials = saved_credentials_,
        saved_order_info = saved_order_info_,
        payment_provider = payment_provider_,
        payment_provider_user_id = payment_provider_user_id_,
        seller_bot_user_id = seller_bot_user_id_,
        invoice = invoice_,
        _id = _id_
      } =
      "PaymentForm"
        ++ U.cc
          [ U.p "product_photo" product_photo_,
            U.p "product_description" product_description_,
            U.p "product_title" product_title_,
            U.p "need_password" need_password_,
            U.p "can_save_credentials" can_save_credentials_,
            U.p "saved_credentials" saved_credentials_,
            U.p "saved_order_info" saved_order_info_,
            U.p "payment_provider" payment_provider_,
            U.p "payment_provider_user_id" payment_provider_user_id_,
            U.p "seller_bot_user_id" seller_bot_user_id_,
            U.p "invoice" invoice_,
            U.p "_id" _id_
          ]

instance T.FromJSON PaymentForm where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentForm" -> parsePaymentForm v
      _ -> mempty
    where
      parsePaymentForm :: A.Value -> T.Parser PaymentForm
      parsePaymentForm = A.withObject "PaymentForm" $ \o -> do
        product_photo_ <- o A..:? "product_photo"
        product_description_ <- o A..:? "product_description"
        product_title_ <- o A..:? "product_title"
        need_password_ <- o A..:? "need_password"
        can_save_credentials_ <- o A..:? "can_save_credentials"
        saved_credentials_ <- o A..:? "saved_credentials"
        saved_order_info_ <- o A..:? "saved_order_info"
        payment_provider_ <- o A..:? "payment_provider"
        payment_provider_user_id_ <- o A..:? "payment_provider_user_id"
        seller_bot_user_id_ <- o A..:? "seller_bot_user_id"
        invoice_ <- o A..:? "invoice"
        _id_ <- U.rm <$> (o A..:? "id" :: T.Parser (Maybe String)) :: T.Parser (Maybe Int)
        return $ PaymentForm {product_photo = product_photo_, product_description = product_description_, product_title = product_title_, need_password = need_password_, can_save_credentials = can_save_credentials_, saved_credentials = saved_credentials_, saved_order_info = saved_order_info_, payment_provider = payment_provider_, payment_provider_user_id = payment_provider_user_id_, seller_bot_user_id = seller_bot_user_id_, invoice = invoice_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON PaymentForm where
  toJSON
    PaymentForm
      { product_photo = product_photo_,
        product_description = product_description_,
        product_title = product_title_,
        need_password = need_password_,
        can_save_credentials = can_save_credentials_,
        saved_credentials = saved_credentials_,
        saved_order_info = saved_order_info_,
        payment_provider = payment_provider_,
        payment_provider_user_id = payment_provider_user_id_,
        seller_bot_user_id = seller_bot_user_id_,
        invoice = invoice_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "paymentForm",
          "product_photo" A..= product_photo_,
          "product_description" A..= product_description_,
          "product_title" A..= product_title_,
          "need_password" A..= need_password_,
          "can_save_credentials" A..= can_save_credentials_,
          "saved_credentials" A..= saved_credentials_,
          "saved_order_info" A..= saved_order_info_,
          "payment_provider" A..= payment_provider_,
          "payment_provider_user_id" A..= payment_provider_user_id_,
          "seller_bot_user_id" A..= seller_bot_user_id_,
          "invoice" A..= invoice_,
          "id" A..= U.toS _id_
        ]
