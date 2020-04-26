-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatDefaultDisableNotification where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Changes the value of the default disable_notification parameter, used when a message is sent to a chat 
-- 
-- __chat_id__ Chat identifier
-- 
-- __default_disable_notification__ New value of default_disable_notification
data ToggleChatDefaultDisableNotification = 
 ToggleChatDefaultDisableNotification { default_disable_notification :: Maybe Bool, chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ToggleChatDefaultDisableNotification where
 toJSON (ToggleChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatDefaultDisableNotification", "default_disable_notification" A..= default_disable_notification, "chat_id" A..= chat_id ]

instance T.FromJSON ToggleChatDefaultDisableNotification where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "toggleChatDefaultDisableNotification" -> parseToggleChatDefaultDisableNotification v
   _ -> mempty
  where
   parseToggleChatDefaultDisableNotification :: A.Value -> T.Parser ToggleChatDefaultDisableNotification
   parseToggleChatDefaultDisableNotification = A.withObject "ToggleChatDefaultDisableNotification" $ \o -> do
    default_disable_notification <- o A..:? "default_disable_notification"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ToggleChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }