-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatReportReason as ChatReportReason

-- |
-- 
-- Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if this is a private chats with a bot, a private chat with a user sharing their location, a supergroup, or a channel, since other chats can't be checked by moderators 
-- 
-- __chat_id__ Chat identifier
-- 
-- __reason__ The reason for reporting the chat
-- 
-- __message_ids__ Identifiers of reported messages, if any
data ReportChat = 
 ReportChat { message_ids :: Maybe [Int], reason :: Maybe ChatReportReason.ChatReportReason, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ReportChat where
 toJSON (ReportChat { message_ids = message_ids, reason = reason, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "reportChat", "message_ids" A..= message_ids, "reason" A..= reason, "chat_id" A..= chat_id ]

instance T.FromJSON ReportChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reportChat" -> parseReportChat v
   _ -> mempty
  where
   parseReportChat :: A.Value -> T.Parser ReportChat
   parseReportChat = A.withObject "ReportChat" $ \o -> do
    message_ids <- o A..:? "message_ids"
    reason <- o A..:? "reason"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReportChat { message_ids = message_ids, reason = reason, chat_id = chat_id }