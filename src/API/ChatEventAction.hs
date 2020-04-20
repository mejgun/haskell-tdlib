-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventAction where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

--main = putStrLn "ok"

data ChatEventAction = 
 ChatEventMessageEdited { new_message :: Message.Message, old_message :: Message.Message }  
 | ChatEventMessageDeleted { message :: Message.Message }  
 | ChatEventPollStopped { message :: Message.Message }  
 | ChatEventMessagePinned { message :: Message.Message }  
 | ChatEventMessageUnpinned 
 | ChatEventMemberJoined 
 | ChatEventMemberLeft 
 | ChatEventMemberInvited { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int }  
 | ChatEventMemberPromoted { new_status :: ChatMemberStatus.ChatMemberStatus, old_status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int }  
 | ChatEventMemberRestricted { new_status :: ChatMemberStatus.ChatMemberStatus, old_status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int }  
 | ChatEventTitleChanged { new_title :: String, old_title :: String }  
 | ChatEventPermissionsChanged { new_permissions :: ChatPermissions.ChatPermissions, old_permissions :: ChatPermissions.ChatPermissions }  
 | ChatEventDescriptionChanged { new_description :: String, old_description :: String }  
 | ChatEventUsernameChanged { new_username :: String, old_username :: String }  
 | ChatEventPhotoChanged { new_photo :: Photo.Photo, old_photo :: Photo.Photo }  
 | ChatEventInvitesToggled { can_invite_users :: Bool }  
 | ChatEventLinkedChatChanged { new_linked_chat_id :: Int, old_linked_chat_id :: Int }  
 | ChatEventSlowModeDelayChanged { new_slow_mode_delay :: Int, old_slow_mode_delay :: Int }  
 | ChatEventSignMessagesToggled { sign_messages :: Bool }  
 | ChatEventStickerSetChanged { new_sticker_set_id :: Int, old_sticker_set_id :: Int }  
 | ChatEventLocationChanged { new_location :: ChatLocation.ChatLocation, old_location :: ChatLocation.ChatLocation }  
 | ChatEventIsAllHistoryAvailableToggled { is_all_history_available :: Bool }  -- deriving (Show)

instance T.ToJSON ChatEventAction where
 toJSON (ChatEventMessageEdited { new_message = new_message, old_message = old_message }) =
  A.object [ "@type" A..= T.String "chatEventMessageEdited", "new_message" A..= new_message, "old_message" A..= old_message ]

 toJSON (ChatEventMessageDeleted { message = message }) =
  A.object [ "@type" A..= T.String "chatEventMessageDeleted", "message" A..= message ]

 toJSON (ChatEventPollStopped { message = message }) =
  A.object [ "@type" A..= T.String "chatEventPollStopped", "message" A..= message ]

 toJSON (ChatEventMessagePinned { message = message }) =
  A.object [ "@type" A..= T.String "chatEventMessagePinned", "message" A..= message ]

 toJSON (ChatEventMessageUnpinned {  }) =
  A.object [ "@type" A..= T.String "chatEventMessageUnpinned" ]

 toJSON (ChatEventMemberJoined {  }) =
  A.object [ "@type" A..= T.String "chatEventMemberJoined" ]

 toJSON (ChatEventMemberLeft {  }) =
  A.object [ "@type" A..= T.String "chatEventMemberLeft" ]

 toJSON (ChatEventMemberInvited { status = status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberInvited", "status" A..= status, "user_id" A..= user_id ]

 toJSON (ChatEventMemberPromoted { new_status = new_status, old_status = old_status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberPromoted", "new_status" A..= new_status, "old_status" A..= old_status, "user_id" A..= user_id ]

 toJSON (ChatEventMemberRestricted { new_status = new_status, old_status = old_status, user_id = user_id }) =
  A.object [ "@type" A..= T.String "chatEventMemberRestricted", "new_status" A..= new_status, "old_status" A..= old_status, "user_id" A..= user_id ]

 toJSON (ChatEventTitleChanged { new_title = new_title, old_title = old_title }) =
  A.object [ "@type" A..= T.String "chatEventTitleChanged", "new_title" A..= new_title, "old_title" A..= old_title ]

 toJSON (ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions }) =
  A.object [ "@type" A..= T.String "chatEventPermissionsChanged", "new_permissions" A..= new_permissions, "old_permissions" A..= old_permissions ]

 toJSON (ChatEventDescriptionChanged { new_description = new_description, old_description = old_description }) =
  A.object [ "@type" A..= T.String "chatEventDescriptionChanged", "new_description" A..= new_description, "old_description" A..= old_description ]

 toJSON (ChatEventUsernameChanged { new_username = new_username, old_username = old_username }) =
  A.object [ "@type" A..= T.String "chatEventUsernameChanged", "new_username" A..= new_username, "old_username" A..= old_username ]

 toJSON (ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo }) =
  A.object [ "@type" A..= T.String "chatEventPhotoChanged", "new_photo" A..= new_photo, "old_photo" A..= old_photo ]

 toJSON (ChatEventInvitesToggled { can_invite_users = can_invite_users }) =
  A.object [ "@type" A..= T.String "chatEventInvitesToggled", "can_invite_users" A..= can_invite_users ]

 toJSON (ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id }) =
  A.object [ "@type" A..= T.String "chatEventLinkedChatChanged", "new_linked_chat_id" A..= new_linked_chat_id, "old_linked_chat_id" A..= old_linked_chat_id ]

 toJSON (ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay }) =
  A.object [ "@type" A..= T.String "chatEventSlowModeDelayChanged", "new_slow_mode_delay" A..= new_slow_mode_delay, "old_slow_mode_delay" A..= old_slow_mode_delay ]

 toJSON (ChatEventSignMessagesToggled { sign_messages = sign_messages }) =
  A.object [ "@type" A..= T.String "chatEventSignMessagesToggled", "sign_messages" A..= sign_messages ]

 toJSON (ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id }) =
  A.object [ "@type" A..= T.String "chatEventStickerSetChanged", "new_sticker_set_id" A..= new_sticker_set_id, "old_sticker_set_id" A..= old_sticker_set_id ]

 toJSON (ChatEventLocationChanged { new_location = new_location, old_location = old_location }) =
  A.object [ "@type" A..= T.String "chatEventLocationChanged", "new_location" A..= new_location, "old_location" A..= old_location ]

 toJSON (ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available }) =
  A.object [ "@type" A..= T.String "chatEventIsAllHistoryAvailableToggled", "is_all_history_available" A..= is_all_history_available ]
