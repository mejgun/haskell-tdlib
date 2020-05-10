-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ForwardMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.SendMessageOptions as SendMessageOptions

-- |
-- 
-- Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
-- 
-- __chat_id__ Identifier of the chat to which to forward messages
-- 
-- __from_chat_id__ Identifier of the chat from which to forward messages
-- 
-- __message_ids__ Identifiers of the messages to forward
-- 
-- __options__ Options to be used to send the messages
-- 
-- __as_album__ True, if the messages should be grouped into an album after forwarding. For this to work, no more than 10 messages may be forwarded, and all of them must be photo or video messages
-- 
-- __send_copy__ True, if content of the messages needs to be copied without links to the original messages. Always true if the messages are forwarded to a secret chat
-- 
-- __remove_caption__ True, if media captions of message copies needs to be removed. Ignored if send_copy is false
data ForwardMessages = 

 ForwardMessages { remove_caption :: Maybe Bool, send_copy :: Maybe Bool, as_album :: Maybe Bool, options :: Maybe SendMessageOptions.SendMessageOptions, message_ids :: Maybe [Int], from_chat_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ForwardMessages where
 toJSON (ForwardMessages { remove_caption = remove_caption, send_copy = send_copy, as_album = as_album, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "forwardMessages", "remove_caption" A..= remove_caption, "send_copy" A..= send_copy, "as_album" A..= as_album, "options" A..= options, "message_ids" A..= message_ids, "from_chat_id" A..= from_chat_id, "chat_id" A..= chat_id ]

instance T.FromJSON ForwardMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "forwardMessages" -> parseForwardMessages v
   _ -> mempty
  where
   parseForwardMessages :: A.Value -> T.Parser ForwardMessages
   parseForwardMessages = A.withObject "ForwardMessages" $ \o -> do
    remove_caption <- o A..:? "remove_caption"
    send_copy <- o A..:? "send_copy"
    as_album <- o A..:? "as_album"
    options <- o A..:? "options"
    message_ids <- o A..:? "message_ids"
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ForwardMessages { remove_caption = remove_caption, send_copy = send_copy, as_album = as_album, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }