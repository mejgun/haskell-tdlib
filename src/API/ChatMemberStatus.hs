-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

data ChatMemberStatus = 
 ChatMemberStatusCreator { is_member :: Bool, custom_title :: String }  
 | ChatMemberStatusAdministrator { can_promote_members :: Bool, can_pin_messages :: Bool, can_restrict_members :: Bool, can_invite_users :: Bool, can_delete_messages :: Bool, can_edit_messages :: Bool, can_post_messages :: Bool, can_change_info :: Bool, can_be_edited :: Bool, custom_title :: String }  
 | ChatMemberStatusMember 
 | ChatMemberStatusRestricted { permissions :: ChatPermissions.ChatPermissions, restricted_until_date :: Int, is_member :: Bool }  
 | ChatMemberStatusLeft 
 | ChatMemberStatusBanned { banned_until_date :: Int }  deriving (Show)

instance T.ToJSON ChatMemberStatus where
 toJSON (ChatMemberStatusCreator { is_member = is_member, custom_title = custom_title }) =
  A.object [ "@type" A..= T.String "chatMemberStatusCreator", "is_member" A..= is_member, "custom_title" A..= custom_title ]

 toJSON (ChatMemberStatusAdministrator { can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_be_edited = can_be_edited, custom_title = custom_title }) =
  A.object [ "@type" A..= T.String "chatMemberStatusAdministrator", "can_promote_members" A..= can_promote_members, "can_pin_messages" A..= can_pin_messages, "can_restrict_members" A..= can_restrict_members, "can_invite_users" A..= can_invite_users, "can_delete_messages" A..= can_delete_messages, "can_edit_messages" A..= can_edit_messages, "can_post_messages" A..= can_post_messages, "can_change_info" A..= can_change_info, "can_be_edited" A..= can_be_edited, "custom_title" A..= custom_title ]

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
    is_member <- o A..: "is_member"
    custom_title <- o A..: "custom_title"
    return $ ChatMemberStatusCreator { is_member = is_member, custom_title = custom_title }

   parseChatMemberStatusAdministrator :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusAdministrator = A.withObject "ChatMemberStatusAdministrator" $ \o -> do
    can_promote_members <- o A..: "can_promote_members"
    can_pin_messages <- o A..: "can_pin_messages"
    can_restrict_members <- o A..: "can_restrict_members"
    can_invite_users <- o A..: "can_invite_users"
    can_delete_messages <- o A..: "can_delete_messages"
    can_edit_messages <- o A..: "can_edit_messages"
    can_post_messages <- o A..: "can_post_messages"
    can_change_info <- o A..: "can_change_info"
    can_be_edited <- o A..: "can_be_edited"
    custom_title <- o A..: "custom_title"
    return $ ChatMemberStatusAdministrator { can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_be_edited = can_be_edited, custom_title = custom_title }

   parseChatMemberStatusMember :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusMember = A.withObject "ChatMemberStatusMember" $ \o -> do
    return $ ChatMemberStatusMember {  }

   parseChatMemberStatusRestricted :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusRestricted = A.withObject "ChatMemberStatusRestricted" $ \o -> do
    permissions <- o A..: "permissions"
    restricted_until_date <- o A..: "restricted_until_date"
    is_member <- o A..: "is_member"
    return $ ChatMemberStatusRestricted { permissions = permissions, restricted_until_date = restricted_until_date, is_member = is_member }

   parseChatMemberStatusLeft :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusLeft = A.withObject "ChatMemberStatusLeft" $ \o -> do
    return $ ChatMemberStatusLeft {  }

   parseChatMemberStatusBanned :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusBanned = A.withObject "ChatMemberStatusBanned" $ \o -> do
    banned_until_date <- o A..: "banned_until_date"
    return $ ChatMemberStatusBanned { banned_until_date = banned_until_date }