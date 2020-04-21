-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage
import {-# SOURCE #-} qualified API.ChatActionBar as ChatActionBar
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.ChatPhoto as ChatPhoto
import {-# SOURCE #-} qualified API.ChatList as ChatList
import {-# SOURCE #-} qualified API.ChatType as ChatType

--main = putStrLn "ok"

data Chat = 
 Chat { client_data :: String, draft_message :: DraftMessage.DraftMessage, reply_markup_message_id :: Int, pinned_message_id :: Int, action_bar :: ChatActionBar.ChatActionBar, notification_settings :: ChatNotificationSettings.ChatNotificationSettings, unread_mention_count :: Int, last_read_outbox_message_id :: Int, last_read_inbox_message_id :: Int, unread_count :: Int, default_disable_notification :: Bool, can_be_reported :: Bool, can_be_deleted_for_all_users :: Bool, can_be_deleted_only_for_self :: Bool, has_scheduled_messages :: Bool, is_sponsored :: Bool, is_marked_as_unread :: Bool, is_pinned :: Bool, order :: Int, last_message :: Message.Message, permissions :: ChatPermissions.ChatPermissions, photo :: ChatPhoto.ChatPhoto, title :: String, chat_list :: ChatList.ChatList, _type :: ChatType.ChatType, _id :: Int }  deriving (Show)

instance T.ToJSON Chat where
 toJSON (Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pinned_message_id = pinned_message_id, action_bar = action_bar, notification_settings = notification_settings, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_sponsored = is_sponsored, is_marked_as_unread = is_marked_as_unread, is_pinned = is_pinned, order = order, last_message = last_message, permissions = permissions, photo = photo, title = title, chat_list = chat_list, _type = _type, _id = _id }) =
  A.object [ "@type" A..= T.String "chat", "client_data" A..= client_data, "draft_message" A..= draft_message, "reply_markup_message_id" A..= reply_markup_message_id, "pinned_message_id" A..= pinned_message_id, "action_bar" A..= action_bar, "notification_settings" A..= notification_settings, "unread_mention_count" A..= unread_mention_count, "last_read_outbox_message_id" A..= last_read_outbox_message_id, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "unread_count" A..= unread_count, "default_disable_notification" A..= default_disable_notification, "can_be_reported" A..= can_be_reported, "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users, "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self, "has_scheduled_messages" A..= has_scheduled_messages, "is_sponsored" A..= is_sponsored, "is_marked_as_unread" A..= is_marked_as_unread, "is_pinned" A..= is_pinned, "order" A..= order, "last_message" A..= last_message, "permissions" A..= permissions, "photo" A..= photo, "title" A..= title, "chat_list" A..= chat_list, "type" A..= _type, "id" A..= _id ]



instance T.FromJSON Chat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chat" -> parseChat v

   _ -> mempty ""
  where
   parseChat :: A.Value -> T.Parser Chat
   parseChat = A.withObject "Chat" $ \o -> do
    client_data <- o A..: "client_data"
    draft_message <- o A..: "draft_message"
    reply_markup_message_id <- o A..: "reply_markup_message_id"
    pinned_message_id <- o A..: "pinned_message_id"
    action_bar <- o A..: "action_bar"
    notification_settings <- o A..: "notification_settings"
    unread_mention_count <- o A..: "unread_mention_count"
    last_read_outbox_message_id <- o A..: "last_read_outbox_message_id"
    last_read_inbox_message_id <- o A..: "last_read_inbox_message_id"
    unread_count <- o A..: "unread_count"
    default_disable_notification <- o A..: "default_disable_notification"
    can_be_reported <- o A..: "can_be_reported"
    can_be_deleted_for_all_users <- o A..: "can_be_deleted_for_all_users"
    can_be_deleted_only_for_self <- o A..: "can_be_deleted_only_for_self"
    has_scheduled_messages <- o A..: "has_scheduled_messages"
    is_sponsored <- o A..: "is_sponsored"
    is_marked_as_unread <- o A..: "is_marked_as_unread"
    is_pinned <- o A..: "is_pinned"
    order <- o A..: "order"
    last_message <- o A..: "last_message"
    permissions <- o A..: "permissions"
    photo <- o A..: "photo"
    title <- o A..: "title"
    chat_list <- o A..: "chat_list"
    _type <- o A..: "type"
    _id <- o A..: "id"
    return $ Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pinned_message_id = pinned_message_id, action_bar = action_bar, notification_settings = notification_settings, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_sponsored = is_sponsored, is_marked_as_unread = is_marked_as_unread, is_pinned = is_pinned, order = order, last_message = last_message, permissions = permissions, photo = photo, title = title, chat_list = chat_list, _type = _type, _id = _id }