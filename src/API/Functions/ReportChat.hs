-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ReportChat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatReportReason as ChatReportReason

data ReportChat = 
 ReportChat { message_ids :: [Int], reason :: ChatReportReason.ChatReportReason, chat_id :: Int }  deriving (Show)

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
    message_ids <- o A..: "message_ids"
    reason <- o A..: "reason"
    chat_id <- o A..: "chat_id"
    return $ ReportChat { message_ids = message_ids, reason = reason, chat_id = chat_id }