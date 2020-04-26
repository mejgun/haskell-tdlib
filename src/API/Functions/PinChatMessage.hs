-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PinChatMessage where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Pins a message in a chat; requires can_pin_messages rights 
-- 
-- __chat_id__ Identifier of the chat
-- 
-- __message_id__ Identifier of the new pinned message
-- 
-- __disable_notification__ True, if there should be no notification about the pinned message
data PinChatMessage = 
 PinChatMessage { disable_notification :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON PinChatMessage where
 toJSON (PinChatMessage { disable_notification = disable_notification, message_id = message_id, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "pinChatMessage", "disable_notification" A..= disable_notification, "message_id" A..= message_id, "chat_id" A..= chat_id ]

instance T.FromJSON PinChatMessage where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "pinChatMessage" -> parsePinChatMessage v
   _ -> mempty
  where
   parsePinChatMessage :: A.Value -> T.Parser PinChatMessage
   parsePinChatMessage = A.withObject "PinChatMessage" $ \o -> do
    disable_notification <- o A..:? "disable_notification"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ PinChatMessage { disable_notification = disable_notification, message_id = message_id, chat_id = chat_id }