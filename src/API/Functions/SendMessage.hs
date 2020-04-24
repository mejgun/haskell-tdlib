-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

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
    input_message_content <- optional $ o A..: "input_message_content"
    reply_markup <- optional $ o A..: "reply_markup"
    options <- optional $ o A..: "options"
    reply_to_message_id <- optional $ o A..: "reply_to_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ SendMessage { input_message_content = input_message_content, reply_markup = reply_markup, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }