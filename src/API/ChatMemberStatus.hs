-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatMemberStatus where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions

--main = putStrLn "ok"

data ChatMemberStatus = 
 ChatMemberStatusCreator { is_member :: Bool, custom_title :: String }  
 | ChatMemberStatusAdministrator { can_promote_members :: Bool, can_pin_messages :: Bool, can_restrict_members :: Bool, can_invite_users :: Bool, can_delete_messages :: Bool, can_edit_messages :: Bool, can_post_messages :: Bool, can_change_info :: Bool, can_be_edited :: Bool, custom_title :: String }  
 | ChatMemberStatusMember 
 | ChatMemberStatusRestricted { permissions :: ChatPermissions.ChatPermissions, restricted_until_date :: Int, is_member :: Bool }  
 | ChatMemberStatusLeft 
 | ChatMemberStatusBanned { banned_until_date :: Int }  -- deriving (Show)

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
-- chatMemberStatusCreator ChatMemberStatus  { is_member :: Bool, custom_title :: String } 

-- chatMemberStatusAdministrator ChatMemberStatus  { can_promote_members :: Bool, can_pin_messages :: Bool, can_restrict_members :: Bool, can_invite_users :: Bool, can_delete_messages :: Bool, can_edit_messages :: Bool, can_post_messages :: Bool, can_change_info :: Bool, can_be_edited :: Bool, custom_title :: String } 

-- chatMemberStatusMember ChatMemberStatus 

-- chatMemberStatusRestricted ChatMemberStatus  { permissions :: ChatPermissions.ChatPermissions, restricted_until_date :: Int, is_member :: Bool } 

-- chatMemberStatusLeft ChatMemberStatus 

-- chatMemberStatusBanned ChatMemberStatus  { banned_until_date :: Int } 

