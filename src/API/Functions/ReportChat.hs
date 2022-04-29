-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatReportReason as ChatReportReason

-- |
-- 
-- Reports a chat to the Telegram moderators. A chat can be reported only from the chat action bar, or if chat.can_be_reported
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_ids__ Identifiers of reported messages; may be empty to report the whole chat
-- 
-- __reason__ The reason for reporting the chat
-- 
-- __text__ Additional report details; 0-1024 characters
data ReportChat = 

 ReportChat { text :: Maybe String, reason :: Maybe ChatReportReason.ChatReportReason, message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Eq)

instance Show ReportChat where
 show ReportChat { text=text, reason=reason, message_ids=message_ids, chat_id=chat_id } =
  "ReportChat" ++ cc [p "text" text, p "reason" reason, p "message_ids" message_ids, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ReportChat where
 toJSON ReportChat { text = text, reason = reason, message_ids = message_ids, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "reportChat", "text" A..= text, "reason" A..= reason, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

instance T.FromJSON ReportChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reportChat" -> parseReportChat v
   _ -> mempty
  where
   parseReportChat :: A.Value -> T.Parser ReportChat
   parseReportChat = A.withObject "ReportChat" $ \o -> do
    text <- o A..:? "text"
    reason <- o A..:? "reason"
    message_ids <- o A..:? "message_ids"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReportChat { text = text, reason = reason, message_ids = message_ids, chat_id = chat_id }
 parseJSON _ = mempty
