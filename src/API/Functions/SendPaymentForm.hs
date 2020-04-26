-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPaymentForm where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputCredentials as InputCredentials

-- |
-- 
-- Sends a filled-out payment form to the bot for final verification 
-- 
-- __chat_id__ Chat identifier of the Invoice message
-- 
-- __message_id__ Message identifier
-- 
-- __order_info_id__ Identifier returned by ValidateOrderInfo, or an empty string
-- 
-- __shipping_option_id__ Identifier of a chosen shipping option, if applicable
-- 
-- __credentials__ The credentials chosen by user for payment
data SendPaymentForm = 
 SendPaymentForm { credentials :: Maybe InputCredentials.InputCredentials, shipping_option_id :: Maybe String, order_info_id :: Maybe String, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendPaymentForm where
 toJSON (SendPaymentForm { credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendPaymentForm", "credentials" A..= credentials, "shipping_option_id" A..= shipping_option_id, "order_info_id" A..= order_info_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendPaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPaymentForm" -> parseSendPaymentForm v
   _ -> mempty
  where
   parseSendPaymentForm :: A.Value -> T.Parser SendPaymentForm
   parseSendPaymentForm = A.withObject "SendPaymentForm" $ \o -> do
    credentials <- o A..:? "credentials"
    shipping_option_id <- o A..:? "shipping_option_id"
    order_info_id <- o A..:? "order_info_id"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendPaymentForm { credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, message_id = message_id, chat_id = chat_id }