-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageReplyInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains information about replies to a message
-- 
-- __reply_count__ Number of times the message was directly or indirectly replied
-- 
-- __recent_repliers__ Recent repliers to the message; available in channels with a discussion supergroup
-- 
-- __last_read_inbox_message_id__ Identifier of the last read incoming reply to the message
-- 
-- __last_read_outbox_message_id__ Identifier of the last read outgoing reply to the message
-- 
-- __last_message_id__ Identifier of the last reply to the message
data MessageReplyInfo = 

 MessageReplyInfo { last_message_id :: Maybe Int, last_read_outbox_message_id :: Maybe Int, last_read_inbox_message_id :: Maybe Int, recent_repliers :: Maybe [MessageSender.MessageSender], reply_count :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON MessageReplyInfo where
 toJSON (MessageReplyInfo { last_message_id = last_message_id, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, recent_repliers = recent_repliers, reply_count = reply_count }) =
  A.object [ "@type" A..= T.String "messageReplyInfo", "last_message_id" A..= last_message_id, "last_read_outbox_message_id" A..= last_read_outbox_message_id, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "recent_repliers" A..= recent_repliers, "reply_count" A..= reply_count ]

instance T.FromJSON MessageReplyInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageReplyInfo" -> parseMessageReplyInfo v
   _ -> mempty
  where
   parseMessageReplyInfo :: A.Value -> T.Parser MessageReplyInfo
   parseMessageReplyInfo = A.withObject "MessageReplyInfo" $ \o -> do
    last_message_id <- mconcat [ o A..:? "last_message_id", readMaybe <$> (o A..: "last_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    last_read_outbox_message_id <- mconcat [ o A..:? "last_read_outbox_message_id", readMaybe <$> (o A..: "last_read_outbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    last_read_inbox_message_id <- mconcat [ o A..:? "last_read_inbox_message_id", readMaybe <$> (o A..: "last_read_inbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    recent_repliers <- o A..:? "recent_repliers"
    reply_count <- mconcat [ o A..:? "reply_count", readMaybe <$> (o A..: "reply_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageReplyInfo { last_message_id = last_message_id, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, recent_repliers = recent_repliers, reply_count = reply_count }