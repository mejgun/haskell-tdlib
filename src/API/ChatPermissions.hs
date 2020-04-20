-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPermissions where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data ChatPermissions = 
 ChatPermissions { can_pin_messages :: Bool, can_invite_users :: Bool, can_change_info :: Bool, can_add_web_page_previews :: Bool, can_send_other_messages :: Bool, can_send_polls :: Bool, can_send_media_messages :: Bool, can_send_messages :: Bool }  -- deriving (Show)

instance T.ToJSON ChatPermissions where
 toJSON (ChatPermissions { can_pin_messages = can_pin_messages, can_invite_users = can_invite_users, can_change_info = can_change_info, can_add_web_page_previews = can_add_web_page_previews, can_send_other_messages = can_send_other_messages, can_send_polls = can_send_polls, can_send_media_messages = can_send_media_messages, can_send_messages = can_send_messages }) =
  A.object [ "@type" A..= T.String "chatPermissions", "can_pin_messages" A..= can_pin_messages, "can_invite_users" A..= can_invite_users, "can_change_info" A..= can_change_info, "can_add_web_page_previews" A..= can_add_web_page_previews, "can_send_other_messages" A..= can_send_other_messages, "can_send_polls" A..= can_send_polls, "can_send_media_messages" A..= can_send_media_messages, "can_send_messages" A..= can_send_messages ]
-- chatPermissions ChatPermissions  { can_pin_messages :: Bool, can_invite_users :: Bool, can_change_info :: Bool, can_add_web_page_previews :: Bool, can_send_other_messages :: Bool, can_send_polls :: Bool, can_send_media_messages :: Bool, can_send_messages :: Bool } 

