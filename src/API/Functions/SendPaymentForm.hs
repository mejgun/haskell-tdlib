-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputCredentials as InputCredentials

--main = putStrLn "ok"

data SendPaymentForm = 
 SendPaymentForm { credentials :: InputCredentials.InputCredentials, shipping_option_id :: String, order_info_id :: String, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendPaymentForm where
 toJSON (SendPaymentForm { credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendPaymentForm", "credentials" A..= credentials, "shipping_option_id" A..= shipping_option_id, "order_info_id" A..= order_info_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- sendPaymentForm SendPaymentForm  { credentials :: InputCredentials.InputCredentials, shipping_option_id :: String, order_info_id :: String, message_id :: Int, chat_id :: Int } 



instance T.FromJSON SendPaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendPaymentForm" -> parseSendPaymentForm v
  where
   parseSendPaymentForm :: A.Value -> T.Parser SendPaymentForm
   parseSendPaymentForm = A.withObject "SendPaymentForm" $ \o -> do
    credentials <- o A..: "credentials"
    shipping_option_id <- o A..: "shipping_option_id"
    order_info_id <- o A..: "order_info_id"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ SendPaymentForm { credentials = credentials, shipping_option_id = shipping_option_id, order_info_id = order_info_id, message_id = message_id, chat_id = chat_id }