-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendInlineQueryResultMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

data SendInlineQueryResultMessage = 
 SendInlineQueryResultMessage { hide_via_bot :: Maybe Bool, result_id :: Maybe String, query_id :: Maybe Int, options :: Maybe SendMessageOptions.SendMessageOptions, reply_to_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendInlineQueryResultMessage where
 toJSON (SendInlineQueryResultMessage { hide_via_bot = hide_via_bot, result_id = result_id, query_id = query_id, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendInlineQueryResultMessage", "hide_via_bot" A..= hide_via_bot, "result_id" A..= result_id, "query_id" A..= query_id, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]

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
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendInlineQueryResultMessage { hide_via_bot = hide_via_bot, result_id = result_id, query_id = query_id, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }