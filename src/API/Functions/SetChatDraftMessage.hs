-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetChatDraftMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage

-- |
-- 
-- Changes the draft message in a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_thread_id__ If not 0, a message thread identifier in which the draft was changed
-- 
-- __draft_message__ New draft message; pass null to remove the draft
data SetChatDraftMessage = 

 SetChatDraftMessage { draft_message :: Maybe DraftMessage.DraftMessage, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SetChatDraftMessage where
 show SetChatDraftMessage { draft_message=draft_message, message_thread_id=message_thread_id, chat_id=chat_id } =
  "SetChatDraftMessage" ++ cc [p "draft_message" draft_message, p "message_thread_id" message_thread_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetChatDraftMessage where
 toJSON SetChatDraftMessage { draft_message = draft_message, message_thread_id = message_thread_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "setChatDraftMessage", "draft_message" A..= draft_message, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON SetChatDraftMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setChatDraftMessage" -> parseSetChatDraftMessage v
   _ -> mempty
  where
   parseSetChatDraftMessage :: A.Value -> T.Parser SetChatDraftMessage
   parseSetChatDraftMessage = A.withObject "SetChatDraftMessage" $ \o -> do
    draft_message <- o A..:? "draft_message"
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetChatDraftMessage { draft_message = draft_message, message_thread_id = message_thread_id, chat_id = chat_id }
 parseJSON _ = mempty
