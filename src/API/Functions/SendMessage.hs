-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessage where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

--main = putStrLn "ok"

data SendMessage = 
 SendMessage { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON SendMessage where
 toJSON (SendMessage { input_message_content = input_message_content, reply_markup = reply_markup, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendMessage", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]
-- sendMessage SendMessage  { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, options :: SendMessageOptions.SendMessageOptions, reply_to_message_id :: Int, chat_id :: Int } 

