-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendInlineQueryResultMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSendOptions as MessageSendOptions

-- |
-- 
-- Sends the result of an inline query as a message. Returns the sent message. Always clears a chat draft message
-- 
-- __chat_id__ Target chat
-- 
-- __message_thread_id__ If not 0, a message thread identifier in which the message will be sent
-- 
-- __reply_to_message_id__ Identifier of a message to reply to or 0
-- 
-- __options__ Options to be used to send the message; pass null to use default options
-- 
-- __query_id__ Identifier of the inline query
-- 
-- __result_id__ Identifier of the inline result
-- 
-- __hide_via_bot__ If true, there will be no mention of a bot, via which the message is sent. Can be used only for bots GetOption("animation_search_bot_username"), GetOption("photo_search_bot_username") and GetOption("venue_search_bot_username")
data SendInlineQueryResultMessage = 

 SendInlineQueryResultMessage { hide_via_bot :: Maybe Bool, result_id :: Maybe String, query_id :: Maybe Int, options :: Maybe MessageSendOptions.MessageSendOptions, reply_to_message_id :: Maybe Int, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SendInlineQueryResultMessage where
 show SendInlineQueryResultMessage { hide_via_bot=hide_via_bot, result_id=result_id, query_id=query_id, options=options, reply_to_message_id=reply_to_message_id, message_thread_id=message_thread_id, chat_id=chat_id } =
  "SendInlineQueryResultMessage" ++ cc [p "hide_via_bot" hide_via_bot, p "result_id" result_id, p "query_id" query_id, p "options" options, p "reply_to_message_id" reply_to_message_id, p "message_thread_id" message_thread_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendInlineQueryResultMessage where
 toJSON SendInlineQueryResultMessage { hide_via_bot = hide_via_bot, result_id = result_id, query_id = query_id, options = options, reply_to_message_id = reply_to_message_id, message_thread_id = message_thread_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "sendInlineQueryResultMessage", "hide_via_bot" A..= hide_via_bot, "result_id" A..= result_id, "query_id" A..= query_id, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendInlineQueryResultMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendInlineQueryResultMessage" -> parseSendInlineQueryResultMessage v
   _ -> mempty
  where
   parseSendInlineQueryResultMessage :: A.Value -> T.Parser SendInlineQueryResultMessage
   parseSendInlineQueryResultMessage = A.withObject "SendInlineQueryResultMessage" $ \o -> do
    hide_via_bot <- o A..:? "hide_via_bot"
    result_id <- o A..:? "result_id"
    query_id <- mconcat [ o A..:? "query_id", readMaybe <$> (o A..: "query_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    options <- o A..:? "options"
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendInlineQueryResultMessage { hide_via_bot = hide_via_bot, result_id = result_id, query_id = query_id, options = options, reply_to_message_id = reply_to_message_id, message_thread_id = message_thread_id, chat_id = chat_id }
 parseJSON _ = mempty
