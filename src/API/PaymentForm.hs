-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.PaymentForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.SavedCredentials as SavedCredentials
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo
import {-# SOURCE #-} qualified API.PaymentsProviderStripe as PaymentsProviderStripe
import {-# SOURCE #-} qualified API.Invoice as Invoice

-- |
-- 
-- Contains information about an invoice payment form
-- 
-- __id__ The payment form identifier
-- 
-- __invoice__ Full information of the invoice
-- 
-- __url__ Payment form URL
-- 
-- __seller_bot_user_id__ User identifier of the seller bot
-- 
-- __payments_provider_user_id__ User identifier of the payment provider bot
-- 
-- __payments_provider__ Contains information about the payment provider, if available, to support it natively without the need for opening the URL; may be null
-- 
-- __saved_order_info__ Saved server-side order information; may be null
-- 
-- __saved_credentials__ Contains information about saved card credentials; may be null
-- 
-- __can_save_credentials__ True, if the user can choose to save credentials
-- 
-- __need_password__ True, if the user will be able to save credentials protected by a password they set up
data PaymentForm = 

 PaymentForm { need_password :: Maybe Bool, can_save_credentials :: Maybe Bool, saved_credentials :: Maybe SavedCredentials.SavedCredentials, saved_order_info :: Maybe OrderInfo.OrderInfo, payments_provider :: Maybe PaymentsProviderStripe.PaymentsProviderStripe, payments_provider_user_id :: Maybe Int, seller_bot_user_id :: Maybe Int, url :: Maybe String, invoice :: Maybe Invoice.Invoice, _id :: Maybe Int }  deriving (Eq)

instance Show PaymentForm where
 show PaymentForm { need_password=need_password, can_save_credentials=can_save_credentials, saved_credentials=saved_credentials, saved_order_info=saved_order_info, payments_provider=payments_provider, payments_provider_user_id=payments_provider_user_id, seller_bot_user_id=seller_bot_user_id, url=url, invoice=invoice, _id=_id } =
  "PaymentForm" ++ cc [p "need_password" need_password, p "can_save_credentials" can_save_credentials, p "saved_credentials" saved_credentials, p "saved_order_info" saved_order_info, p "payments_provider" payments_provider, p "payments_provider_user_id" payments_provider_user_id, p "seller_bot_user_id" seller_bot_user_id, p "url" url, p "invoice" invoice, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PaymentForm where
 toJSON PaymentForm { need_password = need_password, can_save_credentials = can_save_credentials, saved_credentials = saved_credentials, saved_order_info = saved_order_info, payments_provider = payments_provider, payments_provider_user_id = payments_provider_user_id, seller_bot_user_id = seller_bot_user_id, url = url, invoice = invoice, _id = _id } =
  A.object [ "@type" A..= T.String "paymentForm", "need_password" A..= need_password, "can_save_credentials" A..= can_save_credentials, "saved_credentials" A..= saved_credentials, "saved_order_info" A..= saved_order_info, "payments_provider" A..= payments_provider, "payments_provider_user_id" A..= payments_provider_user_id, "seller_bot_user_id" A..= seller_bot_user_id, "url" A..= url, "invoice" A..= invoice, "id" A..= _id ]

instance T.FromJSON PaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "paymentForm" -> parsePaymentForm v
   _ -> mempty
  where
   parsePaymentForm :: A.Value -> T.Parser PaymentForm
   parsePaymentForm = A.withObject "PaymentForm" $ \o -> do
    need_password <- o A..:? "need_password"
    can_save_credentials <- o A..:? "can_save_credentials"
    saved_credentials <- o A..:? "saved_credentials"
    saved_order_info <- o A..:? "saved_order_info"
    payments_provider <- o A..:? "payments_provider"
    payments_provider_user_id <- mconcat [ o A..:? "payments_provider_user_id", readMaybe <$> (o A..: "payments_provider_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    seller_bot_user_id <- mconcat [ o A..:? "seller_bot_user_id", readMaybe <$> (o A..: "seller_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    url <- o A..:? "url"
    invoice <- o A..:? "invoice"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PaymentForm { need_password = need_password, can_save_credentials = can_save_credentials, saved_credentials = saved_credentials, saved_order_info = saved_order_info, payments_provider = payments_provider, payments_provider_user_id = payments_provider_user_id, seller_bot_user_id = seller_bot_user_id, url = url, invoice = invoice, _id = _id }
 parseJSON _ = mempty
