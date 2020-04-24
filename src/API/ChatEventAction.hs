-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ChatEventAction where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Message as Message
import {-# SOURCE #-} qualified API.ChatMemberStatus as ChatMemberStatus
import {-# SOURCE #-} qualified API.ChatPermissions as ChatPermissions
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.ChatLocation as ChatLocation

data ChatEventAction = 
 ChatEventMessageEdited { new_message :: Maybe Message.Message, old_message :: Maybe Message.Message }  
 | ChatEventMessageDeleted { message :: Maybe Message.Message }  
 | ChatEventPollStopped { message :: Maybe Message.Message }  
 | ChatEventMessagePinned { message :: Maybe Message.Message }  
 | ChatEventMessageUnpinned 
 | ChatEventMemberJoined 
 | ChatEventMemberLeft 
 | ChatEventMemberInvited { status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int }  
 | ChatEventMemberPromoted { new_status :: Maybe ChatMemberStatus.ChatMemberStatus, old_status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int }  
 | ChatEventMemberRestricted { new_status :: Maybe ChatMemberStatus.ChatMemberStatus, old_status :: Maybe ChatMemberStatus.ChatMemberStatus, user_id :: Maybe Int }  
 | ChatEventTitleChanged { new_title :: Maybe String, old_title :: Maybe String }  
 | ChatEventPermissionsChanged { new_permissions :: Maybe ChatPermissions.ChatPermissions, old_permissions :: Maybe ChatPermissions.ChatPermissions }  
 | ChatEventDescriptionChanged { new_description :: Maybe String, old_description :: Maybe String }  
 | ChatEventUsernameChanged { new_username :: Maybe String, old_username :: Maybe String }  
 | ChatEventPhotoChanged { new_photo :: Maybe Photo.Photo, old_photo :: Maybe Photo.Photo }  
 | ChatEventInvitesToggled { can_invite_users :: Maybe Bool }  
 | ChatEventLinkedChatChanged { new_linked_chat_id :: Maybe Int, old_linked_chat_id :: Maybe Int }  
 | ChatEventSlowModeDelayChanged { new_slow_mode_delay :: Maybe Int, old_slow_mode_delay :: Maybe Int }  
 | ChatEventSignMessagesToggled { sign_messages :: Maybe Bool }  
 | ChatEventStickerSetChanged { new_sticker_set_id :: Maybe Int, old_sticker_set_id :: Maybe Int }  
 | ChatEventLocationChanged { new_location :: Maybe ChatLocation.ChatLocation, old_location :: Maybe ChatLocation.ChatLocation }  
 | ChatEventIsAllHistoryAvailableToggled { is_all_history_available :: Maybe Bool }  deriving (Show, Eq)

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

instance T.FromJSON ChatEventAction where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "chatEventMessageEdited" -> parseChatEventMessageEdited v
   "chatEventMessageDeleted" -> parseChatEventMessageDeleted v
   "chatEventPollStopped" -> parseChatEventPollStopped v
   "chatEventMessagePinned" -> parseChatEventMessagePinned v
   "chatEventMessageUnpinned" -> parseChatEventMessageUnpinned v
   "chatEventMemberJoined" -> parseChatEventMemberJoined v
   "chatEventMemberLeft" -> parseChatEventMemberLeft v
   "chatEventMemberInvited" -> parseChatEventMemberInvited v
   "chatEventMemberPromoted" -> parseChatEventMemberPromoted v
   "chatEventMemberRestricted" -> parseChatEventMemberRestricted v
   "chatEventTitleChanged" -> parseChatEventTitleChanged v
   "chatEventPermissionsChanged" -> parseChatEventPermissionsChanged v
   "chatEventDescriptionChanged" -> parseChatEventDescriptionChanged v
   "chatEventUsernameChanged" -> parseChatEventUsernameChanged v
   "chatEventPhotoChanged" -> parseChatEventPhotoChanged v
   "chatEventInvitesToggled" -> parseChatEventInvitesToggled v
   "chatEventLinkedChatChanged" -> parseChatEventLinkedChatChanged v
   "chatEventSlowModeDelayChanged" -> parseChatEventSlowModeDelayChanged v
   "chatEventSignMessagesToggled" -> parseChatEventSignMessagesToggled v
   "chatEventStickerSetChanged" -> parseChatEventStickerSetChanged v
   "chatEventLocationChanged" -> parseChatEventLocationChanged v
   "chatEventIsAllHistoryAvailableToggled" -> parseChatEventIsAllHistoryAvailableToggled v
   _ -> mempty
  where
   parseChatEventMessageEdited :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageEdited = A.withObject "ChatEventMessageEdited" $ \o -> do
    new_message <- optional $ o A..: "new_message"
    old_message <- optional $ o A..: "old_message"
    return $ ChatEventMessageEdited { new_message = new_message, old_message = old_message }

   parseChatEventMessageDeleted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageDeleted = A.withObject "ChatEventMessageDeleted" $ \o -> do
    message <- optional $ o A..: "message"
    return $ ChatEventMessageDeleted { message = message }

   parseChatEventPollStopped :: A.Value -> T.Parser ChatEventAction
   parseChatEventPollStopped = A.withObject "ChatEventPollStopped" $ \o -> do
    message <- optional $ o A..: "message"
    return $ ChatEventPollStopped { message = message }

   parseChatEventMessagePinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessagePinned = A.withObject "ChatEventMessagePinned" $ \o -> do
    message <- optional $ o A..: "message"
    return $ ChatEventMessagePinned { message = message }

   parseChatEventMessageUnpinned :: A.Value -> T.Parser ChatEventAction
   parseChatEventMessageUnpinned = A.withObject "ChatEventMessageUnpinned" $ \o -> do
    return $ ChatEventMessageUnpinned {  }

   parseChatEventMemberJoined :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberJoined = A.withObject "ChatEventMemberJoined" $ \o -> do
    return $ ChatEventMemberJoined {  }

   parseChatEventMemberLeft :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberLeft = A.withObject "ChatEventMemberLeft" $ \o -> do
    return $ ChatEventMemberLeft {  }

   parseChatEventMemberInvited :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberInvited = A.withObject "ChatEventMemberInvited" $ \o -> do
    status <- optional $ o A..: "status"
    user_id <- optional $ o A..: "user_id"
    return $ ChatEventMemberInvited { status = status, user_id = user_id }

   parseChatEventMemberPromoted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberPromoted = A.withObject "ChatEventMemberPromoted" $ \o -> do
    new_status <- optional $ o A..: "new_status"
    old_status <- optional $ o A..: "old_status"
    user_id <- optional $ o A..: "user_id"
    return $ ChatEventMemberPromoted { new_status = new_status, old_status = old_status, user_id = user_id }

   parseChatEventMemberRestricted :: A.Value -> T.Parser ChatEventAction
   parseChatEventMemberRestricted = A.withObject "ChatEventMemberRestricted" $ \o -> do
    new_status <- optional $ o A..: "new_status"
    old_status <- optional $ o A..: "old_status"
    user_id <- optional $ o A..: "user_id"
    return $ ChatEventMemberRestricted { new_status = new_status, old_status = old_status, user_id = user_id }

   parseChatEventTitleChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventTitleChanged = A.withObject "ChatEventTitleChanged" $ \o -> do
    new_title <- optional $ o A..: "new_title"
    old_title <- optional $ o A..: "old_title"
    return $ ChatEventTitleChanged { new_title = new_title, old_title = old_title }

   parseChatEventPermissionsChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPermissionsChanged = A.withObject "ChatEventPermissionsChanged" $ \o -> do
    new_permissions <- optional $ o A..: "new_permissions"
    old_permissions <- optional $ o A..: "old_permissions"
    return $ ChatEventPermissionsChanged { new_permissions = new_permissions, old_permissions = old_permissions }

   parseChatEventDescriptionChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventDescriptionChanged = A.withObject "ChatEventDescriptionChanged" $ \o -> do
    new_description <- optional $ o A..: "new_description"
    old_description <- optional $ o A..: "old_description"
    return $ ChatEventDescriptionChanged { new_description = new_description, old_description = old_description }

   parseChatEventUsernameChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventUsernameChanged = A.withObject "ChatEventUsernameChanged" $ \o -> do
    new_username <- optional $ o A..: "new_username"
    old_username <- optional $ o A..: "old_username"
    return $ ChatEventUsernameChanged { new_username = new_username, old_username = old_username }

   parseChatEventPhotoChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventPhotoChanged = A.withObject "ChatEventPhotoChanged" $ \o -> do
    new_photo <- optional $ o A..: "new_photo"
    old_photo <- optional $ o A..: "old_photo"
    return $ ChatEventPhotoChanged { new_photo = new_photo, old_photo = old_photo }

   parseChatEventInvitesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventInvitesToggled = A.withObject "ChatEventInvitesToggled" $ \o -> do
    can_invite_users <- optional $ o A..: "can_invite_users"
    return $ ChatEventInvitesToggled { can_invite_users = can_invite_users }

   parseChatEventLinkedChatChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLinkedChatChanged = A.withObject "ChatEventLinkedChatChanged" $ \o -> do
    new_linked_chat_id <- optional $ o A..: "new_linked_chat_id"
    old_linked_chat_id <- optional $ o A..: "old_linked_chat_id"
    return $ ChatEventLinkedChatChanged { new_linked_chat_id = new_linked_chat_id, old_linked_chat_id = old_linked_chat_id }

   parseChatEventSlowModeDelayChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventSlowModeDelayChanged = A.withObject "ChatEventSlowModeDelayChanged" $ \o -> do
    new_slow_mode_delay <- optional $ o A..: "new_slow_mode_delay"
    old_slow_mode_delay <- optional $ o A..: "old_slow_mode_delay"
    return $ ChatEventSlowModeDelayChanged { new_slow_mode_delay = new_slow_mode_delay, old_slow_mode_delay = old_slow_mode_delay }

   parseChatEventSignMessagesToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventSignMessagesToggled = A.withObject "ChatEventSignMessagesToggled" $ \o -> do
    sign_messages <- optional $ o A..: "sign_messages"
    return $ ChatEventSignMessagesToggled { sign_messages = sign_messages }

   parseChatEventStickerSetChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventStickerSetChanged = A.withObject "ChatEventStickerSetChanged" $ \o -> do
    new_sticker_set_id <- optional $ o A..: "new_sticker_set_id"
    old_sticker_set_id <- optional $ o A..: "old_sticker_set_id"
    return $ ChatEventStickerSetChanged { new_sticker_set_id = new_sticker_set_id, old_sticker_set_id = old_sticker_set_id }

   parseChatEventLocationChanged :: A.Value -> T.Parser ChatEventAction
   parseChatEventLocationChanged = A.withObject "ChatEventLocationChanged" $ \o -> do
    new_location <- optional $ o A..: "new_location"
    old_location <- optional $ o A..: "old_location"
    return $ ChatEventLocationChanged { new_location = new_location, old_location = old_location }

   parseChatEventIsAllHistoryAvailableToggled :: A.Value -> T.Parser ChatEventAction
   parseChatEventIsAllHistoryAvailableToggled = A.withObject "ChatEventIsAllHistoryAvailableToggled" $ \o -> do
    is_all_history_available <- optional $ o A..: "is_all_history_available"
    return $ ChatEventIsAllHistoryAvailableToggled { is_all_history_available = is_all_history_available }