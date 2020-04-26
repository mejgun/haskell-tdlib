-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ViewMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Informs TDLib that messages are being viewed by the user. Many useful activities depend on whether the messages are currently being viewed or not (e.g., marking messages as read, incrementing a view counter, updating a view counter, removing deleted messages in supergroups and channels) 
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_ids__ The identifiers of the messages being viewed
-- 
-- __force_read__ True, if messages in closed chats should be marked as read
data ViewMessages = 
 ViewMessages { force_read :: Maybe Bool, message_ids :: Maybe [Int], chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ViewMessages where
 toJSON (ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "viewMessages", "force_read" A..= force_read, "message_ids" A..= message_ids, "chat_id" A..= chat_id ]

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
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ViewMessages { force_read = force_read, message_ids = message_ids, chat_id = chat_id }