module TD.Data.PaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.PaymentProvider as PaymentProvider
import qualified TD.Data.PaymentOption as PaymentOption
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.SavedCredentials as SavedCredentials
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo

data PaymentForm
  = PaymentForm -- ^ Contains information about an invoice payment form
    { _id                        :: Maybe Int                                 -- ^ The payment form identifier
    , invoice                    :: Maybe Invoice.Invoice                     -- ^ Full information about the invoice
    , seller_bot_user_id         :: Maybe Int                                 -- ^ User identifier of the seller bot
    , payment_provider_user_id   :: Maybe Int                                 -- ^ User identifier of the payment provider bot
    , payment_provider           :: Maybe PaymentProvider.PaymentProvider     -- ^ Information about the payment provider
    , additional_payment_options :: Maybe [PaymentOption.PaymentOption]       -- ^ The list of additional payment options
    , saved_order_info           :: Maybe OrderInfo.OrderInfo                 -- ^ Saved server-side order information; may be null
    , saved_credentials          :: Maybe [SavedCredentials.SavedCredentials] -- ^ The list of saved payment credentials
    , can_save_credentials       :: Maybe Bool                                -- ^ True, if the user can choose to save credentials
    , need_password              :: Maybe Bool                                -- ^ True, if the user will be able to save credentials, if sets up a 2-step verification password
    , product_title              :: Maybe T.Text                              -- ^ Product title
    , product_description        :: Maybe FormattedText.FormattedText         -- ^ Product description
    , product_photo              :: Maybe Photo.Photo                         -- ^ Product photo; may be null
    }
  deriving (Eq)

instance Show PaymentForm where
  show PaymentForm
    { _id                        = _id_
    , invoice                    = invoice_
    , seller_bot_user_id         = seller_bot_user_id_
    , payment_provider_user_id   = payment_provider_user_id_
    , payment_provider           = payment_provider_
    , additional_payment_options = additional_payment_options_
    , saved_order_info           = saved_order_info_
    , saved_credentials          = saved_credentials_
    , can_save_credentials       = can_save_credentials_
    , need_password              = need_password_
    , product_title              = product_title_
    , product_description        = product_description_
    , product_photo              = product_photo_
    }
      = "PaymentForm"
        ++ I.cc
        [ "_id"                        `I.p` _id_
        , "invoice"                    `I.p` invoice_
        , "seller_bot_user_id"         `I.p` seller_bot_user_id_
        , "payment_provider_user_id"   `I.p` payment_provider_user_id_
        , "payment_provider"           `I.p` payment_provider_
        , "additional_payment_options" `I.p` additional_payment_options_
        , "saved_order_info"           `I.p` saved_order_info_
        , "saved_credentials"          `I.p` saved_credentials_
        , "can_save_credentials"       `I.p` can_save_credentials_
        , "need_password"              `I.p` need_password_
        , "product_title"              `I.p` product_title_
        , "product_description"        `I.p` product_description_
        , "product_photo"              `I.p` product_photo_
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
        _id_                        <- fmap I.readInt64 <$> o A..:?  "id"
        invoice_                    <- o A..:?                       "invoice"
        seller_bot_user_id_         <- o A..:?                       "seller_bot_user_id"
        payment_provider_user_id_   <- o A..:?                       "payment_provider_user_id"
        payment_provider_           <- o A..:?                       "payment_provider"
        additional_payment_options_ <- o A..:?                       "additional_payment_options"
        saved_order_info_           <- o A..:?                       "saved_order_info"
        saved_credentials_          <- o A..:?                       "saved_credentials"
        can_save_credentials_       <- o A..:?                       "can_save_credentials"
        need_password_              <- o A..:?                       "need_password"
        product_title_              <- o A..:?                       "product_title"
        product_description_        <- o A..:?                       "product_description"
        product_photo_              <- o A..:?                       "product_photo"
        pure $ PaymentForm
          { _id                        = _id_
          , invoice                    = invoice_
          , seller_bot_user_id         = seller_bot_user_id_
          , payment_provider_user_id   = payment_provider_user_id_
          , payment_provider           = payment_provider_
          , additional_payment_options = additional_payment_options_
          , saved_order_info           = saved_order_info_
          , saved_credentials          = saved_credentials_
          , can_save_credentials       = can_save_credentials_
          , need_password              = need_password_
          , product_title              = product_title_
          , product_description        = product_description_
          , product_photo              = product_photo_
          }

instance AT.ToJSON PaymentForm where
  toJSON PaymentForm
    { _id                        = _id_
    , invoice                    = invoice_
    , seller_bot_user_id         = seller_bot_user_id_
    , payment_provider_user_id   = payment_provider_user_id_
    , payment_provider           = payment_provider_
    , additional_payment_options = additional_payment_options_
    , saved_order_info           = saved_order_info_
    , saved_credentials          = saved_credentials_
    , can_save_credentials       = can_save_credentials_
    , need_password              = need_password_
    , product_title              = product_title_
    , product_description        = product_description_
    , product_photo              = product_photo_
    }
      = A.object
        [ "@type"                      A..= AT.String "paymentForm"
        , "id"                         A..= I.toS _id_
        , "invoice"                    A..= invoice_
        , "seller_bot_user_id"         A..= seller_bot_user_id_
        , "payment_provider_user_id"   A..= payment_provider_user_id_
        , "payment_provider"           A..= payment_provider_
        , "additional_payment_options" A..= additional_payment_options_
        , "saved_order_info"           A..= saved_order_info_
        , "saved_credentials"          A..= saved_credentials_
        , "can_save_credentials"       A..= can_save_credentials_
        , "need_password"              A..= need_password_
        , "product_title"              A..= product_title_
        , "product_description"        A..= product_description_
        , "product_photo"              A..= product_photo_
        ]
