-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chat where

import Control.Applicative (optional)
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

data Chat = 
 Chat { client_data :: Maybe String, draft_message :: Maybe DraftMessage.DraftMessage, reply_markup_message_id :: Maybe Int, pinned_message_id :: Maybe Int, action_bar :: Maybe ChatActionBar.ChatActionBar, notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, unread_mention_count :: Maybe Int, last_read_outbox_message_id :: Maybe Int, last_read_inbox_message_id :: Maybe Int, unread_count :: Maybe Int, default_disable_notification :: Maybe Bool, can_be_reported :: Maybe Bool, can_be_deleted_for_all_users :: Maybe Bool, can_be_deleted_only_for_self :: Maybe Bool, has_scheduled_messages :: Maybe Bool, is_sponsored :: Maybe Bool, is_marked_as_unread :: Maybe Bool, is_pinned :: Maybe Bool, order :: Maybe Int, last_message :: Maybe Message.Message, permissions :: Maybe ChatPermissions.ChatPermissions, photo :: Maybe ChatPhoto.ChatPhoto, title :: Maybe String, chat_list :: Maybe ChatList.ChatList, _type :: Maybe ChatType.ChatType, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Chat where
 toJSON (Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pinned_message_id = pinned_message_id, action_bar = action_bar, notification_settings = notification_settings, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_sponsored = is_sponsored, is_marked_as_unread = is_marked_as_unread, is_pinned = is_pinned, order = order, last_message = last_message, permissions = permissions, photo = photo, title = title, chat_list = chat_list, _type = _type, _id = _id }) =
  A.object [ "@type" A..= T.String "chat", "client_data" A..= client_data, "draft_message" A..= draft_message, "reply_markup_message_id" A..= reply_markup_message_id, "pinned_message_id" A..= pinned_message_id, "action_bar" A..= action_bar, "notification_settings" A..= notification_settings, "unread_mention_count" A..= unread_mention_count, "last_read_outbox_message_id" A..= last_read_outbox_message_id, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "unread_count" A..= unread_count, "default_disable_notification" A..= default_disable_notification, "can_be_reported" A..= can_be_reported, "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users, "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self, "has_scheduled_messages" A..= has_scheduled_messages, "is_sponsored" A..= is_sponsored, "is_marked_as_unread" A..= is_marked_as_unread, "is_pinned" A..= is_pinned, "order" A..= order, "last_message" A..= last_message, "permissions" A..= permissions, "photo" A..= photo, "title" A..= title, "chat_list" A..= chat_list, "type" A..= _type, "id" A..= _id ]

instance T.FromJSON Chat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chat" -> parseChat v
   _ -> mempty
  where
   parseChat :: A.Value -> T.Parser Chat
   parseChat = A.withObject "Chat" $ \o -> do
    client_data <- optional $ o A..: "client_data"
    draft_message <- optional $ o A..: "draft_message"
    reply_markup_message_id <- optional $ o A..: "reply_markup_message_id"
    pinned_message_id <- optional $ o A..: "pinned_message_id"
    action_bar <- optional $ o A..: "action_bar"
    notification_settings <- optional $ o A..: "notification_settings"
    unread_mention_count <- optional $ o A..: "unread_mention_count"
    last_read_outbox_message_id <- optional $ o A..: "last_read_outbox_message_id"
    last_read_inbox_message_id <- optional $ o A..: "last_read_inbox_message_id"
    unread_count <- optional $ o A..: "unread_count"
    default_disable_notification <- optional $ o A..: "default_disable_notification"
    can_be_reported <- optional $ o A..: "can_be_reported"
    can_be_deleted_for_all_users <- optional $ o A..: "can_be_deleted_for_all_users"
    can_be_deleted_only_for_self <- optional $ o A..: "can_be_deleted_only_for_self"
    has_scheduled_messages <- optional $ o A..: "has_scheduled_messages"
    is_sponsored <- optional $ o A..: "is_sponsored"
    is_marked_as_unread <- optional $ o A..: "is_marked_as_unread"
    is_pinned <- optional $ o A..: "is_pinned"
    order <- optional $ o A..: "order"
    last_message <- optional $ o A..: "last_message"
    permissions <- optional $ o A..: "permissions"
    photo <- optional $ o A..: "photo"
    title <- optional $ o A..: "title"
    chat_list <- optional $ o A..: "chat_list"
    _type <- optional $ o A..: "type"
    _id <- optional $ o A..: "id"
    return $ Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pinned_message_id = pinned_message_id, action_bar = action_bar, notification_settings = notification_settings, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_sponsored = is_sponsored, is_marked_as_unread = is_marked_as_unread, is_pinned = is_pinned, order = order, last_message = last_message, permissions = permissions, photo = photo, title = title, chat_list = chat_list, _type = _type, _id = _id }