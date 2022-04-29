-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.BlockMessageSenderFromReplies where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Blocks an original sender of a message in the Replies chat
-- 
-- __message_id__ The identifier of an incoming message in the Replies chat
-- 
-- __delete_message__ Pass true to delete the message
-- 
-- __delete_all_messages__ Pass true to delete all messages from the same sender
-- 
-- __report_spam__ Pass true to report the sender to the Telegram moderators
data BlockMessageSenderFromReplies = 

 BlockMessageSenderFromReplies { report_spam :: Maybe Bool, delete_all_messages :: Maybe Bool, delete_message :: Maybe Bool, message_id :: Maybe Int }  deriving (Eq)

instance Show BlockMessageSenderFromReplies where
 show BlockMessageSenderFromReplies { report_spam=report_spam, delete_all_messages=delete_all_messages, delete_message=delete_message, message_id=message_id } =
  "BlockMessageSenderFromReplies" ++ cc [p "report_spam" report_spam, p "delete_all_messages" delete_all_messages, p "delete_message" delete_message, p "message_id" message_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON BlockMessageSenderFromReplies where
 toJSON BlockMessageSenderFromReplies { report_spam = report_spam, delete_all_messages = delete_all_messages, delete_message = delete_message, message_id = message_id } =
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
 parseJSON _ = mempty
