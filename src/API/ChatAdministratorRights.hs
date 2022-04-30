-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatAdministratorRights where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Describes rights of the administrator
-- 
-- __can_manage_chat__ True, if the administrator can get chat event log, get chat statistics, get message statistics in channels, get channel members, see anonymous administrators in supergroups and ignore slow mode. Implied by any other privilege; applicable to supergroups and channels only
-- 
-- __can_change_info__ True, if the administrator can change the chat title, photo, and other settings
-- 
-- __can_post_messages__ True, if the administrator can create channel posts; applicable to channels only
-- 
-- __can_edit_messages__ True, if the administrator can edit messages of other users and pin messages; applicable to channels only
-- 
-- __can_delete_messages__ True, if the administrator can delete messages of other users
-- 
-- __can_invite_users__ True, if the administrator can invite new users to the chat
-- 
-- __can_restrict_members__ True, if the administrator can restrict, ban, or unban chat members; always true for channels
-- 
-- __can_pin_messages__ True, if the administrator can pin messages; applicable to basic groups and supergroups only
-- 
-- __can_promote_members__ True, if the administrator can add new administrators with a subset of their own privileges or demote administrators that were directly or indirectly promoted by them
-- 
-- __can_manage_video_chats__ True, if the administrator can manage video chats
-- 
-- __is_anonymous__ True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
data ChatAdministratorRights = 

 ChatAdministratorRights { is_anonymous :: Maybe Bool, can_manage_video_chats :: Maybe Bool, can_promote_members :: Maybe Bool, can_pin_messages :: Maybe Bool, can_restrict_members :: Maybe Bool, can_invite_users :: Maybe Bool, can_delete_messages :: Maybe Bool, can_edit_messages :: Maybe Bool, can_post_messages :: Maybe Bool, can_change_info :: Maybe Bool, can_manage_chat :: Maybe Bool }  deriving (Eq)

instance Show ChatAdministratorRights where
 show ChatAdministratorRights { is_anonymous=is_anonymous, can_manage_video_chats=can_manage_video_chats, can_promote_members=can_promote_members, can_pin_messages=can_pin_messages, can_restrict_members=can_restrict_members, can_invite_users=can_invite_users, can_delete_messages=can_delete_messages, can_edit_messages=can_edit_messages, can_post_messages=can_post_messages, can_change_info=can_change_info, can_manage_chat=can_manage_chat } =
  "ChatAdministratorRights" ++ U.cc [U.p "is_anonymous" is_anonymous, U.p "can_manage_video_chats" can_manage_video_chats, U.p "can_promote_members" can_promote_members, U.p "can_pin_messages" can_pin_messages, U.p "can_restrict_members" can_restrict_members, U.p "can_invite_users" can_invite_users, U.p "can_delete_messages" can_delete_messages, U.p "can_edit_messages" can_edit_messages, U.p "can_post_messages" can_post_messages, U.p "can_change_info" can_change_info, U.p "can_manage_chat" can_manage_chat ]

instance T.ToJSON ChatAdministratorRights where
 toJSON ChatAdministratorRights { is_anonymous = is_anonymous, can_manage_video_chats = can_manage_video_chats, can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_manage_chat = can_manage_chat } =
  A.object [ "@type" A..= T.String "chatAdministratorRights", "is_anonymous" A..= is_anonymous, "can_manage_video_chats" A..= can_manage_video_chats, "can_promote_members" A..= can_promote_members, "can_pin_messages" A..= can_pin_messages, "can_restrict_members" A..= can_restrict_members, "can_invite_users" A..= can_invite_users, "can_delete_messages" A..= can_delete_messages, "can_edit_messages" A..= can_edit_messages, "can_post_messages" A..= can_post_messages, "can_change_info" A..= can_change_info, "can_manage_chat" A..= can_manage_chat ]

instance T.FromJSON ChatAdministratorRights where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatAdministratorRights" -> parseChatAdministratorRights v
   _ -> mempty
  where
   parseChatAdministratorRights :: A.Value -> T.Parser ChatAdministratorRights
   parseChatAdministratorRights = A.withObject "ChatAdministratorRights" $ \o -> do
    is_anonymous <- o A..:? "is_anonymous"
    can_manage_video_chats <- o A..:? "can_manage_video_chats"
    can_promote_members <- o A..:? "can_promote_members"
    can_pin_messages <- o A..:? "can_pin_messages"
    can_restrict_members <- o A..:? "can_restrict_members"
    can_invite_users <- o A..:? "can_invite_users"
    can_delete_messages <- o A..:? "can_delete_messages"
    can_edit_messages <- o A..:? "can_edit_messages"
    can_post_messages <- o A..:? "can_post_messages"
    can_change_info <- o A..:? "can_change_info"
    can_manage_chat <- o A..:? "can_manage_chat"
    return $ ChatAdministratorRights { is_anonymous = is_anonymous, can_manage_video_chats = can_manage_video_chats, can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_manage_chat = can_manage_chat }
 parseJSON _ = mempty
