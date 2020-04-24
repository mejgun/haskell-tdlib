-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMemberStatus where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

data ChatMemberStatus = 
 ChatMemberStatusCreator { is_member :: Maybe Bool, custom_title :: Maybe String }  
 | ChatMemberStatusAdministrator { can_promote_members :: Maybe Bool, can_pin_messages :: Maybe Bool, can_restrict_members :: Maybe Bool, can_invite_users :: Maybe Bool, can_delete_messages :: Maybe Bool, can_edit_messages :: Maybe Bool, can_post_messages :: Maybe Bool, can_change_info :: Maybe Bool, can_be_edited :: Maybe Bool, custom_title :: Maybe String }  
 | ChatMemberStatusMember 
 | ChatMemberStatusRestricted { permissions :: Maybe ChatPermissions.ChatPermissions, restricted_until_date :: Maybe Int, is_member :: Maybe Bool }  
 | ChatMemberStatusLeft 
 | ChatMemberStatusBanned { banned_until_date :: Maybe Int }  deriving (Show, Eq)

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
    is_member <- optional $ o A..: "is_member"
    custom_title <- optional $ o A..: "custom_title"
    return $ ChatMemberStatusCreator { is_member = is_member, custom_title = custom_title }

   parseChatMemberStatusAdministrator :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusAdministrator = A.withObject "ChatMemberStatusAdministrator" $ \o -> do
    can_promote_members <- optional $ o A..: "can_promote_members"
    can_pin_messages <- optional $ o A..: "can_pin_messages"
    can_restrict_members <- optional $ o A..: "can_restrict_members"
    can_invite_users <- optional $ o A..: "can_invite_users"
    can_delete_messages <- optional $ o A..: "can_delete_messages"
    can_edit_messages <- optional $ o A..: "can_edit_messages"
    can_post_messages <- optional $ o A..: "can_post_messages"
    can_change_info <- optional $ o A..: "can_change_info"
    can_be_edited <- optional $ o A..: "can_be_edited"
    custom_title <- optional $ o A..: "custom_title"
    return $ ChatMemberStatusAdministrator { can_promote_members = can_promote_members, can_pin_messages = can_pin_messages, can_restrict_members = can_restrict_members, can_invite_users = can_invite_users, can_delete_messages = can_delete_messages, can_edit_messages = can_edit_messages, can_post_messages = can_post_messages, can_change_info = can_change_info, can_be_edited = can_be_edited, custom_title = custom_title }

   parseChatMemberStatusMember :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusMember = A.withObject "ChatMemberStatusMember" $ \o -> do
    return $ ChatMemberStatusMember {  }

   parseChatMemberStatusRestricted :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusRestricted = A.withObject "ChatMemberStatusRestricted" $ \o -> do
    permissions <- optional $ o A..: "permissions"
    restricted_until_date <- optional $ o A..: "restricted_until_date"
    is_member <- optional $ o A..: "is_member"
    return $ ChatMemberStatusRestricted { permissions = permissions, restricted_until_date = restricted_until_date, is_member = is_member }

   parseChatMemberStatusLeft :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusLeft = A.withObject "ChatMemberStatusLeft" $ \o -> do
    return $ ChatMemberStatusLeft {  }

   parseChatMemberStatusBanned :: A.Value -> T.Parser ChatMemberStatus
   parseChatMemberStatusBanned = A.withObject "ChatMemberStatusBanned" $ \o -> do
    banned_until_date <- optional $ o A..: "banned_until_date"
    return $ ChatMemberStatusBanned { banned_until_date = banned_until_date }