-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageReplyMarkup where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the message reply markup; for bots only. Returns the edited message after the edit is completed on the server side
-- 
-- __chat_id__ The chat the message belongs to
-- 
-- __message_id__ Identifier of the message
-- 
-- __reply_markup__ The new message reply markup; pass null if none
data EditMessageReplyMarkup = 

 EditMessageReplyMarkup { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show EditMessageReplyMarkup where
 show EditMessageReplyMarkup { reply_markup=reply_markup, message_id=message_id, chat_id=chat_id } =
  "EditMessageReplyMarkup" ++ U.cc [U.p "reply_markup" reply_markup, U.p "message_id" message_id, U.p "chat_id" chat_id ]

instance T.ToJSON EditMessageReplyMarkup where
 toJSON EditMessageReplyMarkup { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id } =
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
    reply_markup <- o A..:? "reply_markup"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditMessageReplyMarkup { reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
