-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageCaption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data EditMessageCaption = 
 EditMessageCaption { caption :: Maybe FormattedText.FormattedText, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

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
    caption <- o A..:? "caption"
    reply_markup <- o A..:? "reply_markup"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditMessageCaption { caption = caption, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }