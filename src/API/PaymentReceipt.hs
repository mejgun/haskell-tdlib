-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentReceipt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ShippingOption as ShippingOption
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.Invoice as Invoice
import {-# SOURCE #-} qualified API.Photo as Photo

-- |
-- 
-- Contains information about a successful payment
-- 
-- __title__ Product title
-- 
-- __param_description__ Product description
-- 
-- __photo__ Product photo; may be null
-- 
-- __date__ Point in time (Unix timestamp) when the payment was made
-- 
-- __seller_bot_user_id__ User identifier of the seller bot
-- 
-- __payments_provider_user_id__ User identifier of the payment provider bot
-- 
-- __invoice__ Contains information about the invoice
-- 
-- __order_info__ Order information; may be null
-- 
-- __shipping_option__ Chosen shipping option; may be null
-- 
-- __credentials_title__ Title of the saved credentials chosen by the buyer
-- 
-- __tip_amount__ The amount of tip chosen by the buyer in the smallest units of the currency
data PaymentReceipt = 

 PaymentReceipt { tip_amount :: Maybe Int, credentials_title :: Maybe String, shipping_option :: Maybe ShippingOption.ShippingOption, order_info :: Maybe OrderInfo.OrderInfo, invoice :: Maybe Invoice.Invoice, payments_provider_user_id :: Maybe Int, seller_bot_user_id :: Maybe Int, date :: Maybe Int, photo :: Maybe Photo.Photo, description :: Maybe String, title :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON PaymentReceipt where
 toJSON (PaymentReceipt { tip_amount = tip_amount, credentials_title = credentials_title, shipping_option = shipping_option, order_info = order_info, invoice = invoice, payments_provider_user_id = payments_provider_user_id, seller_bot_user_id = seller_bot_user_id, date = date, photo = photo, description = description, title = title }) =
  A.object [ "@type" A..= T.String "paymentReceipt", "tip_amount" A..= tip_amount, "credentials_title" A..= credentials_title, "shipping_option" A..= shipping_option, "order_info" A..= order_info, "invoice" A..= invoice, "payments_provider_user_id" A..= payments_provider_user_id, "seller_bot_user_id" A..= seller_bot_user_id, "date" A..= date, "photo" A..= photo, "description" A..= description, "title" A..= title ]

instance T.FromJSON PaymentReceipt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentReceipt" -> parsePaymentReceipt v
   _ -> mempty
  where
   parsePaymentReceipt :: A.Value -> T.Parser PaymentReceipt
   parsePaymentReceipt = A.withObject "PaymentReceipt" $ \o -> do
    tip_amount <- mconcat [ o A..:? "tip_amount", readMaybe <$> (o A..: "tip_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    credentials_title <- o A..:? "credentials_title"
    shipping_option <- o A..:? "shipping_option"
    order_info <- o A..:? "order_info"
    invoice <- o A..:? "invoice"
    payments_provider_user_id <- mconcat [ o A..:? "payments_provider_user_id", readMaybe <$> (o A..: "payments_provider_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    seller_bot_user_id <- mconcat [ o A..:? "seller_bot_user_id", readMaybe <$> (o A..: "seller_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo <- o A..:? "photo"
    description <- o A..:? "description"
    title <- o A..:? "title"
    return $ PaymentReceipt { tip_amount = tip_amount, credentials_title = credentials_title, shipping_option = shipping_option, order_info = order_info, invoice = invoice, payments_provider_user_id = payments_provider_user_id, seller_bot_user_id = seller_bot_user_id, date = date, photo = photo, description = description, title = title }