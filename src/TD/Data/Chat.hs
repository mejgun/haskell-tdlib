{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Chat where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatPosition as ChatPosition
import qualified TD.Data.ChatType as ChatType
import qualified TD.Data.DraftMessage as DraftMessage
import qualified TD.Data.Message as Message
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.VideoChat as VideoChat
import qualified Utils as U

-- |
data Chat = -- | A chat. (Can be a private chat, basic group, supergroup, or secret chat)
  Chat
  { -- | Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
    client_data :: Maybe String,
    -- | A draft of a message in the chat; may be null if none
    draft_message :: Maybe DraftMessage.DraftMessage,
    -- | Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    reply_markup_message_id :: Maybe Int,
    -- | Information about pending join requests; may be null if none
    pending_join_requests :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo,
    -- | Information about video chat of the chat
    video_chat :: Maybe VideoChat.VideoChat,
    -- | Information about actions which must be possible to do through the chat action bar; may be null if none
    action_bar :: Maybe ChatActionBar.ChatActionBar,
    -- | If non-empty, name of a theme, set for the chat
    theme_name :: Maybe String,
    -- | Background set for the chat; may be null if none
    background :: Maybe ChatBackground.ChatBackground,
    -- | Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date
    message_auto_delete_time :: Maybe Int,
    -- | Types of reaction, available in the chat
    available_reactions :: Maybe ChatAvailableReactions.ChatAvailableReactions,
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
    -- | True, if the chat is marked as unread
    is_marked_as_unread :: Maybe Bool,
    -- | True, if translation of all messages in the chat must be suggested to the user
    is_translatable :: Maybe Bool,
    -- | True, if chat content can't be saved locally, forwarded, or copied
    has_protected_content :: Maybe Bool,
    -- | Block list to which the chat is added; may be null if none
    block_list :: Maybe BlockList.BlockList,
    -- | Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
    message_sender_id :: Maybe MessageSender.MessageSender,
    -- | Positions of the chat in chat lists
    positions :: Maybe [ChatPosition.ChatPosition],
    -- | Last message in the chat; may be null if none or unknown
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
      { client_data = client_data_,
        draft_message = draft_message_,
        reply_markup_message_id = reply_markup_message_id_,
        pending_join_requests = pending_join_requests_,
        video_chat = video_chat_,
        action_bar = action_bar_,
        theme_name = theme_name_,
        background = background_,
        message_auto_delete_time = message_auto_delete_time_,
        available_reactions = available_reactions_,
        notification_settings = notification_settings_,
        unread_reaction_count = unread_reaction_count_,
        unread_mention_count = unread_mention_count_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        unread_count = unread_count_,
        default_disable_notification = default_disable_notification_,
        can_be_reported = can_be_reported_,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users_,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self_,
        has_scheduled_messages = has_scheduled_messages_,
        is_marked_as_unread = is_marked_as_unread_,
        is_translatable = is_translatable_,
        has_protected_content = has_protected_content_,
        block_list = block_list_,
        message_sender_id = message_sender_id_,
        positions = positions_,
        last_message = last_message_,
        permissions = permissions_,
        photo = photo_,
        title = title_,
        _type = _type_,
        _id = _id_
      } =
      "Chat"
        ++ U.cc
          [ U.p "client_data" client_data_,
            U.p "draft_message" draft_message_,
            U.p "reply_markup_message_id" reply_markup_message_id_,
            U.p "pending_join_requests" pending_join_requests_,
            U.p "video_chat" video_chat_,
            U.p "action_bar" action_bar_,
            U.p "theme_name" theme_name_,
            U.p "background" background_,
            U.p "message_auto_delete_time" message_auto_delete_time_,
            U.p "available_reactions" available_reactions_,
            U.p "notification_settings" notification_settings_,
            U.p "unread_reaction_count" unread_reaction_count_,
            U.p "unread_mention_count" unread_mention_count_,
            U.p "last_read_outbox_message_id" last_read_outbox_message_id_,
            U.p "last_read_inbox_message_id" last_read_inbox_message_id_,
            U.p "unread_count" unread_count_,
            U.p "default_disable_notification" default_disable_notification_,
            U.p "can_be_reported" can_be_reported_,
            U.p "can_be_deleted_for_all_users" can_be_deleted_for_all_users_,
            U.p "can_be_deleted_only_for_self" can_be_deleted_only_for_self_,
            U.p "has_scheduled_messages" has_scheduled_messages_,
            U.p "is_marked_as_unread" is_marked_as_unread_,
            U.p "is_translatable" is_translatable_,
            U.p "has_protected_content" has_protected_content_,
            U.p "block_list" block_list_,
            U.p "message_sender_id" message_sender_id_,
            U.p "positions" positions_,
            U.p "last_message" last_message_,
            U.p "permissions" permissions_,
            U.p "photo" photo_,
            U.p "title" title_,
            U.p "_type" _type_,
            U.p "_id" _id_
          ]

instance T.FromJSON Chat where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chat" -> parseChat v
      _ -> mempty
    where
      parseChat :: A.Value -> T.Parser Chat
      parseChat = A.withObject "Chat" $ \o -> do
        client_data_ <- o A..:? "client_data"
        draft_message_ <- o A..:? "draft_message"
        reply_markup_message_id_ <- o A..:? "reply_markup_message_id"
        pending_join_requests_ <- o A..:? "pending_join_requests"
        video_chat_ <- o A..:? "video_chat"
        action_bar_ <- o A..:? "action_bar"
        theme_name_ <- o A..:? "theme_name"
        background_ <- o A..:? "background"
        message_auto_delete_time_ <- o A..:? "message_auto_delete_time"
        available_reactions_ <- o A..:? "available_reactions"
        notification_settings_ <- o A..:? "notification_settings"
        unread_reaction_count_ <- o A..:? "unread_reaction_count"
        unread_mention_count_ <- o A..:? "unread_mention_count"
        last_read_outbox_message_id_ <- o A..:? "last_read_outbox_message_id"
        last_read_inbox_message_id_ <- o A..:? "last_read_inbox_message_id"
        unread_count_ <- o A..:? "unread_count"
        default_disable_notification_ <- o A..:? "default_disable_notification"
        can_be_reported_ <- o A..:? "can_be_reported"
        can_be_deleted_for_all_users_ <- o A..:? "can_be_deleted_for_all_users"
        can_be_deleted_only_for_self_ <- o A..:? "can_be_deleted_only_for_self"
        has_scheduled_messages_ <- o A..:? "has_scheduled_messages"
        is_marked_as_unread_ <- o A..:? "is_marked_as_unread"
        is_translatable_ <- o A..:? "is_translatable"
        has_protected_content_ <- o A..:? "has_protected_content"
        block_list_ <- o A..:? "block_list"
        message_sender_id_ <- o A..:? "message_sender_id"
        positions_ <- o A..:? "positions"
        last_message_ <- o A..:? "last_message"
        permissions_ <- o A..:? "permissions"
        photo_ <- o A..:? "photo"
        title_ <- o A..:? "title"
        _type_ <- o A..:? "type"
        _id_ <- o A..:? "id"
        return $ Chat {client_data = client_data_, draft_message = draft_message_, reply_markup_message_id = reply_markup_message_id_, pending_join_requests = pending_join_requests_, video_chat = video_chat_, action_bar = action_bar_, theme_name = theme_name_, background = background_, message_auto_delete_time = message_auto_delete_time_, available_reactions = available_reactions_, notification_settings = notification_settings_, unread_reaction_count = unread_reaction_count_, unread_mention_count = unread_mention_count_, last_read_outbox_message_id = last_read_outbox_message_id_, last_read_inbox_message_id = last_read_inbox_message_id_, unread_count = unread_count_, default_disable_notification = default_disable_notification_, can_be_reported = can_be_reported_, can_be_deleted_for_all_users = can_be_deleted_for_all_users_, can_be_deleted_only_for_self = can_be_deleted_only_for_self_, has_scheduled_messages = has_scheduled_messages_, is_marked_as_unread = is_marked_as_unread_, is_translatable = is_translatable_, has_protected_content = has_protected_content_, block_list = block_list_, message_sender_id = message_sender_id_, positions = positions_, last_message = last_message_, permissions = permissions_, photo = photo_, title = title_, _type = _type_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Chat where
  toJSON
    Chat
      { client_data = client_data_,
        draft_message = draft_message_,
        reply_markup_message_id = reply_markup_message_id_,
        pending_join_requests = pending_join_requests_,
        video_chat = video_chat_,
        action_bar = action_bar_,
        theme_name = theme_name_,
        background = background_,
        message_auto_delete_time = message_auto_delete_time_,
        available_reactions = available_reactions_,
        notification_settings = notification_settings_,
        unread_reaction_count = unread_reaction_count_,
        unread_mention_count = unread_mention_count_,
        last_read_outbox_message_id = last_read_outbox_message_id_,
        last_read_inbox_message_id = last_read_inbox_message_id_,
        unread_count = unread_count_,
        default_disable_notification = default_disable_notification_,
        can_be_reported = can_be_reported_,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users_,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self_,
        has_scheduled_messages = has_scheduled_messages_,
        is_marked_as_unread = is_marked_as_unread_,
        is_translatable = is_translatable_,
        has_protected_content = has_protected_content_,
        block_list = block_list_,
        message_sender_id = message_sender_id_,
        positions = positions_,
        last_message = last_message_,
        permissions = permissions_,
        photo = photo_,
        title = title_,
        _type = _type_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "chat",
          "client_data" A..= client_data_,
          "draft_message" A..= draft_message_,
          "reply_markup_message_id" A..= reply_markup_message_id_,
          "pending_join_requests" A..= pending_join_requests_,
          "video_chat" A..= video_chat_,
          "action_bar" A..= action_bar_,
          "theme_name" A..= theme_name_,
          "background" A..= background_,
          "message_auto_delete_time" A..= message_auto_delete_time_,
          "available_reactions" A..= available_reactions_,
          "notification_settings" A..= notification_settings_,
          "unread_reaction_count" A..= unread_reaction_count_,
          "unread_mention_count" A..= unread_mention_count_,
          "last_read_outbox_message_id" A..= last_read_outbox_message_id_,
          "last_read_inbox_message_id" A..= last_read_inbox_message_id_,
          "unread_count" A..= unread_count_,
          "default_disable_notification" A..= default_disable_notification_,
          "can_be_reported" A..= can_be_reported_,
          "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users_,
          "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self_,
          "has_scheduled_messages" A..= has_scheduled_messages_,
          "is_marked_as_unread" A..= is_marked_as_unread_,
          "is_translatable" A..= is_translatable_,
          "has_protected_content" A..= has_protected_content_,
          "block_list" A..= block_list_,
          "message_sender_id" A..= message_sender_id_,
          "positions" A..= positions_,
          "last_message" A..= last_message_,
          "permissions" A..= permissions_,
          "photo" A..= photo_,
          "title" A..= title_,
          "type" A..= _type_,
          "id" A..= _id_
        ]
