-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPermissions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Describes actions that a user is allowed to take in a chat
-- 
-- __can_send_messages__ True, if the user can send text messages, contacts, locations, and venues
-- 
-- __can_send_media_messages__ True, if the user can send audio files, documents, photos, videos, video notes, and voice notes. Implies can_send_messages permissions
-- 
-- __can_send_polls__ True, if the user can send polls. Implies can_send_messages permissions
-- 
-- __can_send_other_messages__ True, if the user can send animations, games, and stickers and use inline bots. Implies can_send_messages permissions
-- 
-- __can_add_web_page_previews__ True, if the user may add a web page preview to their messages. Implies can_send_messages permissions
-- 
-- __can_change_info__ True, if the user can change the chat title, photo, and other settings
-- 
-- __can_invite_users__ True, if the user can invite new users to the chat
-- 
-- __can_pin_messages__ True, if the user can pin messages
data ChatPermissions = 

 ChatPermissions { can_pin_messages :: Maybe Bool, can_invite_users :: Maybe Bool, can_change_info :: Maybe Bool, can_add_web_page_previews :: Maybe Bool, can_send_other_messages :: Maybe Bool, can_send_polls :: Maybe Bool, can_send_media_messages :: Maybe Bool, can_send_messages :: Maybe Bool }  deriving (Show, Eq)

instance T.ToJSON ChatPermissions where
 toJSON (ChatPermissions { can_pin_messages = can_pin_messages, can_invite_users = can_invite_users, can_change_info = can_change_info, can_add_web_page_previews = can_add_web_page_previews, can_send_other_messages = can_send_other_messages, can_send_polls = can_send_polls, can_send_media_messages = can_send_media_messages, can_send_messages = can_send_messages }) =
  A.object [ "@type" A..= T.String "chatPermissions", "can_pin_messages" A..= can_pin_messages, "can_invite_users" A..= can_invite_users, "can_change_info" A..= can_change_info, "can_add_web_page_previews" A..= can_add_web_page_previews, "can_send_other_messages" A..= can_send_other_messages, "can_send_polls" A..= can_send_polls, "can_send_media_messages" A..= can_send_media_messages, "can_send_messages" A..= can_send_messages ]

instance T.FromJSON ChatPermissions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatPermissions" -> parseChatPermissions v
   _ -> mempty
  where
   parseChatPermissions :: A.Value -> T.Parser ChatPermissions
   parseChatPermissions = A.withObject "ChatPermissions" $ \o -> do
    can_pin_messages <- o A..:? "can_pin_messages"
    can_invite_users <- o A..:? "can_invite_users"
    can_change_info <- o A..:? "can_change_info"
    can_add_web_page_previews <- o A..:? "can_add_web_page_previews"
    can_send_other_messages <- o A..:? "can_send_other_messages"
    can_send_polls <- o A..:? "can_send_polls"
    can_send_media_messages <- o A..:? "can_send_media_messages"
    can_send_messages <- o A..:? "can_send_messages"
    return $ ChatPermissions { can_pin_messages = can_pin_messages, can_invite_users = can_invite_users, can_change_info = can_change_info, can_add_web_page_previews = can_add_web_page_previews, can_send_other_messages = can_send_other_messages, can_send_polls = can_send_polls, can_send_media_messages = can_send_media_messages, can_send_messages = can_send_messages }