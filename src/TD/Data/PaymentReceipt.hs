module TD.Data.PaymentReceipt
  ( PaymentReceipt(..)    
  , defaultPaymentReceipt 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.OrderInfo as OrderInfo
import qualified TD.Data.ShippingOption as ShippingOption

data PaymentReceipt
  = PaymentReceipt -- ^ Contains information about a successful payment
    { title                    :: Maybe T.Text                        -- ^ Product title
    , description              :: Maybe FormattedText.FormattedText
    , photo                    :: Maybe Photo.Photo                   -- ^ Product photo; may be null
    , date                     :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the payment was made
    , seller_bot_user_id       :: Maybe Int                           -- ^ User identifier of the seller bot
    , payment_provider_user_id :: Maybe Int                           -- ^ User identifier of the payment provider bot
    , invoice                  :: Maybe Invoice.Invoice               -- ^ Information about the invoice
    , order_info               :: Maybe OrderInfo.OrderInfo           -- ^ Order information; may be null
    , shipping_option          :: Maybe ShippingOption.ShippingOption -- ^ Chosen shipping option; may be null
    , credentials_title        :: Maybe T.Text                        -- ^ Title of the saved credentials chosen by the buyer
    , tip_amount               :: Maybe Int                           -- ^ The amount of tip chosen by the buyer in the smallest units of the currency
    }
  deriving (Eq)

instance Show PaymentReceipt where
  show PaymentReceipt
    { title                    = title_
    , description              = description_
    , photo                    = photo_
    , date                     = date_
    , seller_bot_user_id       = seller_bot_user_id_
    , payment_provider_user_id = payment_provider_user_id_
    , invoice                  = invoice_
    , order_info               = order_info_
    , shipping_option          = shipping_option_
    , credentials_title        = credentials_title_
    , tip_amount               = tip_amount_
    }
      = "PaymentReceipt"
        ++ I.cc
        [ "title"                    `I.p` title_
        , "description"              `I.p` description_
        , "photo"                    `I.p` photo_
        , "date"                     `I.p` date_
        , "seller_bot_user_id"       `I.p` seller_bot_user_id_
        , "payment_provider_user_id" `I.p` payment_provider_user_id_
        , "invoice"                  `I.p` invoice_
        , "order_info"               `I.p` order_info_
        , "shipping_option"          `I.p` shipping_option_
        , "credentials_title"        `I.p` credentials_title_
        , "tip_amount"               `I.p` tip_amount_
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
        title_                    <- o A..:?  "title"
        description_              <- o A..:?  "description"
        photo_                    <- o A..:?  "photo"
        date_                     <- o A..:?  "date"
        seller_bot_user_id_       <- o A..:?  "seller_bot_user_id"
        payment_provider_user_id_ <- o A..:?  "payment_provider_user_id"
        invoice_                  <- o A..:?  "invoice"
        order_info_               <- o A..:?  "order_info"
        shipping_option_          <- o A..:?  "shipping_option"
        credentials_title_        <- o A..:?  "credentials_title"
        tip_amount_               <- o A..:?  "tip_amount"
        pure $ PaymentReceipt
          { title                    = title_
          , description              = description_
          , photo                    = photo_
          , date                     = date_
          , seller_bot_user_id       = seller_bot_user_id_
          , payment_provider_user_id = payment_provider_user_id_
          , invoice                  = invoice_
          , order_info               = order_info_
          , shipping_option          = shipping_option_
          , credentials_title        = credentials_title_
          , tip_amount               = tip_amount_
          }
  parseJSON _ = mempty

instance AT.ToJSON PaymentReceipt where
  toJSON PaymentReceipt
    { title                    = title_
    , description              = description_
    , photo                    = photo_
    , date                     = date_
    , seller_bot_user_id       = seller_bot_user_id_
    , payment_provider_user_id = payment_provider_user_id_
    , invoice                  = invoice_
    , order_info               = order_info_
    , shipping_option          = shipping_option_
    , credentials_title        = credentials_title_
    , tip_amount               = tip_amount_
    }
      = A.object
        [ "@type"                    A..= AT.String "paymentReceipt"
        , "title"                    A..= title_
        , "description"              A..= description_
        , "photo"                    A..= photo_
        , "date"                     A..= date_
        , "seller_bot_user_id"       A..= seller_bot_user_id_
        , "payment_provider_user_id" A..= payment_provider_user_id_
        , "invoice"                  A..= invoice_
        , "order_info"               A..= order_info_
        , "shipping_option"          A..= shipping_option_
        , "credentials_title"        A..= credentials_title_
        , "tip_amount"               A..= tip_amount_
        ]

defaultPaymentReceipt :: PaymentReceipt
defaultPaymentReceipt =
  PaymentReceipt
    { title                    = Nothing
    , description              = Nothing
    , photo                    = Nothing
    , date                     = Nothing
    , seller_bot_user_id       = Nothing
    , payment_provider_user_id = Nothing
    , invoice                  = Nothing
    , order_info               = Nothing
    , shipping_option          = Nothing
    , credentials_title        = Nothing
    , tip_amount               = Nothing
    }

