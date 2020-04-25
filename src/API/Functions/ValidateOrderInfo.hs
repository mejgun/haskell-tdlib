-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ValidateOrderInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo

data ValidateOrderInfo = 
 ValidateOrderInfo { allow_save :: Maybe Bool, order_info :: Maybe OrderInfo.OrderInfo, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ValidateOrderInfo where
 toJSON (ValidateOrderInfo { allow_save = allow_save, order_info = order_info, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "validateOrderInfo", "allow_save" A..= allow_save, "order_info" A..= order_info, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON ValidateOrderInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "validateOrderInfo" -> parseValidateOrderInfo v
   _ -> mempty
  where
   parseValidateOrderInfo :: A.Value -> T.Parser ValidateOrderInfo
   parseValidateOrderInfo = A.withObject "ValidateOrderInfo" $ \o -> do
    allow_save <- o A..:? "allow_save"
    order_info <- o A..:? "order_info"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ValidateOrderInfo { allow_save = allow_save, order_info = order_info, message_id = message_id, chat_id = chat_id }