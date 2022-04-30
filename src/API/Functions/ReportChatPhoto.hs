-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportChatPhoto where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatReportReason as ChatReportReason

-- |
-- 
-- Reports a chat photo to the Telegram moderators. A chat photo can be reported only if chat.can_be_reported
-- 
-- __chat_id__ Chat identifier
-- 
-- __file_id__ Identifier of the photo to report. Only full photos from chatPhoto can be reported
-- 
-- __reason__ The reason for reporting the chat photo
-- 
-- __text__ Additional report details; 0-1024 characters
data ReportChatPhoto = 

 ReportChatPhoto { text :: Maybe String, reason :: Maybe ChatReportReason.ChatReportReason, file_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ReportChatPhoto where
 show ReportChatPhoto { text=text, reason=reason, file_id=file_id, chat_id=chat_id } =
  "ReportChatPhoto" ++ U.cc [U.p "text" text, U.p "reason" reason, U.p "file_id" file_id, U.p "chat_id" chat_id ]

instance T.ToJSON ReportChatPhoto where
 toJSON ReportChatPhoto { text = text, reason = reason, file_id = file_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "reportChatPhoto", "text" A..= text, "reason" A..= reason, "file_id" A..= file_id, "chat_id" A..= chat_id ]

instance T.FromJSON ReportChatPhoto where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "reportChatPhoto" -> parseReportChatPhoto v
   _ -> mempty
  where
   parseReportChatPhoto :: A.Value -> T.Parser ReportChatPhoto
   parseReportChatPhoto = A.withObject "ReportChatPhoto" $ \o -> do
    text <- o A..:? "text"
    reason <- o A..:? "reason"
    file_id <- mconcat [ o A..:? "file_id", readMaybe <$> (o A..: "file_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ReportChatPhoto { text = text, reason = reason, file_id = file_id, chat_id = chat_id }
 parseJSON _ = mempty
