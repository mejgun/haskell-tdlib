{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.PaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.Invoice as Invoice
import qualified TD.Reply.OrderInfo as OrderInfo
import qualified TD.Reply.Photo as Photo
import qualified TD.Reply.ShippingOption as ShippingOption
import qualified Utils as U

data PaymentReceipt = -- | Contains information about a successful payment
  PaymentReceipt
  { -- | The amount of tip chosen by the buyer in the smallest units of the currency
    tip_amount :: Maybe Int,
    -- | Title of the saved credentials chosen by the buyer
    credentials_title :: Maybe String,
    -- | Chosen shipping option; may be null
    shipping_option :: Maybe ShippingOption.ShippingOption,
    -- | Order information; may be null
    order_info :: Maybe OrderInfo.OrderInfo,
    -- | Information about the invoice
    invoice :: Maybe Invoice.Invoice,
    -- | User identifier of the payment provider bot
    payments_provider_user_id :: Maybe Int,
    -- | User identifier of the seller bot
    seller_bot_user_id :: Maybe Int,
    -- | Point in time (Unix timestamp) when the payment was made
    date :: Maybe Int,
    -- | Product photo; may be null
    photo :: Maybe Photo.Photo,
    -- |
    description :: Maybe String,
    -- | Product title
    title :: Maybe String
  }
  deriving (Eq)

instance Show PaymentReceipt where
  show
    PaymentReceipt
      { tip_amount = tip_amount,
        credentials_title = credentials_title,
        shipping_option = shipping_option,
        order_info = order_info,
        invoice = invoice,
        payments_provider_user_id = payments_provider_user_id,
        seller_bot_user_id = seller_bot_user_id,
        date = date,
        photo = photo,
        description = description,
        title = title
      } =
      "PaymentReceipt"
        ++ U.cc
          [ U.p "tip_amount" tip_amount,
            U.p "credentials_title" credentials_title,
            U.p "shipping_option" shipping_option,
            U.p "order_info" order_info,
            U.p "invoice" invoice,
            U.p "payments_provider_user_id" payments_provider_user_id,
            U.p "seller_bot_user_id" seller_bot_user_id,
            U.p "date" date,
            U.p "photo" photo,
            U.p "description" description,
            U.p "title" title
          ]

instance T.FromJSON PaymentReceipt where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "paymentReceipt" -> parsePaymentReceipt v
      _ -> fail ""
    where
      parsePaymentReceipt :: A.Value -> T.Parser PaymentReceipt
      parsePaymentReceipt = A.withObject "PaymentReceipt" $ \o -> do
        tip_amount_ <- mconcat [o A..:? "tip_amount", U.rm <$> (o A..: "tip_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
        credentials_title_ <- o A..:? "credentials_title"
        shipping_option_ <- o A..:? "shipping_option"
        order_info_ <- o A..:? "order_info"
        invoice_ <- o A..:? "invoice"
        payments_provider_user_id_ <- mconcat [o A..:? "payments_provider_user_id", U.rm <$> (o A..: "payments_provider_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        seller_bot_user_id_ <- mconcat [o A..:? "seller_bot_user_id", U.rm <$> (o A..: "seller_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        date_ <- mconcat [o A..:? "date", U.rm <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
        photo_ <- o A..:? "photo"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        return $ PaymentReceipt {tip_amount = tip_amount_, credentials_title = credentials_title_, shipping_option = shipping_option_, order_info = order_info_, invoice = invoice_, payments_provider_user_id = payments_provider_user_id_, seller_bot_user_id = seller_bot_user_id_, date = date_, photo = photo_, description = description_, title = title_}
  parseJSON _ = fail ""

instance T.ToJSON PaymentReceipt where
  toJSON
    PaymentReceipt
      { tip_amount = tip_amount,
        credentials_title = credentials_title,
        shipping_option = shipping_option,
        order_info = order_info,
        invoice = invoice,
        payments_provider_user_id = payments_provider_user_id,
        seller_bot_user_id = seller_bot_user_id,
        date = date,
        photo = photo,
        description = description,
        title = title
      } =
      A.object
        [ "@type" A..= T.String "paymentReceipt",
          "tip_amount" A..= tip_amount,
          "credentials_title" A..= credentials_title,
          "shipping_option" A..= shipping_option,
          "order_info" A..= order_info,
          "invoice" A..= invoice,
          "payments_provider_user_id" A..= payments_provider_user_id,
          "seller_bot_user_id" A..= seller_bot_user_id,
          "date" A..= date,
          "photo" A..= photo,
          "description" A..= description,
          "title" A..= title
        ]
