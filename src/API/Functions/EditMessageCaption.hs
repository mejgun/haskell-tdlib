-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageCaption where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditMessageCaption = 
 EditMessageCaption { caption :: FormattedText.FormattedText, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON EditMessageCaption where
 toJSON (EditMessageCaption { caption = caption, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageCaption", "caption" A..= caption, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- editMessageCaption EditMessageCaption  { caption :: FormattedText.FormattedText, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int } 

