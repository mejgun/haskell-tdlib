-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteChatReplyMarkup where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteChatReplyMarkup = 
 DeleteChatReplyMarkup { message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON DeleteChatReplyMarkup where
 toJSON (DeleteChatReplyMarkup { message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "deleteChatReplyMarkup", "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- deleteChatReplyMarkup DeleteChatReplyMarkup  { message_id :: Int, chat_id :: Int } 

