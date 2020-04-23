-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TransferChatOwnership where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data TransferChatOwnership = 
 TransferChatOwnership { password :: Maybe String, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON TransferChatOwnership where
 toJSON (TransferChatOwnership { password = password, user_id = user_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "transferChatOwnership", "password" A..= password, "user_id" A..= user_id, "chat_id" A..= chat_id ]

instance T.FromJSON TransferChatOwnership where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "transferChatOwnership" -> parseTransferChatOwnership v
   _ -> mempty
  where
   parseTransferChatOwnership :: A.Value -> T.Parser TransferChatOwnership
   parseTransferChatOwnership = A.withObject "TransferChatOwnership" $ \o -> do
    password <- optional $ o A..: "password"
    user_id <- optional $ o A..: "user_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ TransferChatOwnership { password = password, user_id = user_id, chat_id = chat_id }