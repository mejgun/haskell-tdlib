-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PinChatMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Pins a message in a chat; requires can_pin_messages rights or can_edit_messages rights in the channel
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __message_id__ Identifier of the new pinned message
-- 
-- __disable_notification__ Pass true to disable notification about the pinned message. Notifications are always disabled in channels and private chats
-- 
-- __only_for_self__ Pass true to pin the message only for self; private chats only
data PinChatMessage = 

 PinChatMessage { only_for_self :: Maybe Bool, disable_notification :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Eq)

instance Show PinChatMessage where
 show PinChatMessage { only_for_self=only_for_self, disable_notification=disable_notification, message_id=message_id, chat_id=chat_id } =
  "PinChatMessage" ++ cc [p "only_for_self" only_for_self, p "disable_notification" disable_notification, p "message_id" message_id, p "chat_id" chat_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON PinChatMessage where
 toJSON PinChatMessage { only_for_self = only_for_self, disable_notification = disable_notification, message_id = message_id, chat_id = chat_id } =
  A.object [ "@type" A..= T.String "pinChatMessage", "only_for_self" A..= only_for_self, "disable_notification" A..= disable_notification, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON PinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pinChatMessage" -> parsePinChatMessage v
   _ -> mempty
  where
   parsePinChatMessage :: A.Value -> T.Parser PinChatMessage
   parsePinChatMessage = A.withObject "PinChatMessage" $ \o -> do
    only_for_self <- o A..:? "only_for_self"
    disable_notification <- o A..:? "disable_notification"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PinChatMessage { only_for_self = only_for_self, disable_notification = disable_notification, message_id = message_id, chat_id = chat_id }
 parseJSON _ = mempty
