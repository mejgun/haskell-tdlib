-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

-- |
-- 
-- Sends a message. Returns the sent message
-- 
-- __chat_id__ Target chat
-- 
-- __reply_to_message_id__ Identifier of the message to reply to or 0
-- 
-- __options__ Options to be used to send the message
-- 
-- __reply_markup__ Markup for replying to the message; for bots only
-- 
-- __input_message_content__ The content of the message to be sent
data SendMessage = 
 SendMessage { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, options :: Maybe SendMessageOptions.SendMessageOptions, reply_to_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendMessage where
 toJSON (SendMessage { input_message_content = input_message_content, reply_markup = reply_markup, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendMessage", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendMessage" -> parseSendMessage v
   _ -> mempty
  where
   parseSendMessage :: A.Value -> T.Parser SendMessage
   parseSendMessage = A.withObject "SendMessage" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    options <- o A..:? "options"
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendMessage { input_message_content = input_message_content, reply_markup = reply_markup, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }