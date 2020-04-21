-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentReceipt where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPaymentReceipt = 
 GetPaymentReceipt { message_id :: Int, chat_id :: Int }  deriving (Show)

instance T.ToJSON GetPaymentReceipt where
 toJSON (GetPaymentReceipt { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPaymentReceipt", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetPaymentReceipt where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPaymentReceipt" -> parseGetPaymentReceipt v
   _ -> mempty
  where
   parseGetPaymentReceipt :: A.Value -> T.Parser GetPaymentReceipt
   parseGetPaymentReceipt = A.withObject "GetPaymentReceipt" $ \o -> do
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ GetPaymentReceipt { message_id = message_id, chat_id = chat_id }