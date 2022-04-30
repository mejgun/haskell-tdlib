-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendChatScreenshotTakenNotification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Sends a notification about a screenshot taken in a chat. Supported only in private and secret chats 
-- 
-- __chat_id__ Chat identifier
data SendChatScreenshotTakenNotification = 

 SendChatScreenshotTakenNotification { chat_id :: Maybe Int }  deriving (Eq)

instance Show SendChatScreenshotTakenNotification where
 show SendChatScreenshotTakenNotification { chat_id=chat_id } =
  "SendChatScreenshotTakenNotification" ++ U.cc [U.p "chat_id" chat_id ]

instance T.ToJSON SendChatScreenshotTakenNotification where
 toJSON SendChatScreenshotTakenNotification { chat_id = chat_id } =
  A.object [ "@type" A..= T.String "sendChatScreenshotTakenNotification", "chat_id" A..= chat_id ]

instance T.FromJSON SendChatScreenshotTakenNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendChatScreenshotTakenNotification" -> parseSendChatScreenshotTakenNotification v
   _ -> mempty
  where
   parseSendChatScreenshotTakenNotification :: A.Value -> T.Parser SendChatScreenshotTakenNotification
   parseSendChatScreenshotTakenNotification = A.withObject "SendChatScreenshotTakenNotification" $ \o -> do
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendChatScreenshotTakenNotification { chat_id = chat_id }
 parseJSON _ = mempty
