-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCallbackQueryMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Returns information about a message with the callback button that originated a callback query; for bots only 
-- 
-- __chat_id__ Identifier of the chat the message belongs to
-- 
-- __message_id__ Message identifier
-- 
-- __callback_query_id__ Identifier of the callback query
data GetCallbackQueryMessage = 

 GetCallbackQueryMessage { callback_query_id :: Maybe Int, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show GetCallbackQueryMessage where
 show GetCallbackQueryMessage { callback_query_id=callback_query_id, message_id=message_id, chat_id=chat_id } =
  "GetCallbackQueryMessage" ++ U.cc [U.p "callback_query_id" callback_query_id, U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON GetCallbackQueryMessage where
 toJSON GetCallbackQueryMessage { callback_query_id = callback_query_id, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "getCallbackQueryMessage", "callback_query_id" A..= callback_query_id, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON GetCallbackQueryMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCallbackQueryMessage" -> parseGetCallbackQueryMessage v
   _ -> mempty
  where
   parseGetCallbackQueryMessage :: A.Value -> T.Parser GetCallbackQueryMessage
   parseGetCallbackQueryMessage = A.withObject "GetCallbackQueryMessage" $ \o -> do
    callback_query_id <- mconcat [ o A..:? "callback_query_id", readMaybe <$> (o A..: "callback_query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetCallbackQueryMessage { callback_query_id = callback_query_id, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
