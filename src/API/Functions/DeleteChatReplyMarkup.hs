-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatReplyMarkup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Deletes the default reply markup from a chat. Must be called after a one-time keyboard or a ForceReply reply markup has been used. UpdateChatReplyMarkup will be sent if the reply markup is changed
-- 
-- __chat_id__ Chat identifier
-- 
-- __message_id__ The message identifier of the used keyboard
data DeleteChatReplyMarkup = 

 DeleteChatReplyMarkup { message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show DeleteChatReplyMarkup where
 show DeleteChatReplyMarkup { message_id=message_id, chat_id=chat_id } =
  "DeleteChatReplyMarkup" ++ U.cc [U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON DeleteChatReplyMarkup where
 toJSON DeleteChatReplyMarkup { message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "deleteChatReplyMarkup", "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON DeleteChatReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteChatReplyMarkup" -> parseDeleteChatReplyMarkup v
   _ -> mempty
  where
   parseDeleteChatReplyMarkup :: A.Value -> T.Parser DeleteChatReplyMarkup
   parseDeleteChatReplyMarkup = A.withObject "DeleteChatReplyMarkup" $ \o -> do
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ DeleteChatReplyMarkup { message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
