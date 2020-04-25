-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Message where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup
import {-# SOURCE #-} qualified API.MessageContent as MessageContent
import {-# SOURCE #-} qualified API.MessageForwardInfo as MessageForwardInfo
import {-# SOURCE #-} qualified API.MessageSchedulingState as MessageSchedulingState
import {-# SOURCE #-} qualified API.MessageSendingState as MessageSendingState

data Message = 
 Message { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, content :: Maybe MessageContent.MessageContent, restriction_reason :: Maybe String, media_album_id :: Maybe Int, views :: Maybe Int, author_signature :: Maybe String, via_bot_user_id :: Maybe Int, ttl_expires_in :: Maybe Float, ttl :: Maybe Int, reply_to_message_id :: Maybe Int, forward_info :: Maybe MessageForwardInfo.MessageForwardInfo, edit_date :: Maybe Int, date :: Maybe Int, contains_unread_mention :: Maybe Bool, is_channel_post :: Maybe Bool, can_be_deleted_for_all_users :: Maybe Bool, can_be_deleted_only_for_self :: Maybe Bool, can_be_forwarded :: Maybe Bool, can_be_edited :: Maybe Bool, is_outgoing :: Maybe Bool, scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState, sending_state :: Maybe MessageSendingState.MessageSendingState, chat_id :: Maybe Int, sender_user_id :: Maybe Int, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON Message where
 toJSON (Message { reply_markup = reply_markup, content = content, restriction_reason = restriction_reason, media_album_id = media_album_id, views = views, author_signature = author_signature, via_bot_user_id = via_bot_user_id, ttl_expires_in = ttl_expires_in, ttl = ttl, reply_to_message_id = reply_to_message_id, forward_info = forward_info, edit_date = edit_date, date = date, contains_unread_mention = contains_unread_mention, is_channel_post = is_channel_post, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, can_be_forwarded = can_be_forwarded, can_be_edited = can_be_edited, is_outgoing = is_outgoing, scheduling_state = scheduling_state, sending_state = sending_state, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }) =
  A.object [ "@type" A..= T.String "message", "reply_markup" A..= reply_markup, "content" A..= content, "restriction_reason" A..= restriction_reason, "media_album_id" A..= media_album_id, "views" A..= views, "author_signature" A..= author_signature, "via_bot_user_id" A..= via_bot_user_id, "ttl_expires_in" A..= ttl_expires_in, "ttl" A..= ttl, "reply_to_message_id" A..= reply_to_message_id, "forward_info" A..= forward_info, "edit_date" A..= edit_date, "date" A..= date, "contains_unread_mention" A..= contains_unread_mention, "is_channel_post" A..= is_channel_post, "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users, "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self, "can_be_forwarded" A..= can_be_forwarded, "can_be_edited" A..= can_be_edited, "is_outgoing" A..= is_outgoing, "scheduling_state" A..= scheduling_state, "sending_state" A..= sending_state, "chat_id" A..= chat_id, "sender_user_id" A..= sender_user_id, "id" A..= _id ]

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
    views <- mconcat [ o A..:? "views", readMaybe <$> (o A..: "views" :: T.Parser String)] :: T.Parser (Maybe Int)
    author_signature <- o A..:? "author_signature"
    via_bot_user_id <- mconcat [ o A..:? "via_bot_user_id", readMaybe <$> (o A..: "via_bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    ttl_expires_in <- o A..:? "ttl_expires_in"
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    reply_to_message_id <- mconcat [ o A..:? "reply_to_message_id", readMaybe <$> (o A..: "reply_to_message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    forward_info <- o A..:? "forward_info"
    edit_date <- mconcat [ o A..:? "edit_date", readMaybe <$> (o A..: "edit_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    date <- mconcat [ o A..:? "date", readMaybe <$> (o A..: "date" :: T.Parser String)] :: T.Parser (Maybe Int)
    contains_unread_mention <- o A..:? "contains_unread_mention"
    is_channel_post <- o A..:? "is_channel_post"
    can_be_deleted_for_all_users <- o A..:? "can_be_deleted_for_all_users"
    can_be_deleted_only_for_self <- o A..:? "can_be_deleted_only_for_self"
    can_be_forwarded <- o A..:? "can_be_forwarded"
    can_be_edited <- o A..:? "can_be_edited"
    is_outgoing <- o A..:? "is_outgoing"
    scheduling_state <- o A..:? "scheduling_state"
    sending_state <- o A..:? "sending_state"
    chat_id <- mconcat [ o A..:? "chat_id", readMaybe <$> (o A..: "chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    sender_user_id <- mconcat [ o A..:? "sender_user_id", readMaybe <$> (o A..: "sender_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    _id <- mconcat [ o A..:? "_id", readMaybe <$> (o A..: "_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ Message { reply_markup = reply_markup, content = content, restriction_reason = restriction_reason, media_album_id = media_album_id, views = views, author_signature = author_signature, via_bot_user_id = via_bot_user_id, ttl_expires_in = ttl_expires_in, ttl = ttl, reply_to_message_id = reply_to_message_id, forward_info = forward_info, edit_date = edit_date, date = date, contains_unread_mention = contains_unread_mention, is_channel_post = is_channel_post, can_be_deleted_for_all_users = can_be_deleted_for_all_users, can_be_deleted_only_for_self = can_be_deleted_only_for_self, can_be_forwarded = can_be_forwarded, can_be_edited = can_be_edited, is_outgoing = is_outgoing, scheduling_state = scheduling_state, sending_state = sending_state, chat_id = chat_id, sender_user_id = sender_user_id, _id = _id }