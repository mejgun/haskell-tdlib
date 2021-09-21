-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageThreadInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.MessageReplyInfo as MessageReplyInfo

-- |
-- 
-- Contains information about a message thread
-- 
-- __chat_id__ Identifier of the chat to which the message thread belongs
-- 
-- __message_thread_id__ Message thread identifier, unique within the chat
-- 
-- __reply_info__ Contains information about the message thread
-- 
-- __unread_message_count__ Approximate number of unread messages in the message thread
-- 
-- __messages__ The messages from which the thread starts. The messages are returned in a reverse chronological order (i.e., in order of decreasing message_id)
-- 
-- __draft_message__ A draft of a message in the message thread; may be null
data MessageThreadInfo = 

 MessageThreadInfo { draft_message :: Maybe DraftMessage.DraftMessage, messages :: Maybe [Message.Message], unread_message_count :: Maybe Int, reply_info :: Maybe MessageReplyInfo.MessageReplyInfo, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageThreadInfo where
 toJSON (MessageThreadInfo { draft_message = draft_message, messages = messages, unread_message_count = unread_message_count, reply_info = reply_info, message_thread_id = message_thread_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "messageThreadInfo", "draft_message" A..= draft_message, "messages" A..= messages, "unread_message_count" A..= unread_message_count, "reply_info" A..= reply_info, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON MessageThreadInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageThreadInfo" -> parseMessageThreadInfo v
   _ -> mempty
  where
   parseMessageThreadInfo :: A.Value -> T.Parser MessageThreadInfo
   parseMessageThreadInfo = A.withObject "MessageThreadInfo" $ \o -> do
    draft_message <- o A..:? "draft_message"
    messages <- o A..:? "messages"
    unread_message_count <- mconcat [ o A..:? "unread_message_count", readMaybe <$> (o A..: "unread_message_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    reply_info <- o A..:? "reply_info"
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageThreadInfo { draft_message = draft_message, messages = messages, unread_message_count = unread_message_count, reply_info = reply_info, message_thread_id = message_thread_id, chat_id = chat_id }