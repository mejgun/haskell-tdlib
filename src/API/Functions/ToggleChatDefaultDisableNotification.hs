-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ToggleChatDefaultDisableNotification where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ToggleChatDefaultDisableNotification = 
 ToggleChatDefaultDisableNotification { default_disable_notification :: Bool, chat_id :: Int }  -- deriving (Show)

instance T.ToJSON ToggleChatDefaultDisableNotification where
 toJSON (ToggleChatDefaultDisableNotification { default_disable_notification = default_disable_notification, chat_id = chat_id }) =
  A.object [ "@type" A..= T.String "toggleChatDefaultDisableNotification", "default_disable_notification" A..= default_disable_notification, "chat_id" A..= chat_id ]
-- toggleChatDefaultDisableNotification ToggleChatDefaultDisableNotification  { default_disable_notification :: Bool, chat_id :: Int } 

