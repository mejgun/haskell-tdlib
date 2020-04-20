-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPaymentReceipt = 
 GetPaymentReceipt { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPaymentReceipt where
 toJSON (GetPaymentReceipt { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPaymentReceipt", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getPaymentReceipt GetPaymentReceipt  { message_id :: Int, chat_id :: Int } 

