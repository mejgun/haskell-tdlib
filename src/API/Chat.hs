-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Chat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.DraftMessage as DraftMessage
import {-# SOURCE #-} qualified API.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import {-# SOURCE #-} qualified API.VideoChat as VideoChat
import {-# SOURCE #-} qualified API.ChatActionBar as ChatActionBar
import {-# SOURCE #-} qualified API.ChatNotificationSettings as ChatNotificationSettings
import {-# SOURCE #-} qualified API.MessageSender as MessageSender
import {-# SOURCE #-} qualified API.ChatPosition as ChatPosition
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.ChatPhotoInfo as ChatPhotoInfo
import {-# SOURCE #-} qualified API.ChatType as ChatType

-- |
-- 
-- A chat. (Can be a private chat, basic group, supergroup, or secret chat)
-- 
-- __id__ Chat unique identifier
-- 
-- __type__ Type of the chat
-- 
-- __title__ Chat title
-- 
-- __photo__ Chat photo; may be null
-- 
-- __permissions__ Actions that non-administrator chat members are allowed to take in the chat
-- 
-- __last_message__ Last message in the chat; may be null
-- 
-- __positions__ Positions of the chat in chat lists
-- 
-- __message_sender_id__ Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
-- 
-- __has_protected_content__ True, if chat content can't be saved locally, forwarded, or copied
-- 
-- __is_marked_as_unread__ True, if the chat is marked as unread
-- 
-- __is_blocked__ True, if the chat is blocked by the current user and private messages from the chat can't be received
-- 
-- __has_scheduled_messages__ True, if the chat has scheduled messages
-- 
-- __can_be_deleted_only_for_self__ True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
-- 
-- __can_be_deleted_for_all_users__ True, if the chat messages can be deleted for all users
-- 
-- __can_be_reported__ True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
-- 
-- __default_disable_notification__ Default value of the disable_notification parameter, used when a message is sent to the chat
-- 
-- __unread_count__ Number of unread messages in the chat
-- 
-- __last_read_inbox_message_id__ Identifier of the last read incoming message
-- 
-- __last_read_outbox_message_id__ Identifier of the last read outgoing message
-- 
-- __unread_mention_count__ Number of unread messages with a mention/reply in the chat
-- 
-- __unread_reaction_count__ Number of messages with unread reactions in the chat
-- 
-- __notification_settings__ Notification settings for the chat
-- 
-- __available_reactions__ List of reactions, available in the chat
-- 
-- __message_ttl__ Current message Time To Live setting (self-destruct timer) for the chat; 0 if not defined. TTL is counted from the time message or its content is viewed in secret chats and from the send date in other chats
-- 
-- __theme_name__ If non-empty, name of a theme, set for the chat
-- 
-- __action_bar__ Information about actions which must be possible to do through the chat action bar; may be null
-- 
-- __video_chat__ Information about video chat of the chat
-- 
-- __pending_join_requests__ Information about pending join requests; may be null
-- 
-- __reply_markup_message_id__ Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
-- 
-- __draft_message__ A draft of a message in the chat; may be null
-- 
-- __client_data__ Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
data Chat = 

 Chat { client_data :: Maybe String, draft_message :: Maybe DraftMessage.DraftMessage, reply_markup_message_id :: Maybe Int, pending_join_requests :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo, video_chat :: Maybe VideoChat.VideoChat, action_bar :: Maybe ChatActionBar.ChatActionBar, theme_name :: Maybe String, message_ttl :: Maybe Int, available_reactions :: Maybe [String], notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings, unread_reaction_count :: Maybe Int, unread_mention_count :: Maybe Int, last_read_outbox_message_id :: Maybe Int, last_read_inbox_message_id :: Maybe Int, unread_count :: Maybe Int, default_disable_notification :: Maybe Bool, can_be_reported :: Maybe Bool, can_be_deleted_for_all_users :: Maybe Bool, can_be_deleted_only_for_self :: Maybe Bool, has_scheduled_messages :: Maybe Bool, is_blocked :: Maybe Bool, is_marked_as_unread :: Maybe Bool, has_protected_content :: Maybe Bool, message_sender_id :: Maybe MessageSender.MessageSender, positions :: Maybe [ChatPosition.ChatPosition], last_message :: Maybe Message.Message, permissions :: Maybe ChatPermissions.ChatPermissions, photo :: Maybe ChatPhotoInfo.ChatPhotoInfo, title :: Maybe String, _type :: Maybe ChatType.ChatType, _id :: Maybe Int }  deriving (Eq)

instance Show Chat where
 show Chat { client_data=client_data, draft_message=draft_message, reply_markup_message_id=reply_markup_message_id, pending_join_requests=pending_join_requests, video_chat=video_chat, action_bar=action_bar, theme_name=theme_name, message_ttl=message_ttl, available_reactions=available_reactions, notification_settings=notification_settings, unread_reaction_count=unread_reaction_count, unread_mention_count=unread_mention_count, last_read_outbox_message_id=last_read_outbox_message_id, last_read_inbox_message_id=last_read_inbox_message_id, unread_count=unread_count, default_disable_notification=default_disable_notification, can_be_reported=can_be_reported, can_be_deleted_for_all_users=can_be_deleted_for_all_users, can_be_deleted_only_for_self=can_be_deleted_only_for_self, has_scheduled_messages=has_scheduled_messages, is_blocked=is_blocked, is_marked_as_unread=is_marked_as_unread, has_protected_content=has_protected_content, message_sender_id=message_sender_id, positions=positions, last_message=last_message, permissions=permissions, photo=photo, title=title, _type=_type, _id=_id } =
  "Chat" ++ cc [p "client_data" client_data, p "draft_message" draft_message, p "reply_markup_message_id" reply_markup_message_id, p "pending_join_requests" pending_join_requests, p "video_chat" video_chat, p "action_bar" action_bar, p "theme_name" theme_name, p "message_ttl" message_ttl, p "available_reactions" available_reactions, p "notification_settings" notification_settings, p "unread_reaction_count" unread_reaction_count, p "unread_mention_count" unread_mention_count, p "last_read_outbox_message_id" last_read_outbox_message_id, p "last_read_inbox_message_id" last_read_inbox_message_id, p "unread_count" unread_count, p "default_disable_notification" default_disable_notification, p "can_be_reported" can_be_reported, p "can_be_deleted_for_all_users" can_be_deleted_for_all_users, p "can_be_deleted_only_for_self" can_be_deleted_only_for_self, p "has_scheduled_messages" has_scheduled_messages, p "is_blocked" is_blocked, p "is_marked_as_unread" is_marked_as_unread, p "has_protected_content" has_protected_content, p "message_sender_id" message_sender_id, p "positions" positions, p "last_message" last_message, p "permissions" permissions, p "photo" photo, p "title" title, p "_type" _type, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Chat where
 toJSON Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pending_join_requests = pending_join_requests, video_chat = video_chat, action_bar = action_bar, theme_name = theme_name, message_ttl = message_ttl, available_reactions = available_reactions, notification_settings = notification_settings, unread_reaction_count = unread_reaction_count, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_blocked = is_blocked, is_marked_as_unread = is_marked_as_unread, has_protected_content = has_protected_content, message_sender_id = message_sender_id, positions = positions, last_message = last_message, permissions = permissions, photo = photo, title = title, _type = _type, _id = _id } =
  A.object [ "@type" A..= T.String "chat", "client_data" A..= client_data, "draft_message" A..= draft_message, "reply_markup_message_id" A..= reply_markup_message_id, "pending_join_requests" A..= pending_join_requests, "video_chat" A..= video_chat, "action_bar" A..= action_bar, "theme_name" A..= theme_name, "message_ttl" A..= message_ttl, "available_reactions" A..= available_reactions, "notification_settings" A..= notification_settings, "unread_reaction_count" A..= unread_reaction_count, "unread_mention_count" A..= unread_mention_count, "last_read_outbox_message_id" A..= last_read_outbox_message_id, "last_read_inbox_message_id" A..= last_read_inbox_message_id, "unread_count" A..= unread_count, "default_disable_notification" A..= default_disable_notification, "can_be_reported" A..= can_be_reported, "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users, "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self, "has_scheduled_messages" A..= has_scheduled_messages, "is_blocked" A..= is_blocked, "is_marked_as_unread" A..= is_marked_as_unread, "has_protected_content" A..= has_protected_content, "message_sender_id" A..= message_sender_id, "positions" A..= positions, "last_message" A..= last_message, "permissions" A..= permissions, "photo" A..= photo, "title" A..= title, "type" A..= _type, "id" A..= _id ]

instance T.FromJSON Chat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chat" -> parseChat v
   _ -> mempty
  where
   parseChat :: A.Value -> T.Parser Chat
   parseChat = A.withObject "Chat" $ \o -> do
    client_data <- o A..:? "client_data"
    draft_message <- o A..:? "draft_message"
    reply_markup_message_id <- mconcat [ o A..:? "reply_markup_message_id", readMaybe <$> (o A..: "reply_markup_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    pending_join_requests <- o A..:? "pending_join_requests"
    video_chat <- o A..:? "video_chat"
    action_bar <- o A..:? "action_bar"
    theme_name <- o A..:? "theme_name"
    message_ttl <- mconcat [ o A..:? "message_ttl", readMaybe <$> (o A..: "message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    available_reactions <- o A..:? "available_reactions"
    notification_settings <- o A..:? "notification_settings"
    unread_reaction_count <- mconcat [ o A..:? "unread_reaction_count", readMaybe <$> (o A..: "unread_reaction_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    unread_mention_count <- mconcat [ o A..:? "unread_mention_count", readMaybe <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    last_read_outbox_message_id <- mconcat [ o A..:? "last_read_outbox_message_id", readMaybe <$> (o A..: "last_read_outbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    last_read_inbox_message_id <- mconcat [ o A..:? "last_read_inbox_message_id", readMaybe <$> (o A..: "last_read_inbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    unread_count <- mconcat [ o A..:? "unread_count", readMaybe <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    default_disable_notification <- o A..:? "default_disable_notification"
    can_be_reported <- o A..:? "can_be_reported"
    can_be_deleted_for_all_users <- o A..:? "can_be_deleted_for_all_users"
    can_be_deleted_only_for_self <- o A..:? "can_be_deleted_only_for_self"
    has_scheduled_messages <- o A..:? "has_scheduled_messages"
    is_blocked <- o A..:? "is_blocked"
    is_marked_as_unread <- o A..:? "is_marked_as_unread"
    has_protected_content <- o A..:? "has_protected_content"
    message_sender_id <- o A..:? "message_sender_id"
    positions <- o A..:? "positions"
    last_message <- o A..:? "last_message"
    permissions <- o A..:? "permissions"
    photo <- o A..:? "photo"
    title <- o A..:? "title"
    _type <- o A..:? "type"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Chat { client_data = client_data, draft_message = draft_message, reply_markup_message_id = reply_markup_message_id, pending_join_requests = pending_join_requests, video_chat = video_chat, action_bar = action_bar, theme_name = theme_name, message_ttl = message_ttl, available_reactions = available_reactions, notification_settings = notification_settings, unread_reaction_count = unread_reaction_count, unread_mention_count = unread_mention_count, last_read_outbox_message_id = last_read_outbox_message_id, last_read_inbox_message_id = last_read_inbox_message_id, unread_count = unread_count, default_disable_notification = default_disable_notification, can_be_reported = can_be_reported, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, has_scheduled_messages = has_scheduled_messages, is_blocked = is_blocked, is_marked_as_unread = is_marked_as_unread, has_protected_content = has_protected_content, message_sender_id = message_sender_id, positions = positions, last_message = last_message, permissions = permissions, photo = photo, title = title, _type = _type, _id = _id }
 parseJSON _ = mempty
