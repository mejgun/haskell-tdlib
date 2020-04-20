-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ValidateOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo

--main = putStrLn "ok"

data ValidateOrderInfo = 
 ValidateOrderInfo { allow_save :: Bool, order_info :: OrderInfo.OrderInfo, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ValidateOrderInfo where
 toJSON (ValidateOrderInfo { allow_save = allow_save, order_info = order_info, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "validateOrderInfo", "allow_save" A..= allow_save, "order_info" A..= order_info, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- validateOrderInfo ValidateOrderInfo  { allow_save :: Bool, order_info :: OrderInfo.OrderInfo, message_id :: Int, chat_id :: Int } 

