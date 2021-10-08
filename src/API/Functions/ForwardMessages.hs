-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ForwardMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.MessageSendOptions as MessageSendOptions

-- |
-- 
-- Forwards previously sent messages. Returns the forwarded messages in the same order as the message identifiers passed in message_ids. If a message can't be forwarded, null will be returned instead of the message
-- 
-- __chat_id__ Identifier of the chat to which to forward messages
-- 
-- __from_chat_id__ Identifier of the chat from which to forward messages
-- 
-- __message_ids__ Identifiers of the messages to forward. Message identifiers must be in a strictly increasing order. At most 100 messages can be forwarded simultaneously
-- 
-- __options__ Options to be used to send the messages; pass null to use default options
-- 
-- __send_copy__ If true, content of the messages will be copied without reference to the original sender. Always true if the messages are forwarded to a secret chat or are local
-- 
-- __remove_caption__ If true, media caption of message copies will be removed. Ignored if send_copy is false
-- 
-- __only_preview__ If true, messages will not be forwarded and instead fake messages will be returned
data ForwardMessages = 

 ForwardMessages { only_preview :: Maybe Bool, remove_caption :: Maybe Bool, send_copy :: Maybe Bool, options :: Maybe MessageSendOptions.MessageSendOptions, message_ids :: Maybe [Int], from_chat_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show ForwardMessages where
 show ForwardMessages { only_preview=only_preview, remove_caption=remove_caption, send_copy=send_copy, options=options, message_ids=message_ids, from_chat_id=from_chat_id, chat_id=chat_id } =
  "ForwardMessages" ++ cc [p "only_preview" only_preview, p "remove_caption" remove_caption, p "send_copy" send_copy, p "options" options, p "message_ids" message_ids, p "from_chat_id" from_chat_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ForwardMessages where
 toJSON ForwardMessages { only_preview = only_preview, remove_caption = remove_caption, send_copy = send_copy, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "forwardMessages", "only_preview" A..= only_preview, "remove_caption" A..= remove_caption, "send_copy" A..= send_copy, "options" A..= options, "message_ids" A..= message_ids, "from_chat_id" A..= from_chat_id, "chat_id" A..= chat_id ]

instance T.FromJSON ForwardMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "forwardMessages" -> parseForwardMessages v
   _ -> mempty
  where
   parseForwardMessages :: A.Value -> T.Parser ForwardMessages
   parseForwardMessages = A.withObject "ForwardMessages" $ \o -> do
    only_preview <- o A..:? "only_preview"
    remove_caption <- o A..:? "remove_caption"
    send_copy <- o A..:? "send_copy"
    options <- o A..:? "options"
    message_ids <- o A..:? "message_ids"
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ForwardMessages { only_preview = only_preview, remove_caption = remove_caption, send_copy = send_copy, options = options, message_ids = message_ids, from_chat_id = from_chat_id, chat_id = chat_id }
 parseJSON _ = mempty
