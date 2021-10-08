-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.UnpinChatMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Removes a pinned message from a chat; requires can_pin_messages rights in the group or can_edit_messages rights in the channel 
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __message_id__ Identifier of the removed pinned message
data UnpinChatMessage = 

 UnpinChatMessage { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show UnpinChatMessage where
 show UnpinChatMessage { message_id=message_id, chat_id=chat_id } =
  "UnpinChatMessage" ++ cc [p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON UnpinChatMessage where
 toJSON UnpinChatMessage { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "unpinChatMessage", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON UnpinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "unpinChatMessage" -> parseUnpinChatMessage v
   _ -> mempty
  where
   parseUnpinChatMessage :: A.Value -> T.Parser UnpinChatMessage
   parseUnpinChatMessage = A.withObject "UnpinChatMessage" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ UnpinChatMessage { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
