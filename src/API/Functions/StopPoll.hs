-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.StopPoll where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data StopPoll = 
 StopPoll { reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON StopPoll where
 toJSON (StopPoll { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "stopPoll", "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- stopPoll StopPoll  { reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int } 

