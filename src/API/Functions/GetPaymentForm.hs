-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentForm where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPaymentForm = 
 GetPaymentForm { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON GetPaymentForm where
 toJSON (GetPaymentForm { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPaymentForm", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- getPaymentForm GetPaymentForm  { message_id :: Int, chat_id :: Int } 

