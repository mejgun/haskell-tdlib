{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.Chat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ChatActionBar as ChatActionBar
import qualified TD.Reply.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Reply.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Reply.ChatPermissions as ChatPermissions
import qualified TD.Reply.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Reply.ChatPosition as ChatPosition
import qualified TD.Reply.ChatType as ChatType
import qualified TD.Reply.DraftMessage as DraftMessage
import qualified TD.Reply.Message as Message
import qualified TD.Reply.MessageSender as MessageSender
import qualified TD.Reply.VideoChat as VideoChat
import qualified Utils as U

data Chat = -- | A chat. (Can be a private chat, basic group, supergroup, or secret chat)
  Chat
  { -- | Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
    client_data :: Maybe String,
    -- | A draft of a message in the chat; may be null
    draft_message :: Maybe DraftMessage.DraftMessage,
    -- | Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    reply_markup_message_id :: Maybe Int,
    -- | Information about pending join requests; may be null
    pending_join_requests :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo,
    -- | Information about video chat of the chat
    video_chat :: Maybe VideoChat.VideoChat,
    -- | Information about actions which must be possible to do through the chat action bar; may be null
    action_bar :: Maybe ChatActionBar.ChatActionBar,
    -- | If non-empty, name of a theme, set for the chat
    theme_name :: Maybe String,
    -- | Current message Time To Live setting (self-destruct timer) for the chat; 0 if not defined. TTL is counted from the time message or its content is viewed in secret chats and from the send date in other chats
    message_ttl :: Maybe Int,
    -- | List of reactions, available in the chat
    available_reactions :: Maybe [String],
    -- | Notification settings for the chat
    notification_settings :: Maybe ChatNotificationSettings.ChatNotificationSettings,
    -- | Number of messages with unread reactions in the chat
    unread_reaction_count :: Maybe Int,
    -- | Number of unread messages with a mention/reply in the chat
    unread_mention_count :: Maybe Int,
    -- | Identifier of the last read outgoing message
    last_read_outbox_message_id :: Maybe Int,
    -- | Identifier of the last read incoming message
    last_read_inbox_message_id :: Maybe Int,
    -- | Number of unread messages in the chat
    unread_count :: Maybe Int,
    -- | Default value of the disable_notification parameter, used when a message is sent to the chat
    default_disable_notification :: Maybe Bool,
    -- | True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
    can_be_reported :: Maybe Bool,
    -- | True, if the chat messages can be deleted for all users
    can_be_deleted_for_all_users :: Maybe Bool,
    -- | True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
    can_be_deleted_only_for_self :: Maybe Bool,
    -- | True, if the chat has scheduled messages
    has_scheduled_messages :: Maybe Bool,
    -- | True, if the chat is blocked by the current user and private messages from the chat can't be received
    is_blocked :: Maybe Bool,
    -- | True, if the chat is marked as unread
    is_marked_as_unread :: Maybe Bool,
    -- | True, if chat content can't be saved locally, forwarded, or copied
    has_protected_content :: Maybe Bool,
    -- | Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
    message_sender_id :: Maybe MessageSender.MessageSender,
    -- | Positions of the chat in chat lists
    positions :: Maybe [ChatPosition.ChatPosition],
    -- | Last message in the chat; may be null
    last_message :: Maybe Message.Message,
    -- | Actions that non-administrator chat members are allowed to take in the chat
    permissions :: Maybe ChatPermissions.ChatPermissions,
    -- | Chat photo; may be null
    photo :: Maybe ChatPhotoInfo.ChatPhotoInfo,
    -- | Chat title
    title :: Maybe String,
    -- | Type of the chat
    _type :: Maybe ChatType.ChatType,
    -- | Chat unique identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Chat where
  show
    Chat
      { client_data = client_data,
        draft_message = draft_message,
        reply_markup_message_id = reply_markup_message_id,
        pending_join_requests = pending_join_requests,
        video_chat = video_chat,
        action_bar = action_bar,
        theme_name = theme_name,
        message_ttl = message_ttl,
        available_reactions = available_reactions,
        notification_settings = notification_settings,
        unread_reaction_count = unread_reaction_count,
        unread_mention_count = unread_mention_count,
        last_read_outbox_message_id = last_read_outbox_message_id,
        last_read_inbox_message_id = last_read_inbox_message_id,
        unread_count = unread_count,
        default_disable_notification = default_disable_notification,
        can_be_reported = can_be_reported,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self,
        has_scheduled_messages = has_scheduled_messages,
        is_blocked = is_blocked,
        is_marked_as_unread = is_marked_as_unread,
        has_protected_content = has_protected_content,
        message_sender_id = message_sender_id,
        positions = positions,
        last_message = last_message,
        permissions = permissions,
        photo = photo,
        title = title,
        _type = _type,
        _id = _id
      } =
      "Chat"
        ++ U.cc
          [ U.p "client_data" client_data,
            U.p "draft_message" draft_message,
            U.p "reply_markup_message_id" reply_markup_message_id,
            U.p "pending_join_requests" pending_join_requests,
            U.p "video_chat" video_chat,
            U.p "action_bar" action_bar,
            U.p "theme_name" theme_name,
            U.p "message_ttl" message_ttl,
            U.p "available_reactions" available_reactions,
            U.p "notification_settings" notification_settings,
            U.p "unread_reaction_count" unread_reaction_count,
            U.p "unread_mention_count" unread_mention_count,
            U.p "last_read_outbox_message_id" last_read_outbox_message_id,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id,
            U.p "unread_count" unread_count,
            U.p "default_disable_notification" default_disable_notification,
            U.p "can_be_reported" can_be_reported,
            U.p "can_be_deleted_for_all_users" can_be_deleted_for_all_users,
            U.p "can_be_deleted_only_for_self" can_be_deleted_only_for_self,
            U.p "has_scheduled_messages" has_scheduled_messages,
            U.p "is_blocked" is_blocked,
            U.p "is_marked_as_unread" is_marked_as_unread,
            U.p "has_protected_content" has_protected_content,
            U.p "message_sender_id" message_sender_id,
            U.p "positions" positions,
            U.p "last_message" last_message,
            U.p "permissions" permissions,
            U.p "photo" photo,
            U.p "title" title,
            U.p "_type" _type,
            U.p "_id" _id
          ]

instance T.FromJSON Chat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chat" -> parseChat v
      _ -> fail ""
    where
      parseChat :: A.Value -> T.Parser Chat
      parseChat = A.withObject "Chat" $ \o -> do
        client_data_ <- o A..:? "client_data"
        draft_message_ <- o A..:? "draft_message"
        reply_markup_message_id_ <- mconcat [o A..:? "reply_markup_message_id", U.rm <$> (o A..: "reply_markup_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        pending_join_requests_ <- o A..:? "pending_join_requests"
        video_chat_ <- o A..:? "video_chat"
        action_bar_ <- o A..:? "action_bar"
        theme_name_ <- o A..:? "theme_name"
        message_ttl_ <- mconcat [o A..:? "message_ttl", U.rm <$> (o A..: "message_ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        available_reactions_ <- o A..:? "available_reactions"
        notification_settings_ <- o A..:? "notification_settings"
        unread_reaction_count_ <- mconcat [o A..:? "unread_reaction_count", U.rm <$> (o A..: "unread_reaction_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_mention_count_ <- mconcat [o A..:? "unread_mention_count", U.rm <$> (o A..: "unread_mention_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        last_read_outbox_message_id_ <- mconcat [o A..:? "last_read_outbox_message_id", U.rm <$> (o A..: "last_read_outbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        last_read_inbox_message_id_ <- mconcat [o A..:? "last_read_inbox_message_id", U.rm <$> (o A..: "last_read_inbox_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        unread_count_ <- mconcat [o A..:? "unread_count", U.rm <$> (o A..: "unread_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        default_disable_notification_ <- o A..:? "default_disable_notification"
        can_be_reported_ <- o A..:? "can_be_reported"
        can_be_deleted_for_all_users_ <- o A..:? "can_be_deleted_for_all_users"
        can_be_deleted_only_for_self_ <- o A..:? "can_be_deleted_only_for_self"
        has_scheduled_messages_ <- o A..:? "has_scheduled_messages"
        is_blocked_ <- o A..:? "is_blocked"
        is_marked_as_unread_ <- o A..:? "is_marked_as_unread"
        has_protected_content_ <- o A..:? "has_protected_content"
        message_sender_id_ <- o A..:? "message_sender_id"
        positions_ <- o A..:? "positions"
        last_message_ <- o A..:? "last_message"
        permissions_ <- o A..:? "permissions"
        photo_ <- o A..:? "photo"
        title_ <- o A..:? "title"
        _type_ <- o A..:? "type"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ Chat {client_data = client_data_, draft_message = draft_message_, reply_markup_message_id = reply_markup_message_id_, pending_join_requests = pending_join_requests_, video_chat = video_chat_, action_bar = action_bar_, theme_name = theme_name_, message_ttl = message_ttl_, available_reactions = available_reactions_, notification_settings = notification_settings_, unread_reaction_count = unread_reaction_count_, unread_mention_count = unread_mention_count_, last_read_outbox_message_id = last_read_outbox_message_id_, last_read_inbox_message_id = last_read_inbox_message_id_, unread_count = unread_count_, default_disable_notification = default_disable_notification_, can_be_reported = can_be_reported_, can_be_deleted_for_all_users = can_be_deleted_for_all_users_, can_be_deleted_only_for_self = can_be_deleted_only_for_self_, has_scheduled_messages = has_scheduled_messages_, is_blocked = is_blocked_, is_marked_as_unread = is_marked_as_unread_, has_protected_content = has_protected_content_, message_sender_id = message_sender_id_, positions = positions_, last_message = last_message_, permissions = permissions_, photo = photo_, title = title_, _type = _type_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON Chat where
  toJSON
    Chat
      { client_data = client_data,
        draft_message = draft_message,
        reply_markup_message_id = reply_markup_message_id,
        pending_join_requests = pending_join_requests,
        video_chat = video_chat,
        action_bar = action_bar,
        theme_name = theme_name,
        message_ttl = message_ttl,
        available_reactions = available_reactions,
        notification_settings = notification_settings,
        unread_reaction_count = unread_reaction_count,
        unread_mention_count = unread_mention_count,
        last_read_outbox_message_id = last_read_outbox_message_id,
        last_read_inbox_message_id = last_read_inbox_message_id,
        unread_count = unread_count,
        default_disable_notification = default_disable_notification,
        can_be_reported = can_be_reported,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self,
        has_scheduled_messages = has_scheduled_messages,
        is_blocked = is_blocked,
        is_marked_as_unread = is_marked_as_unread,
        has_protected_content = has_protected_content,
        message_sender_id = message_sender_id,
        positions = positions,
        last_message = last_message,
        permissions = permissions,
        photo = photo,
        title = title,
        _type = _type,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "chat",
          "client_data" A..= client_data,
          "draft_message" A..= draft_message,
          "reply_markup_message_id" A..= reply_markup_message_id,
          "pending_join_requests" A..= pending_join_requests,
          "video_chat" A..= video_chat,
          "action_bar" A..= action_bar,
          "theme_name" A..= theme_name,
          "message_ttl" A..= message_ttl,
          "available_reactions" A..= available_reactions,
          "notification_settings" A..= notification_settings,
          "unread_reaction_count" A..= unread_reaction_count,
          "unread_mention_count" A..= unread_mention_count,
          "last_read_outbox_message_id" A..= last_read_outbox_message_id,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id,
          "unread_count" A..= unread_count,
          "default_disable_notification" A..= default_disable_notification,
          "can_be_reported" A..= can_be_reported,
          "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users,
          "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self,
          "has_scheduled_messages" A..= has_scheduled_messages,
          "is_blocked" A..= is_blocked,
          "is_marked_as_unread" A..= is_marked_as_unread,
          "has_protected_content" A..= has_protected_content,
          "message_sender_id" A..= message_sender_id,
          "positions" A..= positions,
          "last_message" A..= last_message,
          "permissions" A..= permissions,
          "photo" A..= photo,
          "title" A..= title,
          "type" A..= _type,
          "id" A..= _id
        ]
