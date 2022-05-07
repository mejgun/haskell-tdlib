{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Invoice as Invoice
import qualified TD.Reply.OrderInfo as OrderInfo
import qualified TD.Reply.PaymentsProviderStripe as PaymentsProviderStripe
import qualified TD.Reply.SavedCredentials as SavedCredentials
import qualified Utils as U

data PaymentForm = -- | Contains information about an invoice payment form
  PaymentForm
  { -- | True, if the user will be able to save credentials protected by a password they set up
    need_password :: Maybe Bool,
    -- | True, if the user can choose to save credentials
    can_save_credentials :: Maybe Bool,
    -- | Information about saved card credentials; may be null
    saved_credentials :: Maybe SavedCredentials.SavedCredentials,
    -- | Saved server-side order information; may be null
    saved_order_info :: Maybe OrderInfo.OrderInfo,
    -- | Information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
    payments_provider :: Maybe PaymentsProviderStripe.PaymentsProviderStripe,
    -- | User identifier of the payment provider bot
    payments_provider_user_id :: Maybe Int,
    -- | User identifier of the seller bot
    seller_bot_user_id :: Maybe Int,
    -- | Payment form URL
    url :: Maybe String,
    -- | Full information of the invoice
    invoice :: Maybe Invoice.Invoice,
    -- | The payment form identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show PaymentForm where
  show
    PaymentForm
      { need_password = need_password,
        can_save_credentials = can_save_credentials,
        saved_credentials = saved_credentials,
        saved_order_info = saved_order_info,
        payments_provider = payments_provider,
        payments_provider_user_id = payments_provider_user_id,
        seller_bot_user_id = seller_bot_user_id,
        url = url,
        invoice = invoice,
        _id = _id
      } =
      "PaymentForm"
        ++ U.cc
          [ U.p "need_password" need_password,
            U.p "can_save_credentials" can_save_credentials,
            U.p "saved_credentials" saved_credentials,
            U.p "saved_order_info" saved_order_info,
            U.p "payments_provider" payments_provider,
            U.p "payments_provider_user_id" payments_provider_user_id,
            U.p "seller_bot_user_id" seller_bot_user_id,
            U.p "url" url,
            U.p "invoice" invoice,
            U.p "_id" _id
          ]

instance T.FromJSON PaymentForm where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentForm" -> parsePaymentForm v
      _ -> fail ""
    where
      parsePaymentForm :: A.Value -> T.Parser PaymentForm
      parsePaymentForm = A.withObject "PaymentForm" $ \o -> do
        need_password_ <- o A..:? "need_password"
        can_save_credentials_ <- o A..:? "can_save_credentials"
        saved_credentials_ <- o A..:? "saved_credentials"
        saved_order_info_ <- o A..:? "saved_order_info"
        payments_provider_ <- o A..:? "payments_provider"
        payments_provider_user_id_ <- mconcat [o A..:? "payments_provider_user_id", U.rm <$> (o A..: "payments_provider_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        seller_bot_user_id_ <- mconcat [o A..:? "seller_bot_user_id", U.rm <$> (o A..: "seller_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        url_ <- o A..:? "url"
        invoice_ <- o A..:? "invoice"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ PaymentForm {need_password = need_password_, can_save_credentials = can_save_credentials_, saved_credentials = saved_credentials_, saved_order_info = saved_order_info_, payments_provider = payments_provider_, payments_provider_user_id = payments_provider_user_id_, seller_bot_user_id = seller_bot_user_id_, url = url_, invoice = invoice_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON PaymentForm where
  toJSON
    PaymentForm
      { need_password = need_password,
        can_save_credentials = can_save_credentials,
        saved_credentials = saved_credentials,
        saved_order_info = saved_order_info,
        payments_provider = payments_provider,
        payments_provider_user_id = payments_provider_user_id,
        seller_bot_user_id = seller_bot_user_id,
        url = url,
        invoice = invoice,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "paymentForm",
          "need_password" A..= need_password,
          "can_save_credentials" A..= can_save_credentials,
          "saved_credentials" A..= saved_credentials,
          "saved_order_info" A..= saved_order_info,
          "payments_provider" A..= payments_provider,
          "payments_provider_user_id" A..= payments_provider_user_id,
          "seller_bot_user_id" A..= seller_bot_user_id,
          "url" A..= url,
          "invoice" A..= invoice,
          "id" A..= _id
        ]
