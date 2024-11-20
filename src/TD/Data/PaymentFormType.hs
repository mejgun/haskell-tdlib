module TD.Data.PaymentFormType
  (PaymentFormType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.PaymentProvider as PaymentProvider
import qualified TD.Data.PaymentOption as PaymentOption
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.SavedCredentials as SavedCredentials
import qualified TD.Data.StarSubscriptionPricing as StarSubscriptionPricing

-- | Describes type of payment form
data PaymentFormType
  = PaymentFormTypeRegular -- ^ The payment form is for a regular payment
    { invoice                    :: Maybe Invoice.Invoice                     -- ^ Full information about the invoice
    , payment_provider_user_id   :: Maybe Int                                 -- ^ User identifier of the payment provider bot
    , payment_provider           :: Maybe PaymentProvider.PaymentProvider     -- ^ Information about the payment provider
    , additional_payment_options :: Maybe [PaymentOption.PaymentOption]       -- ^ The list of additional payment options
    , saved_order_info           :: Maybe OrderInfo.OrderInfo                 -- ^ Saved server-side order information; may be null
    , saved_credentials          :: Maybe [SavedCredentials.SavedCredentials] -- ^ The list of saved payment credentials
    , can_save_credentials       :: Maybe Bool                                -- ^ True, if the user can choose to save credentials
    , need_password              :: Maybe Bool                                -- ^ True, if the user will be able to save credentials, if sets up a 2-step verification password
    }
  | PaymentFormTypeStars -- ^ The payment form is for a payment in Telegram Stars
    { star_count :: Maybe Int -- ^ Number of Telegram Stars that will be paid
    }
  | PaymentFormTypeStarSubscription -- ^ The payment form is for a payment in Telegram Stars for subscription
    { pricing :: Maybe StarSubscriptionPricing.StarSubscriptionPricing -- ^ Information about subscription plan
    }
  deriving (Eq, Show)

instance I.ShortShow PaymentFormType where
  shortShow PaymentFormTypeRegular
    { invoice                    = invoice_
    , payment_provider_user_id   = payment_provider_user_id_
    , payment_provider           = payment_provider_
    , additional_payment_options = additional_payment_options_
    , saved_order_info           = saved_order_info_
    , saved_credentials          = saved_credentials_
    , can_save_credentials       = can_save_credentials_
    , need_password              = need_password_
    }
      = "PaymentFormTypeRegular"
        ++ I.cc
        [ "invoice"                    `I.p` invoice_
        , "payment_provider_user_id"   `I.p` payment_provider_user_id_
        , "payment_provider"           `I.p` payment_provider_
        , "additional_payment_options" `I.p` additional_payment_options_
        , "saved_order_info"           `I.p` saved_order_info_
        , "saved_credentials"          `I.p` saved_credentials_
        , "can_save_credentials"       `I.p` can_save_credentials_
        , "need_password"              `I.p` need_password_
        ]
  shortShow PaymentFormTypeStars
    { star_count = star_count_
    }
      = "PaymentFormTypeStars"
        ++ I.cc
        [ "star_count" `I.p` star_count_
        ]
  shortShow PaymentFormTypeStarSubscription
    { pricing = pricing_
    }
      = "PaymentFormTypeStarSubscription"
        ++ I.cc
        [ "pricing" `I.p` pricing_
        ]

instance AT.FromJSON PaymentFormType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "paymentFormTypeRegular"          -> parsePaymentFormTypeRegular v
      "paymentFormTypeStars"            -> parsePaymentFormTypeStars v
      "paymentFormTypeStarSubscription" -> parsePaymentFormTypeStarSubscription v
      _                                 -> mempty
    
    where
      parsePaymentFormTypeRegular :: A.Value -> AT.Parser PaymentFormType
      parsePaymentFormTypeRegular = A.withObject "PaymentFormTypeRegular" $ \o -> do
        invoice_                    <- o A..:?  "invoice"
        payment_provider_user_id_   <- o A..:?  "payment_provider_user_id"
        payment_provider_           <- o A..:?  "payment_provider"
        additional_payment_options_ <- o A..:?  "additional_payment_options"
        saved_order_info_           <- o A..:?  "saved_order_info"
        saved_credentials_          <- o A..:?  "saved_credentials"
        can_save_credentials_       <- o A..:?  "can_save_credentials"
        need_password_              <- o A..:?  "need_password"
        pure $ PaymentFormTypeRegular
          { invoice                    = invoice_
          , payment_provider_user_id   = payment_provider_user_id_
          , payment_provider           = payment_provider_
          , additional_payment_options = additional_payment_options_
          , saved_order_info           = saved_order_info_
          , saved_credentials          = saved_credentials_
          , can_save_credentials       = can_save_credentials_
          , need_password              = need_password_
          }
      parsePaymentFormTypeStars :: A.Value -> AT.Parser PaymentFormType
      parsePaymentFormTypeStars = A.withObject "PaymentFormTypeStars" $ \o -> do
        star_count_ <- o A..:?  "star_count"
        pure $ PaymentFormTypeStars
          { star_count = star_count_
          }
      parsePaymentFormTypeStarSubscription :: A.Value -> AT.Parser PaymentFormType
      parsePaymentFormTypeStarSubscription = A.withObject "PaymentFormTypeStarSubscription" $ \o -> do
        pricing_ <- o A..:?  "pricing"
        pure $ PaymentFormTypeStarSubscription
          { pricing = pricing_
          }
  parseJSON _ = mempty

