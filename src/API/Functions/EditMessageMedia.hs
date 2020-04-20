-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageMedia where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

--main = putStrLn "ok"

data EditMessageMedia = 
 EditMessageMedia { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON EditMessageMedia where
 toJSON (EditMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageMedia", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]
-- editMessageMedia EditMessageMedia  { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, message_id :: Int, chat_id :: Int } 



instance T.FromJSON EditMessageMedia where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageMedia" -> parseEditMessageMedia v
  where
   parseEditMessageMedia :: A.Value -> T.Parser EditMessageMedia
   parseEditMessageMedia = A.withObject "EditMessageMedia" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    message_id <- o A..: "message_id"
    chat_id <- o A..: "chat_id"
    return $ EditMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }