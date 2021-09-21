-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMemberStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

-- |
-- 
-- Provides information about the status of a member in a chat
data ChatMemberStatus = 
 -- |
 -- 
 -- The user is the owner of the chat and has all the administrator privileges
 -- 
 -- __custom_title__ A custom title of the owner; 0-16 characters without emojis; applicable to supergroups only
 -- 
 -- __is_anonymous__ True, if the creator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
 -- 
 -- __is_member__ True, if the user is a member of the chat
 ChatMemberStatusCreator { is_member :: Maybe Bool, is_anonymous :: Maybe Bool, custom_title :: Maybe String }  |
 -- |
 -- 
 -- The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage voice chats. In supergroups and channels, there are more detailed options for administrator privileges
 -- 
 -- __custom_title__ A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
 -- 
 -- __can_be_edited__ True, if the current user can edit the administrator privileges for the called user
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
 -- __can_manage_voice_chats__ True, if the administrator can manage voice chats
 -- 
 -- __is_anonymous__ True, if the administrator isn't shown in the chat member list and sends messages anonymously; applicable to supergroups only
 ChatMemberStatusAdministrator { is_anonymous :: Maybe Bool, can_manage_voice_chats :: Maybe Bool, can_promote_members :: Maybe Bool, can_pin_messages :: Maybe Bool, can_restrict_members :: Maybe Bool, can_invite_users :: Maybe Bool, can_delete_messages :: Maybe Bool, can_edit_messages :: Maybe Bool, can_post_messages :: Maybe Bool, can_change_info :: Maybe Bool, can_manage_chat :: Maybe Bool, can_be_edited :: Maybe Bool, custom_title :: Maybe String }  |
 -- |
 -- 
 -- The user is a member of the chat, without any additional privileges or restrictions
 ChatMemberStatusMember |
 -- |
 -- 
 -- The user is under certain restrictions in the chat. Not supported in basic groups and channels
 -- 
 -- __is_member__ True, if the user is a member of the chat
 -- 
 -- __restricted_until_date__ Point in time (Unix timestamp) when restrictions will be lifted from the user; 0 if never. If the user is restricted for more than 366 days or for less than 30 seconds from the current time, the user is considered to be restricted forever
 -- 
 -- __permissions__ User permissions in the chat
 ChatMemberStatusRestricted { permissions :: Maybe ChatPermissions.ChatPermissions, restricted_until_date :: Maybe Int, is_member :: Maybe Bool }  |
 -- |
 -- 
 -- The user or the chat is not a chat member
 ChatMemberStatusLeft |
 -- |
 -- 
 -- The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a voice chat of the chat
 -- 
 -- __banned_until_date__ Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
 ChatMemberStatusBanned { banned_until_date :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON ChatMemberStatus where
 toJSON (ChatMemberStatusCreator { is_member = is_member, is_anonymous = is_anonymous, custom_title = custom_title }) =
  A.object [ "@type" A..= T.String "chatMemberStatusCreator", "is_member" A..= is_member, "is_anonymous" A..= is_anonymous, "custom_title" A..= custom_title ]

 toJSON (ChatMemberStatusAdministrator { is_anonymous = is_anonymous, can_manage_voice_chats = can_manage_voice_chats, can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_manage_chat = can_manage_chat, can_be_edited = can_be_edited, custom_title = custom_title }) =
  A.object [ "@type" A..= T.String "chatMemberStatusAdministrator", "is_anonymous" A..= is_anonymous, "can_manage_voice_chats" A..= can_manage_voice_chats, "can_promote_members" A..= can_promote_members, "can_pin_messages" A..= can_pin_messages, "can_restrict_members" A..= can_restrict_members, "can_invite_users" A..= can_invite_users, "can_delete_messages" A..= can_delete_messages, "can_edit_messages" A..= can_edit_messages, "can_post_messages" A..= can_post_messages, "can_change_info" A..= can_change_info, "can_manage_chat" A..= can_manage_chat, "can_be_edited" A..= can_be_edited, "custom_title" A..= custom_title ]

 toJSON (ChatMemberStatusMember {  }) =
  A.object [ "@type" A..= T.String "chatMemberStatusMember" ]

 toJSON (ChatMemberStatusRestricted { permissions = permissions, restricted_until_date = restricted_until_date, is_member = is_member }) =
  A.object [ "@type" A..= T.String "chatMemberStatusRestricted", "permissions" A..= permissions, "restricted_until_date" A..= restricted_until_date, "is_member" A..= is_member ]

 toJSON (ChatMemberStatusLeft {  }) =
  A.object [ "@type" A..= T.String "chatMemberStatusLeft" ]

 toJSON (ChatMemberStatusBanned { banned_until_date = banned_until_date }) =
  A.object [ "@type" A..= T.String "chatMemberStatusBanned", "banned_until_date" A..= banned_until_date ]

instance T.FromJSON ChatMemberStatus where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatMemberStatusCreator" -> parseChatMemberStatusCreator v
   "chatMemberStatusAdministrator" -> parseChatMemberStatusAdministrator v
   "chatMemberStatusMember" -> parseChatMemberStatusMember v
   "chatMemberStatusRestricted" -> parseChatMemberStatusRestricted v
   "chatMemberStatusLeft" -> parseChatMemberStatusLeft v
   "chatMemberStatusBanned" -> parseChatMemberStatusBanned v
   _ -> mempty
  where
   parseChatMemberStatusCreator :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusCreator = A.withObject "ChatMemberStatusCreator" $ \o -> do
    is_member <- o A..:? "is_member"
    is_anonymous <- o A..:? "is_anonymous"
    custom_title <- o A..:? "custom_title"
    return $ ChatMemberStatusCreator { is_member = is_member, is_anonymous = is_anonymous, custom_title = custom_title }

   parseChatMemberStatusAdministrator :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusAdministrator = A.withObject "ChatMemberStatusAdministrator" $ \o -> do
    is_anonymous <- o A..:? "is_anonymous"
    can_manage_voice_chats <- o A..:? "can_manage_voice_chats"
    can_promote_members <- o A..:? "can_promote_members"
    can_pin_messages <- o A..:? "can_pin_messages"
    can_restrict_members <- o A..:? "can_restrict_members"
    can_invite_users <- o A..:? "can_invite_users"
    can_delete_messages <- o A..:? "can_delete_messages"
    can_edit_messages <- o A..:? "can_edit_messages"
    can_post_messages <- o A..:? "can_post_messages"
    can_change_info <- o A..:? "can_change_info"
    can_manage_chat <- o A..:? "can_manage_chat"
    can_be_edited <- o A..:? "can_be_edited"
    custom_title <- o A..:? "custom_title"
    return $ ChatMemberStatusAdministrator { is_anonymous = is_anonymous, can_manage_voice_chats = can_manage_voice_chats, can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_manage_chat = can_manage_chat, can_be_edited = can_be_edited, custom_title = custom_title }

   parseChatMemberStatusMember :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusMember = A.withObject "ChatMemberStatusMember" $ \o -> do
    return $ ChatMemberStatusMember {  }

   parseChatMemberStatusRestricted :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusRestricted = A.withObject "ChatMemberStatusRestricted" $ \o -> do
    permissions <- o A..:? "permissions"
    restricted_until_date <- mconcat [ o A..:? "restricted_until_date", readMaybe <$> (o A..: "restricted_until_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_member <- o A..:? "is_member"
    return $ ChatMemberStatusRestricted { permissions = permissions, restricted_until_date = restricted_until_date, is_member = is_member }

   parseChatMemberStatusLeft :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusLeft = A.withObject "ChatMemberStatusLeft" $ \o -> do
    return $ ChatMemberStatusLeft {  }

   parseChatMemberStatusBanned :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusBanned = A.withObject "ChatMemberStatusBanned" $ \o -> do
    banned_until_date <- mconcat [ o A..:? "banned_until_date", readMaybe <$> (o A..: "banned_until_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ ChatMemberStatusBanned { banned_until_date = banned_until_date }