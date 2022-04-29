-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatMessagesBySender where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Deletes all messages sent by the specified message sender in a chat. Supported only for supergroups; requires can_delete_messages administrator privileges 
-- 
-- __chat_id__ Chat identifier
-- 
-- __sender_id__ Identifier of the sender of messages to delete
data DeleteChatMessagesBySender = 

 DeleteChatMessagesBySender { sender_id :: Maybe MessageSender.MessageSender, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatMessagesBySender where
 show DeleteChatMessagesBySender { sender_id=sender_id, chat_id=chat_id } =
  "DeleteChatMessagesBySender" ++ cc [p "sender_id" sender_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteChatMessagesBySender where
 toJSON DeleteChatMessagesBySender { sender_id = sender_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChatMessagesBySender", "sender_id" A..= sender_id, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatMessagesBySender where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatMessagesBySender" -> parseDeleteChatMessagesBySender v
   _ -> mempty
  where
   parseDeleteChatMessagesBySender :: A.Value -> T.Parser DeleteChatMessagesBySender
   parseDeleteChatMessagesBySender = A.withObject "DeleteChatMessagesBySender" $ \o -> do
    sender_id <- o A..:? "sender_id"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatMessagesBySender { sender_id = sender_id, chat_id = chat_id }
 parseJSON _ = mempty
