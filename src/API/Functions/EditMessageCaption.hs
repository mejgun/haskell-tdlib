-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageCaption where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the message content caption. Returns the edited message after the edit is completed on the server side
-- 
-- __chat_id__ The chat the message belongs to
-- 
-- __message_id__ Identifier of the message
-- 
-- __reply_markup__ The new message reply markup; pass null if none; for bots only
-- 
-- __caption__ New message content caption; 0-GetOption("message_caption_length_max") characters; pass null to remove caption
data EditMessageCaption = 

 EditMessageCaption { caption :: Maybe FormattedText.FormattedText, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show EditMessageCaption where
 show EditMessageCaption { caption=caption, reply_markup=reply_markup, message_id=message_id, chat_id=chat_id } =
  "EditMessageCaption" ++ cc [p "caption" caption, p "reply_markup" reply_markup, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditMessageCaption where
 toJSON EditMessageCaption { caption = caption, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id } =
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
 parseJSON _ = mempty
