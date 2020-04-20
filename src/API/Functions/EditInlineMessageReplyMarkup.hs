-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditInlineMessageReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditInlineMessageReplyMarkup = 
 EditInlineMessageReplyMarkup { reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String }  -- deriving (Show)

instance T.ToJSON EditInlineMessageReplyMarkup where
 toJSON (EditInlineMessageReplyMarkup { reply_markup = reply_markup, inline_message_id = inline_message_id }) =
  A.object [ "@type" A..= T.String "editInlineMessageReplyMarkup", "reply_markup" A..= reply_markup, "inline_message_id" A..= inline_message_id ]
-- editInlineMessageReplyMarkup EditInlineMessageReplyMarkup  { reply_markup :: ReplyMarkup.ReplyMarkup, inline_message_id :: String } 

