-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditMessageText = 
 EditMessageText { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON EditMessageText where
 toJSON (EditMessageText { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageText", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- editMessageText EditMessageText  { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int } 

