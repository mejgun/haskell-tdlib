-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BlockMessageSenderFromReplies where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Blocks an original sender of a message in the Replies chat
-- 
-- __message_id__ The identifier of an incoming message in the Replies chat
-- 
-- __delete_message__ Pass true if the message must be deleted
-- 
-- __delete_all_messages__ Pass true if all messages from the same sender must be deleted
-- 
-- __report_spam__ Pass true if the sender must be reported to the Telegram moderators
data BlockMessageSenderFromReplies = 

 BlockMessageSenderFromReplies { report_spam :: Maybe Bool, delete_all_messages :: Maybe Bool, delete_message :: Maybe Bool, message_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON BlockMessageSenderFromReplies where
 toJSON (BlockMessageSenderFromReplies { report_spam = report_spam, delete_all_messages = delete_all_messages, delete_message = delete_message, message_id = message_id }) =
  A.object [ "@type" A..= T.String "blockMessageSenderFromReplies", "report_spam" A..= report_spam, "delete_all_messages" A..= delete_all_messages, "delete_message" A..= delete_message, "message_id" A..= message_id ]

instance T.FromJSON BlockMessageSenderFromReplies where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "blockMessageSenderFromReplies" -> parseBlockMessageSenderFromReplies v
   _ -> mempty
  where
   parseBlockMessageSenderFromReplies :: A.Value -> T.Parser BlockMessageSenderFromReplies
   parseBlockMessageSenderFromReplies = A.withObject "BlockMessageSenderFromReplies" $ \o -> do
    report_spam <- o A..:? "report_spam"
    delete_all_messages <- o A..:? "delete_all_messages"
    delete_message <- o A..:? "delete_message"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ BlockMessageSenderFromReplies { report_spam = report_spam, delete_all_messages = delete_all_messages, delete_message = delete_message, message_id = message_id }