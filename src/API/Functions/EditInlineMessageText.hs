-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditInlineMessageText = 
 EditInlineMessageText { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  -- deriving (Show)

instance T.ToJSON EditInlineMessageText where
 toJSON (EditInlineMessageText { input_message_content = input_message_content, reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageText", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]
-- editInlineMessageText EditInlineMessageText  { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String } 

