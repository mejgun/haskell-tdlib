-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPaymentForm where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputCredentials as InputCredentials

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
    credentials <- optional $ o A..: "credentials"
    shipping_option_id <- optional $ o A..: "shipping_option_id"
    order_info_id <- optional $ o A..: "order_info_id"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ SendPaymentForm { credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, message_id = message_id, chat_id = chat_id }