-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatDefaultDisableNotification where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    default_disable_notification <- optional $ o A..: "default_disable_notification"
    chat_id <- optional $ o A..: "chat_id"
    return $ ToggleChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }