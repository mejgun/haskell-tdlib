{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.ChatAdministratorRights where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
data ChatAdministratorRights = -- | Describes rights of the administrator
  ChatAdministratorRights
  { -- | True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
    is_anonymous :: Maybe Bool,
    -- | True, if the administrator can manage video chats
    can_manage_video_chats :: Maybe Bool,
    -- | True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
    can_promote_members :: Maybe Bool,
    -- | True, if the administrator can manage topics; applicable to forum supergroups only
    can_manage_topics :: Maybe Bool,
    -- | True, if the administrator can pin messages; applicable to basic groups and supergroups only
    can_pin_messages :: Maybe Bool,
    -- | True, if the administrator can restrict, ban, or unban chat members; always true for channels
    can_restrict_members :: Maybe Bool,
    -- | True, if the administrator can invite new users to the chat
    can_invite_users :: Maybe Bool,
    -- | True, if the administrator can delete messages of other users
    can_delete_messages :: Maybe Bool,
    -- | True, if the administrator can edit messages of other users and pin messages; applicable to channels only
    can_edit_messages :: Maybe Bool,
    -- | True, if the administrator can create channel posts; applicable to channels only
    can_post_messages :: Maybe Bool,
    -- | True, if the administrator can change the chat title, photo, and other settings
    can_change_info :: Maybe Bool,
    -- | True, if the administrator can get chat event log, get chat statistics, get message statistics in channels, get channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
    can_manage_chat :: Maybe Bool
  }
  deriving (Eq)

instance Show ChatAdministratorRights where
  show
    ChatAdministratorRights
      { is_anonymous = is_anonymous_,
        can_manage_video_chats = can_manage_video_chats_,
        can_promote_members = can_promote_members_,
        can_manage_topics = can_manage_topics_,
        can_pin_messages = can_pin_messages_,
        can_restrict_members = can_restrict_members_,
        can_invite_users = can_invite_users_,
        can_delete_messages = can_delete_messages_,
        can_edit_messages = can_edit_messages_,
        can_post_messages = can_post_messages_,
        can_change_info = can_change_info_,
        can_manage_chat = can_manage_chat_
      } =
      "ChatAdministratorRights"
        ++ U.cc
          [ U.p "is_anonymous" is_anonymous_,
            U.p "can_manage_video_chats" can_manage_video_chats_,
            U.p "can_promote_members" can_promote_members_,
            U.p "can_manage_topics" can_manage_topics_,
            U.p "can_pin_messages" can_pin_messages_,
            U.p "can_restrict_members" can_restrict_members_,
            U.p "can_invite_users" can_invite_users_,
            U.p "can_delete_messages" can_delete_messages_,
            U.p "can_edit_messages" can_edit_messages_,
            U.p "can_post_messages" can_post_messages_,
            U.p "can_change_info" can_change_info_,
            U.p "can_manage_chat" can_manage_chat_
          ]

instance T.FromJSON ChatAdministratorRights where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "chatAdministratorRights" -> parseChatAdministratorRights v
      _ -> mempty
    where
      parseChatAdministratorRights :: A.Value -> T.Parser ChatAdministratorRights
      parseChatAdministratorRights = A.withObject "ChatAdministratorRights" $ \o -> do
        is_anonymous_ <- o A..:? "is_anonymous"
        can_manage_video_chats_ <- o A..:? "can_manage_video_chats"
        can_promote_members_ <- o A..:? "can_promote_members"
        can_manage_topics_ <- o A..:? "can_manage_topics"
        can_pin_messages_ <- o A..:? "can_pin_messages"
        can_restrict_members_ <- o A..:? "can_restrict_members"
        can_invite_users_ <- o A..:? "can_invite_users"
        can_delete_messages_ <- o A..:? "can_delete_messages"
        can_edit_messages_ <- o A..:? "can_edit_messages"
        can_post_messages_ <- o A..:? "can_post_messages"
        can_change_info_ <- o A..:? "can_change_info"
        can_manage_chat_ <- o A..:? "can_manage_chat"
        return $ ChatAdministratorRights {is_anonymous = is_anonymous_, can_manage_video_chats = can_manage_video_chats_, can_promote_members = can_promote_members_, can_manage_topics = can_manage_topics_, can_pin_messages = can_pin_messages_, can_restrict_members = can_restrict_members_, can_invite_users = can_invite_users_, can_delete_messages = can_delete_messages_, can_edit_messages = can_edit_messages_, can_post_messages = can_post_messages_, can_change_info = can_change_info_, can_manage_chat = can_manage_chat_}
  parseJSON _ = mempty

instance T.ToJSON ChatAdministratorRights where
  toJSON
    ChatAdministratorRights
      { is_anonymous = is_anonymous_,
        can_manage_video_chats = can_manage_video_chats_,
        can_promote_members = can_promote_members_,
        can_manage_topics = can_manage_topics_,
        can_pin_messages = can_pin_messages_,
        can_restrict_members = can_restrict_members_,
        can_invite_users = can_invite_users_,
        can_delete_messages = can_delete_messages_,
        can_edit_messages = can_edit_messages_,
        can_post_messages = can_post_messages_,
        can_change_info = can_change_info_,
        can_manage_chat = can_manage_chat_
      } =
      A.object
        [ "@type" A..= T.String "chatAdministratorRights",
          "is_anonymous" A..= is_anonymous_,
          "can_manage_video_chats" A..= can_manage_video_chats_,
          "can_promote_members" A..= can_promote_members_,
          "can_manage_topics" A..= can_manage_topics_,
          "can_pin_messages" A..= can_pin_messages_,
          "can_restrict_members" A..= can_restrict_members_,
          "can_invite_users" A..= can_invite_users_,
          "can_delete_messages" A..= can_delete_messages_,
          "can_edit_messages" A..= can_edit_messages_,
          "can_post_messages" A..= can_post_messages_,
          "can_change_info" A..= can_change_info_,
          "can_manage_chat" A..= can_manage_chat_
        ]
