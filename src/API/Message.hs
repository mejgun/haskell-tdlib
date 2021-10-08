-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Message where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.MessageContent as MessageContent
import {-# SOURCE #-} qualified API.MessageInteractionInfo as MessageInteractionInfo
import {-# SOURCE #-} qualified API.MessageForwardInfo as MessageForwardInfo
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState
import {-# SOURCE #-} qualified API.MessageSendingState as MessageSendingState
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Describes a message
-- 
-- __id__ Message identifier; unique for the chat to which the message belongs
-- 
-- __sender__ The sender of the message
-- 
-- __chat_id__ Chat identifier
-- 
-- __sending_state__ Information about the sending state of the message; may be null
-- 
-- __scheduling_state__ Information about the scheduling state of the message; may be null
-- 
-- __is_outgoing__ True, if the message is outgoing
-- 
-- __is_pinned__ True, if the message is pinned
-- 
-- __can_be_edited__ True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
-- 
-- __can_be_forwarded__ True, if the message can be forwarded
-- 
-- __can_be_deleted_only_for_self__ True, if the message can be deleted only for the current user while other users will continue to see it
-- 
-- __can_be_deleted_for_all_users__ True, if the message can be deleted for all users
-- 
-- __can_get_statistics__ True, if the message statistics are available
-- 
-- __can_get_message_thread__ True, if the message thread info is available
-- 
-- __can_get_viewers__ True, if chat members already viewed the message can be received through getMessageViewers
-- 
-- __can_get_media_timestamp_links__ True, if media timestamp links can be generated for media timestamp entities in the message text, caption or web page description
-- 
-- __has_timestamped_media__ True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
-- 
-- __is_channel_post__ True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
-- 
-- __contains_unread_mention__ True, if the message contains an unread mention for the current user
-- 
-- __date__ Point in time (Unix timestamp) when the message was sent
-- 
-- __edit_date__ Point in time (Unix timestamp) when the message was last edited
-- 
-- __forward_info__ Information about the initial message sender; may be null
-- 
-- __interaction_info__ Information about interactions with the message; may be null
-- 
-- __reply_in_chat_id__ If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
-- 
-- __reply_to_message_id__ If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
-- 
-- __message_thread_id__ If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
-- 
-- __ttl__ For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
-- 
-- __ttl_expires_in__ Time left before the message expires, in seconds. If the TTL timer isn't started yet, equals to the value of the ttl field
-- 
-- __via_bot_user_id__ If non-zero, the user identifier of the bot through which this message was sent
-- 
-- __author_signature__ For channel posts and anonymous group messages, optional author signature
-- 
-- __media_album_id__ Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
-- 
-- __restriction_reason__ If non-empty, contains a human-readable description of the reason why access to this message must be restricted
-- 
-- __content__ Content of the message
-- 
-- __reply_markup__ Reply markup for the message; may be null
data Message = 

 Message { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, content :: Maybe MessageContent.MessageContent, restriction_reason :: Maybe String, media_album_id :: Maybe Int, author_signature :: Maybe String, via_bot_user_id :: Maybe Int, ttl_expires_in :: Maybe Float, ttl :: Maybe Int, message_thread_id :: Maybe Int, reply_to_message_id :: Maybe Int, reply_in_chat_id :: Maybe Int, interaction_info :: Maybe MessageInteractionInfo.MessageInteractionInfo, forward_info :: Maybe MessageForwardInfo.MessageForwardInfo, edit_date :: Maybe Int, date :: Maybe Int, contains_unread_mention :: Maybe Bool, is_channel_post :: Maybe Bool, has_timestamped_media :: Maybe Bool, can_get_media_timestamp_links :: Maybe Bool, can_get_viewers :: Maybe Bool, can_get_message_thread :: Maybe Bool, can_get_statistics :: Maybe Bool, can_be_deleted_for_all_users :: Maybe Bool, can_be_deleted_only_for_self :: Maybe Bool, can_be_forwarded :: Maybe Bool, can_be_edited :: Maybe Bool, is_pinned :: Maybe Bool, is_outgoing :: Maybe Bool, scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, sending_state :: Maybe MessageSendingState.MessageSendingState, chat_id :: Maybe Int, sender :: Maybe MessageSender.MessageSender, _id :: Maybe Int }  deriving (Eq)

instance Show Message where
 show Message { reply_markup=reply_markup, content=content, restriction_reason=restriction_reason, media_album_id=media_album_id, author_signature=author_signature, via_bot_user_id=via_bot_user_id, ttl_expires_in=ttl_expires_in, ttl=ttl, message_thread_id=message_thread_id, reply_to_message_id=reply_to_message_id, reply_in_chat_id=reply_in_chat_id, interaction_info=interaction_info, forward_info=forward_info, edit_date=edit_date, date=date, contains_unread_mention=contains_unread_mention, is_channel_post=is_channel_post, has_timestamped_media=has_timestamped_media, can_get_media_timestamp_links=can_get_media_timestamp_links, can_get_viewers=can_get_viewers, can_get_message_thread=can_get_message_thread, can_get_statistics=can_get_statistics, can_be_deleted_for_all_users=can_be_deleted_for_all_users, can_be_deleted_only_for_self=can_be_deleted_only_for_self, can_be_forwarded=can_be_forwarded, can_be_edited=can_be_edited, is_pinned=is_pinned, is_outgoing=is_outgoing, scheduling_state=scheduling_state, sending_state=sending_state, chat_id=chat_id, sender=sender, _id=_id } =
  "Message" ++ cc [p "reply_markup" reply_markup, p "content" content, p "restriction_reason" restriction_reason, p "media_album_id" media_album_id, p "author_signature" author_signature, p "via_bot_user_id" via_bot_user_id, p "ttl_expires_in" ttl_expires_in, p "ttl" ttl, p "message_thread_id" message_thread_id, p "reply_to_message_id" reply_to_message_id, p "reply_in_chat_id" reply_in_chat_id, p "interaction_info" interaction_info, p "forward_info" forward_info, p "edit_date" edit_date, p "date" date, p "contains_unread_mention" contains_unread_mention, p "is_channel_post" is_channel_post, p "has_timestamped_media" has_timestamped_media, p "can_get_media_timestamp_links" can_get_media_timestamp_links, p "can_get_viewers" can_get_viewers, p "can_get_message_thread" can_get_message_thread, p "can_get_statistics" can_get_statistics, p "can_be_deleted_for_all_users" can_be_deleted_for_all_users, p "can_be_deleted_only_for_self" can_be_deleted_only_for_self, p "can_be_forwarded" can_be_forwarded, p "can_be_edited" can_be_edited, p "is_pinned" is_pinned, p "is_outgoing" is_outgoing, p "scheduling_state" scheduling_state, p "sending_state" sending_state, p "chat_id" chat_id, p "sender" sender, p "_id" _id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON Message where
 toJSON Message { reply_markup = reply_markup, content = content, restriction_reason = restriction_reason, media_album_id = media_album_id, author_signature = author_signature, via_bot_user_id = via_bot_user_id, ttl_expires_in = ttl_expires_in, ttl = ttl, message_thread_id = message_thread_id, reply_to_message_id = reply_to_message_id, reply_in_chat_id = reply_in_chat_id, interaction_info = interaction_info, forward_info = forward_info, edit_date = edit_date, date = date, contains_unread_mention = contains_unread_mention, is_channel_post = is_channel_post, has_timestamped_media = has_timestamped_media, can_get_media_timestamp_links = can_get_media_timestamp_links, can_get_viewers = can_get_viewers, can_get_message_thread = can_get_message_thread, can_get_statistics = can_get_statistics, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, can_be_forwarded = can_be_forwarded, can_be_edited = can_be_edited, is_pinned = is_pinned, is_outgoing = is_outgoing, scheduling_state = scheduling_state, sending_state = sending_state, chat_id = chat_id, sender = sender, _id = _id } =
  A.object [ "@type" A..= T.String "message", "reply_markup" A..= reply_markup, "content" A..= content, "restriction_reason" A..= restriction_reason, "media_album_id" A..= media_album_id, "author_signature" A..= author_signature, "via_bot_user_id" A..= via_bot_user_id, "ttl_expires_in" A..= ttl_expires_in, "ttl" A..= ttl, "message_thread_id" A..= message_thread_id, "reply_to_message_id" A..= reply_to_message_id, "reply_in_chat_id" A..= reply_in_chat_id, "interaction_info" A..= interaction_info, "forward_info" A..= forward_info, "edit_date" A..= edit_date, "date" A..= date, "contains_unread_mention" A..= contains_unread_mention, "is_channel_post" A..= is_channel_post, "has_timestamped_media" A..= has_timestamped_media, "can_get_media_timestamp_links" A..= can_get_media_timestamp_links, "can_get_viewers" A..= can_get_viewers, "can_get_message_thread" A..= can_get_message_thread, "can_get_statistics" A..= can_get_statistics, "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users, "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self, "can_be_forwarded" A..= can_be_forwarded, "can_be_edited" A..= can_be_edited, "is_pinned" A..= is_pinned, "is_outgoing" A..= is_outgoing, "scheduling_state" A..= scheduling_state, "sending_state" A..= sending_state, "chat_id" A..= chat_id, "sender" A..= sender, "id" A..= _id ]

instance T.FromJSON Message where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "message" -> parseMessage v
   _ -> mempty
  where
   parseMessage :: A.Value -> T.Parser Message
   parseMessage = A.withObject "Message" $ \o -> do
    reply_markup <- o A..:? "reply_markup"
    content <- o A..:? "content"
    restriction_reason <- o A..:? "restriction_reason"
    media_album_id <- mconcat [ o A..:? "media_album_id", readMaybe <$> (o A..: "media_album_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    author_signature <- o A..:? "author_signature"
    via_bot_user_id <- mconcat [ o A..:? "via_bot_user_id", readMaybe <$> (o A..: "via_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    ttl_expires_in <- o A..:? "ttl_expires_in"
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    message_thread_id <- mconcat [ o A..:? "message_thread_id", readMaybe <$> (o A..: "message_thread_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    reply_in_chat_id <- mconcat [ o A..:? "reply_in_chat_id", readMaybe <$> (o A..: "reply_in_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    interaction_info <- o A..:? "interaction_info"
    forward_info <- o A..:? "forward_info"
    edit_date <- mconcat [ o A..:? "edit_date", readMaybe <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    contains_unread_mention <- o A..:? "contains_unread_mention"
    is_channel_post <- o A..:? "is_channel_post"
    has_timestamped_media <- o A..:? "has_timestamped_media"
    can_get_media_timestamp_links <- o A..:? "can_get_media_timestamp_links"
    can_get_viewers <- o A..:? "can_get_viewers"
    can_get_message_thread <- o A..:? "can_get_message_thread"
    can_get_statistics <- o A..:? "can_get_statistics"
    can_be_deleted_for_all_users <- o A..:? "can_be_deleted_for_all_users"
    can_be_deleted_only_for_self <- o A..:? "can_be_deleted_only_for_self"
    can_be_forwarded <- o A..:? "can_be_forwarded"
    can_be_edited <- o A..:? "can_be_edited"
    is_pinned <- o A..:? "is_pinned"
    is_outgoing <- o A..:? "is_outgoing"
    scheduling_state <- o A..:? "scheduling_state"
    sending_state <- o A..:? "sending_state"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender <- o A..:? "sender"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Message { reply_markup = reply_markup, content = content, restriction_reason = restriction_reason, media_album_id = media_album_id, author_signature = author_signature, via_bot_user_id = via_bot_user_id, ttl_expires_in = ttl_expires_in, ttl = ttl, message_thread_id = message_thread_id, reply_to_message_id = reply_to_message_id, reply_in_chat_id = reply_in_chat_id, interaction_info = interaction_info, forward_info = forward_info, edit_date = edit_date, date = date, contains_unread_mention = contains_unread_mention, is_channel_post = is_channel_post, has_timestamped_media = has_timestamped_media, can_get_media_timestamp_links = can_get_media_timestamp_links, can_get_viewers = can_get_viewers, can_get_message_thread = can_get_message_thread, can_get_statistics = can_get_statistics, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, can_be_forwarded = can_be_forwarded, can_be_edited = can_be_edited, is_pinned = is_pinned, is_outgoing = is_outgoing, scheduling_state = scheduling_state, sending_state = sending_state, chat_id = chat_id, sender = sender, _id = _id }
 parseJSON _ = mempty
