-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.StopPoll where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data StopPoll = 
 StopPoll { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON StopPoll where
 toJSON (StopPoll { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "stopPoll", "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON StopPoll where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "stopPoll" -> parseStopPoll v
   _ -> mempty
  where
   parseStopPoll :: A.Value -> T.Parser StopPoll
   parseStopPoll = A.withObject "StopPoll" $ \o -> do
    reply_markup <- o A..:? "reply_markup"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ StopPoll { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }