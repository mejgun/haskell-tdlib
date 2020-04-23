-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SendMessageAlbum where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

data SendMessageAlbum = 
 SendMessageAlbum { input_message_contents :: Maybe [InputMessageContent.InputMessageContent], options :: Maybe SendMessageOptions.SendMessageOptions, reply_to_message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

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
    input_message_contents <- optional $ o A..: "input_message_contents"
    options <- optional $ o A..: "options"
    reply_to_message_id <- optional $ o A..: "reply_to_message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ SendMessageAlbum { input_message_contents = input_message_contents, options = options, reply_to_message_id = reply_to_message_id, chat_id = chat_id }