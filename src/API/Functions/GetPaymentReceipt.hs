-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentReceipt where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPaymentReceipt = 
 GetPaymentReceipt { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetPaymentReceipt { message_id = message_id, chat_id = chat_id }