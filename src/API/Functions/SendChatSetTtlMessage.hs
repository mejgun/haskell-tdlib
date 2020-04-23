-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatSetTtlMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SendChatSetTtlMessage = 
 SendChatSetTtlMessage { ttl :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON SendChatSetTtlMessage where
 toJSON (SendChatSetTtlMessage { ttl = ttl, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendChatSetTtlMessage", "ttl" A..= ttl, "chat_id" A..= chat_id ]

instance T.FromJSON SendChatSetTtlMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatSetTtlMessage" -> parseSendChatSetTtlMessage v
   _ -> mempty
  where
   parseSendChatSetTtlMessage :: A.Value -> T.Parser SendChatSetTtlMessage
   parseSendChatSetTtlMessage = A.withObject "SendChatSetTtlMessage" $ \o -> do
    ttl <- optional $ o A..: "ttl"
    chat_id <- optional $ o A..: "chat_id"
    return $ SendChatSetTtlMessage { ttl = ttl, chat_id = chat_id }