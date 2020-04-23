-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPaymentForm where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetPaymentForm = 
 GetPaymentForm { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON GetPaymentForm where
 toJSON (GetPaymentForm { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "getPaymentForm", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetPaymentForm where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPaymentForm" -> parseGetPaymentForm v
   _ -> mempty
  where
   parseGetPaymentForm :: A.Value -> T.Parser GetPaymentForm
   parseGetPaymentForm = A.withObject "GetPaymentForm" $ \o -> do
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ GetPaymentForm { message_id = message_id, chat_id = chat_id }