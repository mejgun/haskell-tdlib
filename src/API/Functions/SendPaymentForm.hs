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