-- chatEventMessageEdited ChatEventAction  { new_message :: Message.Message, old_message :: Message.Message } 

-- chatEventMessageDeleted ChatEventAction  { message :: Message.Message } 

-- chatEventPollStopped ChatEventAction  { message :: Message.Message } 

-- chatEventMessagePinned ChatEventAction  { message :: Message.Message } 

-- chatEventMessageUnpinned ChatEventAction 

-- chatEventMemberJoined ChatEventAction 

-- chatEventMemberLeft ChatEventAction 

-- chatEventMemberInvited ChatEventAction  { status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int } 

-- chatEventMemberPromoted ChatEventAction  { new_status :: ChatMemberStatus.ChatMemberStatus, old_status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int } 

-- chatEventMemberRestricted ChatEventAction  { new_status :: ChatMemberStatus.ChatMemberStatus, old_status :: ChatMemberStatus.ChatMemberStatus, user_id :: Int } 

-- chatEventTitleChanged ChatEventAction  { new_title :: String, old_title :: String } 

-- chatEventPermissionsChanged ChatEventAction  { new_permissions :: ChatPermissions.ChatPermissions, old_permissions :: ChatPermissions.ChatPermissions } 

-- chatEventDescriptionChanged ChatEventAction  { new_description :: String, old_description :: String } 

-- chatEventUsernameChanged ChatEventAction  { new_username :: String, old_username :: String } 

-- chatEventPhotoChanged ChatEventAction  { new_photo :: Photo.Photo, old_photo :: Photo.Photo } 

-- chatEventInvitesToggled ChatEventAction  { can_invite_users :: Bool } 

-- chatEventLinkedChatChanged ChatEventAction  { new_linked_chat_id :: Int, old_linked_chat_id :: Int } 

-- chatEventSlowModeDelayChanged ChatEventAction  { new_slow_mode_delay :: Int, old_slow_mode_delay :: Int } 

-- chatEventSignMessagesToggled ChatEventAction  { sign_messages :: Bool } 

-- chatEventStickerSetChanged ChatEventAction  { new_sticker_set_id :: Int, old_sticker_set_id :: Int } 

-- chatEventLocationChanged ChatEventAction  { new_location :: ChatLocation.ChatLocation, old_location :: ChatLocation.ChatLocation } 

-- chatEventIsAllHistoryAvailableToggled ChatEventAction  { is_all_history_available :: Bool } 

