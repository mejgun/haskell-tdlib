-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessageAlbum where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

-- |
-- 
-- Sends messages grouped together into an album. Currently only photo and video messages can be grouped into an album. Returns sent messages
-- 
-- __chat_id__ Target chat
-- 
-- __reply_to_message_id__ Identifier of a message to reply to or 0
-- 
-- __options__ Options to be used to send the messages
-- 
-- __input_message_contents__ Contents of messages to be sent
data SendMessageAlbum = 

 SendMessageAlbum { input_message_contents :: Maybe [InputMessageContent.InputMessageContent], options :: Maybe SendMessageOptions.SendMessageOptions, reply_to_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON SendMessageAlbum where
 toJSON (SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "sendMessageAlbum", "input_message_contents" A..= input_message_contents, "options" A..= options, "reply_to_message_id" A..= reply_to_message_id, "chat_id" A..= chat_id ]

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
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }