-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.PinChatMessage where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data PinChatMessage = 
 PinChatMessage { disable_notification :: Maybe Bool, message_id :: Maybe Int, chat_id :: Maybe Int }  deriving (Show)

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
    disable_notification <- optional $ o A..: "disable_notification"
    message_id <- optional $ o A..: "message_id"
    chat_id <- optional $ o A..: "chat_id"
    return $ PinChatMessage { disable_notification = disable_notification, message_id = message_id, chat_id = chat_id }