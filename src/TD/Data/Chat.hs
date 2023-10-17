module TD.Data.Chat
  (Chat(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.ChatType as ChatType
import qualified Data.Text as T
import qualified TD.Data.ChatPhotoInfo as ChatPhotoInfo
import qualified TD.Data.ChatPermissions as ChatPermissions
import qualified TD.Data.Message as Message
import qualified TD.Data.ChatPosition as ChatPosition
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.BlockList as BlockList
import qualified TD.Data.ChatNotificationSettings as ChatNotificationSettings
import qualified TD.Data.ChatAvailableReactions as ChatAvailableReactions
import qualified TD.Data.ChatBackground as ChatBackground
import qualified TD.Data.ChatActionBar as ChatActionBar
import qualified TD.Data.VideoChat as VideoChat
import qualified TD.Data.ChatJoinRequestsInfo as ChatJoinRequestsInfo
import qualified TD.Data.DraftMessage as DraftMessage

data Chat
  = Chat -- ^ A chat. (Can be a private chat, basic group, supergroup, or secret chat)
    { _id                          :: Maybe Int                                               -- ^ Chat unique identifier
    , _type                        :: Maybe ChatType.ChatType                                 -- ^ Type of the chat
    , title                        :: Maybe T.Text                                            -- ^ Chat title
    , photo                        :: Maybe ChatPhotoInfo.ChatPhotoInfo                       -- ^ Chat photo; may be null
    , permissions                  :: Maybe ChatPermissions.ChatPermissions                   -- ^ Actions that non-administrator chat members are allowed to take in the chat
    , last_message                 :: Maybe Message.Message                                   -- ^ Last message in the chat; may be null if none or unknown
    , positions                    :: Maybe [ChatPosition.ChatPosition]                       -- ^ Positions of the chat in chat lists
    , message_sender_id            :: Maybe MessageSender.MessageSender                       -- ^ Identifier of a user or chat that is selected to send messages in the chat; may be null if the user can't change message sender
    , block_list                   :: Maybe BlockList.BlockList                               -- ^ Block list to which the chat is added; may be null if none
    , has_protected_content        :: Maybe Bool                                              -- ^ True, if chat content can't be saved locally, forwarded, or copied
    , is_translatable              :: Maybe Bool                                              -- ^ True, if translation of all messages in the chat must be suggested to the user
    , is_marked_as_unread          :: Maybe Bool                                              -- ^ True, if the chat is marked as unread
    , has_scheduled_messages       :: Maybe Bool                                              -- ^ True, if the chat has scheduled messages
    , can_be_deleted_only_for_self :: Maybe Bool                                              -- ^ True, if the chat messages can be deleted only for the current user while other users will continue to see the messages
    , can_be_deleted_for_all_users :: Maybe Bool                                              -- ^ True, if the chat messages can be deleted for all users
    , can_be_reported              :: Maybe Bool                                              -- ^ True, if the chat can be reported to Telegram moderators through reportChat or reportChatPhoto
    , default_disable_notification :: Maybe Bool                                              -- ^ Default value of the disable_notification parameter, used when a message is sent to the chat
    , unread_count                 :: Maybe Int                                               -- ^ Number of unread messages in the chat
    , last_read_inbox_message_id   :: Maybe Int                                               -- ^ Identifier of the last read incoming message
    , last_read_outbox_message_id  :: Maybe Int                                               -- ^ Identifier of the last read outgoing message
    , unread_mention_count         :: Maybe Int                                               -- ^ Number of unread messages with a mention/reply in the chat
    , unread_reaction_count        :: Maybe Int                                               -- ^ Number of messages with unread reactions in the chat
    , notification_settings        :: Maybe ChatNotificationSettings.ChatNotificationSettings -- ^ Notification settings for the chat
    , available_reactions          :: Maybe ChatAvailableReactions.ChatAvailableReactions     -- ^ Types of reaction, available in the chat
    , message_auto_delete_time     :: Maybe Int                                               -- ^ Current message auto-delete or self-destruct timer setting for the chat, in seconds; 0 if disabled. Self-destruct timer in secret chats starts after the message or its content is viewed. Auto-delete timer in other chats starts from the send date
    , background                   :: Maybe ChatBackground.ChatBackground                     -- ^ Background set for the chat; may be null if none
    , theme_name                   :: Maybe T.Text                                            -- ^ If non-empty, name of a theme, set for the chat
    , action_bar                   :: Maybe ChatActionBar.ChatActionBar                       -- ^ Information about actions which must be possible to do through the chat action bar; may be null if none
    , video_chat                   :: Maybe VideoChat.VideoChat                               -- ^ Information about video chat of the chat
    , pending_join_requests        :: Maybe ChatJoinRequestsInfo.ChatJoinRequestsInfo         -- ^ Information about pending join requests; may be null if none
    , reply_markup_message_id      :: Maybe Int                                               -- ^ Identifier of the message from which reply markup needs to be used; 0 if there is no default custom reply markup in the chat
    , draft_message                :: Maybe DraftMessage.DraftMessage                         -- ^ A draft of a message in the chat; may be null if none
    , client_data                  :: Maybe T.Text                                            -- ^ Application-specific data associated with the chat. (For example, the chat scroll position or local chat notification settings can be stored here.) Persistent if the message database is used
    }
  deriving (Eq, Show)

instance I.ShortShow Chat where
  shortShow Chat
    { _id                          = _id_
    , _type                        = _type_
    , title                        = title_
    , photo                        = photo_
    , permissions                  = permissions_
    , last_message                 = last_message_
    , positions                    = positions_
    , message_sender_id            = message_sender_id_
    , block_list                   = block_list_
    , has_protected_content        = has_protected_content_
    , is_translatable              = is_translatable_
    , is_marked_as_unread          = is_marked_as_unread_
    , has_scheduled_messages       = has_scheduled_messages_
    , can_be_deleted_only_for_self = can_be_deleted_only_for_self_
    , can_be_deleted_for_all_users = can_be_deleted_for_all_users_
    , can_be_reported              = can_be_reported_
    , default_disable_notification = default_disable_notification_
    , unread_count                 = unread_count_
    , last_read_inbox_message_id   = last_read_inbox_message_id_
    , last_read_outbox_message_id  = last_read_outbox_message_id_
    , unread_mention_count         = unread_mention_count_
    , unread_reaction_count        = unread_reaction_count_
    , notification_settings        = notification_settings_
    , available_reactions          = available_reactions_
    , message_auto_delete_time     = message_auto_delete_time_
    , background                   = background_
    , theme_name                   = theme_name_
    , action_bar                   = action_bar_
    , video_chat                   = video_chat_
    , pending_join_requests        = pending_join_requests_
    , reply_markup_message_id      = reply_markup_message_id_
    , draft_message                = draft_message_
    , client_data                  = client_data_
    }
      = "Chat"
        ++ I.cc
        [ "_id"                          `I.p` _id_
        , "_type"                        `I.p` _type_
        , "title"                        `I.p` title_
        , "photo"                        `I.p` photo_
        , "permissions"                  `I.p` permissions_
        , "last_message"                 `I.p` last_message_
        , "positions"                    `I.p` positions_
        , "message_sender_id"            `I.p` message_sender_id_
        , "block_list"                   `I.p` block_list_
        , "has_protected_content"        `I.p` has_protected_content_
        , "is_translatable"              `I.p` is_translatable_
        , "is_marked_as_unread"          `I.p` is_marked_as_unread_
        , "has_scheduled_messages"       `I.p` has_scheduled_messages_
        , "can_be_deleted_only_for_self" `I.p` can_be_deleted_only_for_self_
        , "can_be_deleted_for_all_users" `I.p` can_be_deleted_for_all_users_
        , "can_be_reported"              `I.p` can_be_reported_
        , "default_disable_notification" `I.p` default_disable_notification_
        , "unread_count"                 `I.p` unread_count_
        , "last_read_inbox_message_id"   `I.p` last_read_inbox_message_id_
        , "last_read_outbox_message_id"  `I.p` last_read_outbox_message_id_
        , "unread_mention_count"         `I.p` unread_mention_count_
        , "unread_reaction_count"        `I.p` unread_reaction_count_
        , "notification_settings"        `I.p` notification_settings_
        , "available_reactions"          `I.p` available_reactions_
        , "message_auto_delete_time"     `I.p` message_auto_delete_time_
        , "background"                   `I.p` background_
        , "theme_name"                   `I.p` theme_name_
        , "action_bar"                   `I.p` action_bar_
        , "video_chat"                   `I.p` video_chat_
        , "pending_join_requests"        `I.p` pending_join_requests_
        , "reply_markup_message_id"      `I.p` reply_markup_message_id_
        , "draft_message"                `I.p` draft_message_
        , "client_data"                  `I.p` client_data_
        ]

instance AT.FromJSON Chat where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chat" -> parseChat v
      _      -> mempty
    
    where
      parseChat :: A.Value -> AT.Parser Chat
      parseChat = A.withObject "Chat" $ \o -> do
        _id_                          <- o A..:?  "id"
        _type_                        <- o A..:?  "type"
        title_                        <- o A..:?  "title"
        photo_                        <- o A..:?  "photo"
        permissions_                  <- o A..:?  "permissions"
        last_message_                 <- o A..:?  "last_message"
        positions_                    <- o A..:?  "positions"
        message_sender_id_            <- o A..:?  "message_sender_id"
        block_list_                   <- o A..:?  "block_list"
        has_protected_content_        <- o A..:?  "has_protected_content"
        is_translatable_              <- o A..:?  "is_translatable"
        is_marked_as_unread_          <- o A..:?  "is_marked_as_unread"
        has_scheduled_messages_       <- o A..:?  "has_scheduled_messages"
        can_be_deleted_only_for_self_ <- o A..:?  "can_be_deleted_only_for_self"
        can_be_deleted_for_all_users_ <- o A..:?  "can_be_deleted_for_all_users"
        can_be_reported_              <- o A..:?  "can_be_reported"
        default_disable_notification_ <- o A..:?  "default_disable_notification"
        unread_count_                 <- o A..:?  "unread_count"
        last_read_inbox_message_id_   <- o A..:?  "last_read_inbox_message_id"
        last_read_outbox_message_id_  <- o A..:?  "last_read_outbox_message_id"
        unread_mention_count_         <- o A..:?  "unread_mention_count"
        unread_reaction_count_        <- o A..:?  "unread_reaction_count"
        notification_settings_        <- o A..:?  "notification_settings"
        available_reactions_          <- o A..:?  "available_reactions"
        message_auto_delete_time_     <- o A..:?  "message_auto_delete_time"
        background_                   <- o A..:?  "background"
        theme_name_                   <- o A..:?  "theme_name"
        action_bar_                   <- o A..:?  "action_bar"
        video_chat_                   <- o A..:?  "video_chat"
        pending_join_requests_        <- o A..:?  "pending_join_requests"
        reply_markup_message_id_      <- o A..:?  "reply_markup_message_id"
        draft_message_                <- o A..:?  "draft_message"
        client_data_                  <- o A..:?  "client_data"
        pure $ Chat
          { _id                          = _id_
          , _type                        = _type_
          , title                        = title_
          , photo                        = photo_
          , permissions                  = permissions_
          , last_message                 = last_message_
          , positions                    = positions_
          , message_sender_id            = message_sender_id_
          , block_list                   = block_list_
          , has_protected_content        = has_protected_content_
          , is_translatable              = is_translatable_
          , is_marked_as_unread          = is_marked_as_unread_
          , has_scheduled_messages       = has_scheduled_messages_
          , can_be_deleted_only_for_self = can_be_deleted_only_for_self_
          , can_be_deleted_for_all_users = can_be_deleted_for_all_users_
          , can_be_reported              = can_be_reported_
          , default_disable_notification = default_disable_notification_
          , unread_count                 = unread_count_
          , last_read_inbox_message_id   = last_read_inbox_message_id_
          , last_read_outbox_message_id  = last_read_outbox_message_id_
          , unread_mention_count         = unread_mention_count_
          , unread_reaction_count        = unread_reaction_count_
          , notification_settings        = notification_settings_
          , available_reactions          = available_reactions_
          , message_auto_delete_time     = message_auto_delete_time_
          , background                   = background_
          , theme_name                   = theme_name_
          , action_bar                   = action_bar_
          , video_chat                   = video_chat_
          , pending_join_requests        = pending_join_requests_
          , reply_markup_message_id      = reply_markup_message_id_
          , draft_message                = draft_message_
          , client_data                  = client_data_
          }
  parseJSON _ = mempty

