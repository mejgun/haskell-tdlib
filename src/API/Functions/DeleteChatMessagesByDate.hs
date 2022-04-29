-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatMessagesByDate where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Deletes all messages between the specified dates in a chat. Supported only for private chats and basic groups. Messages sent in the last 30 seconds will not be deleted
-- 
-- __chat_id__ Chat identifier
-- 
-- __min_date__ The minimum date of the messages to delete
-- 
-- __max_date__ The maximum date of the messages to delete
-- 
-- __revoke__ Pass true to delete chat messages for all users; private chats only
data DeleteChatMessagesByDate = 

 DeleteChatMessagesByDate { revoke :: Maybe Bool, max_date :: Maybe Int, min_date :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatMessagesByDate where
 show DeleteChatMessagesByDate { revoke=revoke, max_date=max_date, min_date=min_date, chat_id=chat_id } =
  "DeleteChatMessagesByDate" ++ cc [p "revoke" revoke, p "max_date" max_date, p "min_date" min_date, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeleteChatMessagesByDate where
 toJSON DeleteChatMessagesByDate { revoke = revoke, max_date = max_date, min_date = min_date, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChatMessagesByDate", "revoke" A..= revoke, "max_date" A..= max_date, "min_date" A..= min_date, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatMessagesByDate where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatMessagesByDate" -> parseDeleteChatMessagesByDate v
   _ -> mempty
  where
   parseDeleteChatMessagesByDate :: A.Value -> T.Parser DeleteChatMessagesByDate
   parseDeleteChatMessagesByDate = A.withObject "DeleteChatMessagesByDate" $ \o -> do
    revoke <- o A..:? "revoke"
    max_date <- mconcat [ o A..:? "max_date", readMaybe <$> (o A..: "max_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    min_date <- mconcat [ o A..:? "min_date", readMaybe <$> (o A..: "min_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatMessagesByDate { revoke = revoke, max_date = max_date, min_date = min_date, chat_id = chat_id }
 parseJSON _ = mempty
