-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPaymentForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputCredentials as InputCredentials

-- |
-- 
-- Sends a filled-out payment form to the bot for final verification 
-- 
-- __chat_id__ Chat identifier of the Invoice message
-- 
-- __message_id__ Message identifier
-- 
-- __payment_form_id__ Payment form identifier returned by getPaymentForm
-- 
-- __order_info_id__ Identifier returned by validateOrderInfo, or an empty string
-- 
-- __shipping_option_id__ Identifier of a chosen shipping option, if applicable
-- 
-- __credentials__ The credentials chosen by user for payment
-- 
-- __tip_amount__ Chosen by the user amount of tip in the smallest units of the currency
data SendPaymentForm = 

 SendPaymentForm { tip_amount :: Maybe Int, credentials :: Maybe InputCredentials.InputCredentials, shipping_option_id :: Maybe String, order_info_id :: Maybe String, payment_form_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SendPaymentForm where
 show SendPaymentForm { tip_amount=tip_amount, credentials=credentials, shipping_option_id=shipping_option_id, order_info_id=order_info_id, payment_form_id=payment_form_id, message_id=message_id, chat_id=chat_id } =
  "SendPaymentForm" ++ cc [p "tip_amount" tip_amount, p "credentials" credentials, p "shipping_option_id" shipping_option_id, p "order_info_id" order_info_id, p "payment_form_id" payment_form_id, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendPaymentForm where
 toJSON SendPaymentForm { tip_amount = tip_amount, credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, payment_form_id = payment_form_id, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "sendPaymentForm", "tip_amount" A..= tip_amount, "credentials" A..= credentials, "shipping_option_id" A..= shipping_option_id, "order_info_id" A..= order_info_id, "payment_form_id" A..= payment_form_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendPaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPaymentForm" -> parseSendPaymentForm v
   _ -> mempty
  where
   parseSendPaymentForm :: A.Value -> T.Parser SendPaymentForm
   parseSendPaymentForm = A.withObject "SendPaymentForm" $ \o -> do
    tip_amount <- mconcat [ o A..:? "tip_amount", readMaybe <$> (o A..: "tip_amount" :: T.Parser String)] :: T.Parser (Maybe Int)
    credentials <- o A..:? "credentials"
    shipping_option_id <- o A..:? "shipping_option_id"
    order_info_id <- o A..:? "order_info_id"
    payment_form_id <- mconcat [ o A..:? "payment_form_id", readMaybe <$> (o A..: "payment_form_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendPaymentForm { tip_amount = tip_amount, credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, payment_form_id = payment_form_id, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
