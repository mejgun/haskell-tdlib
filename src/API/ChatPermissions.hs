-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatPermissions where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

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
    can_pin_messages <- optional $ o A..: "can_pin_messages"
    can_invite_users <- optional $ o A..: "can_invite_users"
    can_change_info <- optional $ o A..: "can_change_info"
    can_add_web_page_previews <- optional $ o A..: "can_add_web_page_previews"
    can_send_other_messages <- optional $ o A..: "can_send_other_messages"
    can_send_polls <- optional $ o A..: "can_send_polls"
    can_send_media_messages <- optional $ o A..: "can_send_media_messages"
    can_send_messages <- optional $ o A..: "can_send_messages"
    return $ ChatPermissions { can_pin_messages = can_pin_messages, can_invite_users = can_invite_users, can_change_info = can_change_info, can_add_web_page_previews = can_add_web_page_previews, can_send_other_messages = can_send_other_messages, can_send_polls = can_send_polls, can_send_media_messages = can_send_media_messages, can_send_messages = can_send_messages }