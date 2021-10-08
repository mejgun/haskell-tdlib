-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessageAlbum where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.MessageSendOptions as MessageSendOptions

-- |
-- 
-- Sends 2-10 messages grouped together into an album. Currently only audio, document, photo and video messages can be grouped into an album. Documents and audio files can be only grouped in an album with messages of the same type. Returns sent messages
-- 
-- __chat_id__ Target chat
-- 
-- __message_thread_id__ If not 0, a message thread identifier in which the messages will be sent
-- 
-- __reply_to_message_id__ Identifier of a message to reply to or 0
-- 
-- __options__ Options to be used to send the messages; pass null to use default options
-- 
-- __input_message_contents__ Contents of messages to be sent. At most 10 messages can be added to an album
data SendMessageAlbum = 

 SendMessageAlbum { input_message_contents :: Maybe [InputMessageContent.InputMessageContent], options :: Maybe MessageSendOptions.MessageSendOptions, reply_to_message_id :: Maybe Int, message_thread_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show SendMessageAlbum where
 show SendMessageAlbum { input_message_contents=input_message_contents, options=options, reply_to_message_id=reply_to_message_id, message_thread_id=message_thread_id, chat_id=chat_id } =
  "SendMessageAlbum" ++ cc [p "input_message_contents" input_message_contents, p "options" options, p "reply_to_message_id" reply_to_message_id, p "message_thread_id" message_thread_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SendMessageAlbum where
 toJSON SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, message_thread_id = message_thread_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "sendMessageAlbum", "input_message_contents" A..= input_message_contents, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "message_thread_id" A..= message_thread_id, "chat_id" A..= chat_id ]

instance T.FromJSON SendMessageAlbum where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "sendMessageAlbum" -> parseSendMessageAlbum v
   _ -> mempty
  where
   parseSendMessageAlbum :: A.Value -> T.Parser SendMessageAlbum
   parseSendMessageAlbum = A.withObject "SendMessageAlbum" $ \o -> do
    input_message_contents <- o A..:? "input_message_contents"
    options <- o A..:? "options"
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, message_thread_id = message_thread_id, chat_id = chat_id }
 parseJSON _ = mempty
