-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageReplyMarkup where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageReplyMarkup = 
 EditMessageReplyMarkup { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON EditMessageReplyMarkup where
 toJSON (EditMessageReplyMarkup { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageReplyMarkup", "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageReplyMarkup where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageReplyMarkup" -> parseEditMessageReplyMarkup v
   _ -> mempty
  where
   parseEditMessageReplyMarkup :: A.Value -> T.Parser EditMessageReplyMarkup
   parseEditMessageReplyMarkup = A.withObject "EditMessageReplyMarkup" $ \o -> do
    reply_markup <- optional $ o A..: "reply_markup"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ EditMessageReplyMarkup { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }