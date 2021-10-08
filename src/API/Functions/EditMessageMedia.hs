-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.EditMessageMedia where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Edits the content of a message with an animation, an audio, a document, a photo or a video, including message caption. If only the caption needs to be edited, use editMessageCaption instead.
-- 
-- -The media can't be edited if the message was set to self-destruct or to a self-destructing media. The type of message content in an album can't be changed with exception of replacing a photo with a video or vice versa. Returns the edited message after the edit is completed on the server side
-- 
-- __chat_id__ The chat the message belongs to
-- 
-- __message_id__ Identifier of the message
-- 
-- __reply_markup__ The new message reply markup; pass null if none; for bots only
-- 
-- __input_message_content__ New content of the message. Must be one of the following types: inputMessageAnimation, inputMessageAudio, inputMessageDocument, inputMessagePhoto or inputMessageVideo
data EditMessageMedia = 

 EditMessageMedia { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show EditMessageMedia where
 show EditMessageMedia { input_message_content=input_message_content, reply_markup=reply_markup, message_id=message_id, chat_id=chat_id } =
  "EditMessageMedia" ++ cc [p "input_message_content" input_message_content, p "reply_markup" reply_markup, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON EditMessageMedia where
 toJSON EditMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "editMessageMedia", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON EditMessageMedia where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "editMessageMedia" -> parseEditMessageMedia v
   _ -> mempty
  where
   parseEditMessageMedia :: A.Value -> T.Parser EditMessageMedia
   parseEditMessageMedia = A.withObject "EditMessageMedia" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ EditMessageMedia { input_message_content = input_message_content, reply_markup = reply_markup, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
