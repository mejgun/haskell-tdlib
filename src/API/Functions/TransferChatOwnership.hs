-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.TransferChatOwnership where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the owner of a chat. The current user must be a current owner of the chat. Use the method canTransferOwnership to check whether the ownership can be transferred from the current session. Available only for supergroups and channel chats
-- 
-- __chat_id__ Chat identifier
-- 
-- __user_id__ Identifier of the user to which transfer the ownership. The ownership can't be transferred to a bot or to a deleted user
-- 
-- __password__ The password of the current user
data TransferChatOwnership = 

 TransferChatOwnership { password :: Maybe String, user_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    password <- o A..:? "password"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ TransferChatOwnership { password = password, user_id = user_id, chat_id = chat_id }