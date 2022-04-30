-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMemberStatus where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatAdministratorRights as ChatAdministratorRights
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
 -- The user is a member of the chat and has some additional privileges. In basic groups, administrators can edit and delete messages sent by others, add new members, ban unprivileged members, and manage video chats. In supergroups and channels, there are more detailed options for administrator privileges
 -- 
 -- __custom_title__ A custom title of the administrator; 0-16 characters without emojis; applicable to supergroups only
 -- 
 -- __can_be_edited__ True, if the current user can edit the administrator privileges for the called user
 -- 
 -- __rights__ Rights of the administrator
 ChatMemberStatusAdministrator { rights :: Maybe ChatAdministratorRights.ChatAdministratorRights, can_be_edited :: Maybe Bool, custom_title :: Maybe String }  |
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
 -- The user or the chat was banned (and hence is not a member of the chat). Implies the user can't return to the chat, view messages, or be used as a participant identifier to join a video chat of the chat
 -- 
 -- __banned_until_date__ Point in time (Unix timestamp) when the user will be unbanned; 0 if never. If the user is banned for more than 366 days or for less than 30 seconds from the current time, the user is considered to be banned forever. Always 0 in basic groups
 ChatMemberStatusBanned { banned_until_date :: Maybe Int }  deriving (Eq)

instance Show ChatMemberStatus where
 show ChatMemberStatusCreator { is_member=is_member, is_anonymous=is_anonymous, custom_title=custom_title } =
  "ChatMemberStatusCreator" ++ U.cc [U.p "is_member" is_member, U.p "is_anonymous" is_anonymous, U.p "custom_title" custom_title ]

 show ChatMemberStatusAdministrator { rights=rights, can_be_edited=can_be_edited, custom_title=custom_title } =
  "ChatMemberStatusAdministrator" ++ U.cc [U.p "rights" rights, U.p "can_be_edited" can_be_edited, U.p "custom_title" custom_title ]

 show ChatMemberStatusMember {  } =
  "ChatMemberStatusMember" ++ U.cc [ ]

 show ChatMemberStatusRestricted { permissions=permissions, restricted_until_date=restricted_until_date, is_member=is_member } =
  "ChatMemberStatusRestricted" ++ U.cc [U.p "permissions" permissions, U.p "restricted_until_date" restricted_until_date, U.p "is_member" is_member ]

 show ChatMemberStatusLeft {  } =
  "ChatMemberStatusLeft" ++ U.cc [ ]

 show ChatMemberStatusBanned { banned_until_date=banned_until_date } =
  "ChatMemberStatusBanned" ++ U.cc [U.p "banned_until_date" banned_until_date ]

instance T.ToJSON ChatMemberStatus where
 toJSON ChatMemberStatusCreator { is_member = is_member, is_anonymous = is_anonymous, custom_title = custom_title } =
  A.object [ "@type" A..= T.String "chatMemberStatusCreator", "is_member" A..= is_member, "is_anonymous" A..= is_anonymous, "custom_title" A..= custom_title ]

 toJSON ChatMemberStatusAdministrator { rights = rights, can_be_edited = can_be_edited, custom_title = custom_title } =
  A.object [ "@type" A..= T.String "chatMemberStatusAdministrator", "rights" A..= rights, "can_be_edited" A..= can_be_edited, "custom_title" A..= custom_title ]

 toJSON ChatMemberStatusMember {  } =
  A.object [ "@type" A..= T.String "chatMemberStatusMember" ]

 toJSON ChatMemberStatusRestricted { permissions = permissions, restricted_until_date = restricted_until_date, is_member = is_member } =
  A.object [ "@type" A..= T.String "chatMemberStatusRestricted", "permissions" A..= permissions, "restricted_until_date" A..= restricted_until_date, "is_member" A..= is_member ]

 toJSON ChatMemberStatusLeft {  } =
  A.object [ "@type" A..= T.String "chatMemberStatusLeft" ]

 toJSON ChatMemberStatusBanned { banned_until_date = banned_until_date } =
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
    rights <- o A..:? "rights"
    can_be_edited <- o A..:? "can_be_edited"
    custom_title <- o A..:? "custom_title"
    return $ ChatMemberStatusAdministrator { rights = rights, can_be_edited = can_be_edited, custom_title = custom_title }

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
 parseJSON _ = mempty
