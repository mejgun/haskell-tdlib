-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Informs TDLib that messages are being viewed by the user. Sponsored messages must be marked as viewed only when the entire text of the message is shown on the screen (excluding the button). Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels)
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_thread_id__ If not 0, a message thread identifier in which the messages are being viewed
-- 
-- __message_ids__ The identifiers of the messages being viewed
-- 
-- __force_read__ Pass true to mark as read the specified messages even the chat is closed
data ViewMessages = 

 ViewMessages { force_read :: Maybe Bool, message_ids :: Maybe [Int], message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ViewMessages where
 show ViewMessages { force_read=force_read, message_ids=message_ids, message_thread_id=message_thread_id, chat_id=chat_id } =
  "ViewMessages" ++ U.cc [U.p "force_read" force_read, U.p "message_ids" message_ids, U.p "message_thread_id" message_thread_id, U.p "chat_id" chat_id ]

instance T.ToJSON ViewMessages where
 toJSON ViewMessages { force_read = force_read, message_ids = message_ids, message_thread_id = message_thread_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "viewMessages", "force_read" A..= force_read, "message_ids" A..= message_ids, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON ViewMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "viewMessages" -> parseViewMessages v
   _ -> mempty
  where
   parseViewMessages :: A.Value -> T.Parser ViewMessages
   parseViewMessages = A.withObject "ViewMessages" $ \o -> do
    force_read <- o A..:? "force_read"
    message_ids <- o A..:? "message_ids"
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ViewMessages { force_read = force_read, message_ids = message_ids, message_thread_id = message_thread_id, chat_id = chat_id }
 parseJSON _ = mempty
