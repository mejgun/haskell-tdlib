-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageCaption where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageCaption = 
 EditMessageCaption { caption :: Maybe FormattedText.FormattedText, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

instance T.ToJSON EditMessageCaption where
 toJSON (EditMessageCaption { caption = caption, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "editMessageCaption", "caption" A..= caption, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageCaption where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageCaption" -> parseEditMessageCaption v
   _ -> mempty
  where
   parseEditMessageCaption :: A.Value -> T.Parser EditMessageCaption
   parseEditMessageCaption = A.withObject "EditMessageCaption" $ \o -> do
    caption <- optional $ o A..: "caption"
    reply_markup <- optional $ o A..: "reply_markup"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ EditMessageCaption { caption = caption, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }