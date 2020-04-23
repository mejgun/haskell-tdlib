-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ValidateOrderInfo where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.OrderInfo as OrderInfo

data ValidateOrderInfo = 
 ValidateOrderInfo { allow_save :: Maybe Bool, order_info :: Maybe OrderInfo.OrderInfo, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

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
    allow_save <- optional $ o A..: "allow_save"
    order_info <- optional $ o A..: "order_info"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ ValidateOrderInfo { allow_save = allow_save, order_info = order_info, message_id = message_id, chat_id = chat_id }