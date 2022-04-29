-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageReplyInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Contains information about replies to a message
-- 
-- __reply_count__ Number of times the message was directly or indirectly replied
-- 
-- __recent_replier_ids__ Identifiers of at most 3 recent repliers to the message; available in channels with a discussion supergroup. The users and chats are expected to be inaccessible: only their photo and name will be available
-- 
-- __last_read_inbox_message_id__ Identifier of the last read incoming reply to the message
-- 
-- __last_read_outbox_message_id__ Identifier of the last read outgoing reply to the message
-- 
-- __last_message_id__ Identifier of the last reply to the message
data MessageReplyInfo = 

 MessageReplyInfo { last_message_id :: Maybe Int, last_read_outbox_message_id :: Maybe Int, last_read_inbox_message_id :: Maybe Int, recent_replier_ids :: Maybe [MessageSender.MessageSender], reply_count :: Maybe Int }  deriving (Eq)

instance Show MessageReplyInfo where
 show MessageReplyInfo { last_message_id=last_message_id, last_read_outbox_message_id=last_read_outbox_message_id, last_read_inbox_message_id=last_read_inbox_message_id, recent_replier_ids=recent_replier_ids, reply_count=reply_count } =
  "MessageReplyInfo" ++ cc [p "last_message_id" last_message_id, p "last_read_outbox_message_id" last_read_outbox_message_id, p "last_read_inbox_message_id" last_read_inbox_message_id, p "recent_replier_ids" recent_replier_ids, p "reply_count" reply_count ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageReplyInfo where
 toJSON MessageReplyInfo { last_message_id = last_message_id, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, recent_replier_ids = recent_replier_ids, reply_count = reply_count } =
  A.object [ "@type" A..= T.String "messageReplyInfo", "last_message_id" A..= last_message_id, "last_read_outbox_message_id" A..= last_read_outbox_message_id, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "recent_replier_ids" A..= recent_replier_ids, "reply_count" A..= reply_count ]

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
    recent_replier_ids <- o A..:? "recent_replier_ids"
    reply_count <- mconcat [ o A..:? "reply_count", readMaybe <$> (o A..: "reply_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ MessageReplyInfo { last_message_id = last_message_id, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, recent_replier_ids = recent_replier_ids, reply_count = reply_count }
 parseJSON _ = mempty
