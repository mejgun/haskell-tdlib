{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.Message where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.MessageForwardInfo as MessageForwardInfo
import qualified TD.Data.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.MessageSendingState as MessageSendingState
import qualified TD.Data.ReplyMarkup as ReplyMarkup
import qualified TD.Data.UnreadReaction as UnreadReaction
import qualified Utils as U

-- |
data Message = -- | Describes a message
  Message
  { -- | Reply markup for the message; may be null
    reply_markup :: Maybe ReplyMarkup.ReplyMarkup,
    -- | Content of the message
    content :: Maybe MessageContent.MessageContent,
    -- | If non-empty, contains a human-readable description of the reason why access to this message must be restricted
    restriction_reason :: Maybe String,
    -- | Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
    media_album_id :: Maybe Int,
    -- | For channel posts and anonymous group messages, optional author signature
    author_signature :: Maybe String,
    -- | If non-zero, the user identifier of the bot through which this message was sent
    via_bot_user_id :: Maybe Int,
    -- | Time left before the message expires, in seconds. If the TTL timer isn't started yet, equals to the value of the ttl field
    ttl_expires_in :: Maybe Float,
    -- | For self-destructing messages, the message's TTL (Time To Live), in seconds; 0 if none. TDLib will send updateDeleteMessages or updateMessageContent once the TTL expires
    ttl :: Maybe Int,
    -- | If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
    message_thread_id :: Maybe Int,
    -- | If non-zero, the identifier of the message this message is replying to; can be the identifier of a deleted message
    reply_to_message_id :: Maybe Int,
    -- | If non-zero, the identifier of the chat to which the replied message belongs; Currently, only messages in the Replies chat can have different reply_in_chat_id and chat_id
    reply_in_chat_id :: Maybe Int,
    -- | Information about unread reactions added to the message
    unread_reactions :: Maybe [UnreadReaction.UnreadReaction],
    -- | Information about interactions with the message; may be null
    interaction_info :: Maybe MessageInteractionInfo.MessageInteractionInfo,
    -- | Information about the initial message sender; may be null
    forward_info :: Maybe MessageForwardInfo.MessageForwardInfo,
    -- | Point in time (Unix timestamp) when the message was last edited
    edit_date :: Maybe Int,
    -- | Point in time (Unix timestamp) when the message was sent
    date :: Maybe Int,
    -- | True, if the message contains an unread mention for the current user
    contains_unread_mention :: Maybe Bool,
    -- | True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
    is_channel_post :: Maybe Bool,
    -- | True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
    has_timestamped_media :: Maybe Bool,
    -- | True, if media timestamp links can be generated for media timestamp entities in the message text, caption or web page description through getMessageLink
    can_get_media_timestamp_links :: Maybe Bool,
    -- | True, if chat members already viewed the message can be received through getMessageViewers
    can_get_viewers :: Maybe Bool,
    -- | True, if information about the message thread is available through getMessageThread
    can_get_message_thread :: Maybe Bool,
    -- | True, if the message statistics are available through getMessageStatistics
    can_get_statistics :: Maybe Bool,
    -- | True, if the list of added reactions is available through getMessageAddedReactions
    can_get_added_reactions :: Maybe Bool,
    -- | True, if the message can be deleted for all users
    can_be_deleted_for_all_users :: Maybe Bool,
    -- | True, if the message can be deleted only for the current user while other users will continue to see it
    can_be_deleted_only_for_self :: Maybe Bool,
    -- | True, if content of the message can be saved locally or copied
    can_be_saved :: Maybe Bool,
    -- | True, if the message can be forwarded
    can_be_forwarded :: Maybe Bool,
    -- | True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
    can_be_edited :: Maybe Bool,
    -- | True, if the message is pinned
    is_pinned :: Maybe Bool,
    -- | True, if the message is outgoing
    is_outgoing :: Maybe Bool,
    -- | The scheduling state of the message; may be null
    scheduling_state :: Maybe MessageSchedulingState.MessageSchedulingState,
    -- | The sending state of the message; may be null
    sending_state :: Maybe MessageSendingState.MessageSendingState,
    -- | Chat identifier
    chat_id :: Maybe Int,
    -- | Identifier of the sender of the message
    sender_id :: Maybe MessageSender.MessageSender,
    -- | Message identifier; unique for the chat to which the message belongs
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show Message where
  show
    Message
      { reply_markup = reply_markup_,
        content = content_,
        restriction_reason = restriction_reason_,
        media_album_id = media_album_id_,
        author_signature = author_signature_,
        via_bot_user_id = via_bot_user_id_,
        ttl_expires_in = ttl_expires_in_,
        ttl = ttl_,
        message_thread_id = message_thread_id_,
        reply_to_message_id = reply_to_message_id_,
        reply_in_chat_id = reply_in_chat_id_,
        unread_reactions = unread_reactions_,
        interaction_info = interaction_info_,
        forward_info = forward_info_,
        edit_date = edit_date_,
        date = date_,
        contains_unread_mention = contains_unread_mention_,
        is_channel_post = is_channel_post_,
        has_timestamped_media = has_timestamped_media_,
        can_get_media_timestamp_links = can_get_media_timestamp_links_,
        can_get_viewers = can_get_viewers_,
        can_get_message_thread = can_get_message_thread_,
        can_get_statistics = can_get_statistics_,
        can_get_added_reactions = can_get_added_reactions_,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users_,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self_,
        can_be_saved = can_be_saved_,
        can_be_forwarded = can_be_forwarded_,
        can_be_edited = can_be_edited_,
        is_pinned = is_pinned_,
        is_outgoing = is_outgoing_,
        scheduling_state = scheduling_state_,
        sending_state = sending_state_,
        chat_id = chat_id_,
        sender_id = sender_id_,
        _id = _id_
      } =
      "Message"
        ++ U.cc
          [ U.p "reply_markup" reply_markup_,
            U.p "content" content_,
            U.p "restriction_reason" restriction_reason_,
            U.p "media_album_id" media_album_id_,
            U.p "author_signature" author_signature_,
            U.p "via_bot_user_id" via_bot_user_id_,
            U.p "ttl_expires_in" ttl_expires_in_,
            U.p "ttl" ttl_,
            U.p "message_thread_id" message_thread_id_,
            U.p "reply_to_message_id" reply_to_message_id_,
            U.p "reply_in_chat_id" reply_in_chat_id_,
            U.p "unread_reactions" unread_reactions_,
            U.p "interaction_info" interaction_info_,
            U.p "forward_info" forward_info_,
            U.p "edit_date" edit_date_,
            U.p "date" date_,
            U.p "contains_unread_mention" contains_unread_mention_,
            U.p "is_channel_post" is_channel_post_,
            U.p "has_timestamped_media" has_timestamped_media_,
            U.p "can_get_media_timestamp_links" can_get_media_timestamp_links_,
            U.p "can_get_viewers" can_get_viewers_,
            U.p "can_get_message_thread" can_get_message_thread_,
            U.p "can_get_statistics" can_get_statistics_,
            U.p "can_get_added_reactions" can_get_added_reactions_,
            U.p "can_be_deleted_for_all_users" can_be_deleted_for_all_users_,
            U.p "can_be_deleted_only_for_self" can_be_deleted_only_for_self_,
            U.p "can_be_saved" can_be_saved_,
            U.p "can_be_forwarded" can_be_forwarded_,
            U.p "can_be_edited" can_be_edited_,
            U.p "is_pinned" is_pinned_,
            U.p "is_outgoing" is_outgoing_,
            U.p "scheduling_state" scheduling_state_,
            U.p "sending_state" sending_state_,
            U.p "chat_id" chat_id_,
            U.p "sender_id" sender_id_,
            U.p "_id" _id_
          ]

instance T.FromJSON Message where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "message" -> parseMessage v
      _ -> mempty
    where
      parseMessage :: A.Value -> T.Parser Message
      parseMessage = A.withObject "Message" $ \o -> do
        reply_markup_ <- o A..:? "reply_markup"
        content_ <- o A..:? "content"
        restriction_reason_ <- o A..:? "restriction_reason"
        media_album_id_ <- U.rm <$> (o A..: "media_album_id" :: T.Parser String) :: T.Parser (Maybe Int)
        author_signature_ <- o A..:? "author_signature"
        via_bot_user_id_ <- o A..:? "via_bot_user_id"
        ttl_expires_in_ <- o A..:? "ttl_expires_in"
        ttl_ <- o A..:? "ttl"
        message_thread_id_ <- o A..:? "message_thread_id"
        reply_to_message_id_ <- o A..:? "reply_to_message_id"
        reply_in_chat_id_ <- o A..:? "reply_in_chat_id"
        unread_reactions_ <- o A..:? "unread_reactions"
        interaction_info_ <- o A..:? "interaction_info"
        forward_info_ <- o A..:? "forward_info"
        edit_date_ <- o A..:? "edit_date"
        date_ <- o A..:? "date"
        contains_unread_mention_ <- o A..:? "contains_unread_mention"
        is_channel_post_ <- o A..:? "is_channel_post"
        has_timestamped_media_ <- o A..:? "has_timestamped_media"
        can_get_media_timestamp_links_ <- o A..:? "can_get_media_timestamp_links"
        can_get_viewers_ <- o A..:? "can_get_viewers"
        can_get_message_thread_ <- o A..:? "can_get_message_thread"
        can_get_statistics_ <- o A..:? "can_get_statistics"
        can_get_added_reactions_ <- o A..:? "can_get_added_reactions"
        can_be_deleted_for_all_users_ <- o A..:? "can_be_deleted_for_all_users"
        can_be_deleted_only_for_self_ <- o A..:? "can_be_deleted_only_for_self"
        can_be_saved_ <- o A..:? "can_be_saved"
        can_be_forwarded_ <- o A..:? "can_be_forwarded"
        can_be_edited_ <- o A..:? "can_be_edited"
        is_pinned_ <- o A..:? "is_pinned"
        is_outgoing_ <- o A..:? "is_outgoing"
        scheduling_state_ <- o A..:? "scheduling_state"
        sending_state_ <- o A..:? "sending_state"
        chat_id_ <- o A..:? "chat_id"
        sender_id_ <- o A..:? "sender_id"
        _id_ <- o A..:? "id"
        return $ Message {reply_markup = reply_markup_, content = content_, restriction_reason = restriction_reason_, media_album_id = media_album_id_, author_signature = author_signature_, via_bot_user_id = via_bot_user_id_, ttl_expires_in = ttl_expires_in_, ttl = ttl_, message_thread_id = message_thread_id_, reply_to_message_id = reply_to_message_id_, reply_in_chat_id = reply_in_chat_id_, unread_reactions = unread_reactions_, interaction_info = interaction_info_, forward_info = forward_info_, edit_date = edit_date_, date = date_, contains_unread_mention = contains_unread_mention_, is_channel_post = is_channel_post_, has_timestamped_media = has_timestamped_media_, can_get_media_timestamp_links = can_get_media_timestamp_links_, can_get_viewers = can_get_viewers_, can_get_message_thread = can_get_message_thread_, can_get_statistics = can_get_statistics_, can_get_added_reactions = can_get_added_reactions_, can_be_deleted_for_all_users = can_be_deleted_for_all_users_, can_be_deleted_only_for_self = can_be_deleted_only_for_self_, can_be_saved = can_be_saved_, can_be_forwarded = can_be_forwarded_, can_be_edited = can_be_edited_, is_pinned = is_pinned_, is_outgoing = is_outgoing_, scheduling_state = scheduling_state_, sending_state = sending_state_, chat_id = chat_id_, sender_id = sender_id_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON Message where
  toJSON
    Message
      { reply_markup = reply_markup_,
        content = content_,
        restriction_reason = restriction_reason_,
        media_album_id = media_album_id_,
        author_signature = author_signature_,
        via_bot_user_id = via_bot_user_id_,
        ttl_expires_in = ttl_expires_in_,
        ttl = ttl_,
        message_thread_id = message_thread_id_,
        reply_to_message_id = reply_to_message_id_,
        reply_in_chat_id = reply_in_chat_id_,
        unread_reactions = unread_reactions_,
        interaction_info = interaction_info_,
        forward_info = forward_info_,
        edit_date = edit_date_,
        date = date_,
        contains_unread_mention = contains_unread_mention_,
        is_channel_post = is_channel_post_,
        has_timestamped_media = has_timestamped_media_,
        can_get_media_timestamp_links = can_get_media_timestamp_links_,
        can_get_viewers = can_get_viewers_,
        can_get_message_thread = can_get_message_thread_,
        can_get_statistics = can_get_statistics_,
        can_get_added_reactions = can_get_added_reactions_,
        can_be_deleted_for_all_users = can_be_deleted_for_all_users_,
        can_be_deleted_only_for_self = can_be_deleted_only_for_self_,
        can_be_saved = can_be_saved_,
        can_be_forwarded = can_be_forwarded_,
        can_be_edited = can_be_edited_,
        is_pinned = is_pinned_,
        is_outgoing = is_outgoing_,
        scheduling_state = scheduling_state_,
        sending_state = sending_state_,
        chat_id = chat_id_,
        sender_id = sender_id_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "message",
          "reply_markup" A..= reply_markup_,
          "content" A..= content_,
          "restriction_reason" A..= restriction_reason_,
          "media_album_id" A..= media_album_id_,
          "author_signature" A..= author_signature_,
          "via_bot_user_id" A..= via_bot_user_id_,
          "ttl_expires_in" A..= ttl_expires_in_,
          "ttl" A..= ttl_,
          "message_thread_id" A..= message_thread_id_,
          "reply_to_message_id" A..= reply_to_message_id_,
          "reply_in_chat_id" A..= reply_in_chat_id_,
          "unread_reactions" A..= unread_reactions_,
          "interaction_info" A..= interaction_info_,
          "forward_info" A..= forward_info_,
          "edit_date" A..= edit_date_,
          "date" A..= date_,
          "contains_unread_mention" A..= contains_unread_mention_,
          "is_channel_post" A..= is_channel_post_,
          "has_timestamped_media" A..= has_timestamped_media_,
          "can_get_media_timestamp_links" A..= can_get_media_timestamp_links_,
          "can_get_viewers" A..= can_get_viewers_,
          "can_get_message_thread" A..= can_get_message_thread_,
          "can_get_statistics" A..= can_get_statistics_,
          "can_get_added_reactions" A..= can_get_added_reactions_,
          "can_be_deleted_for_all_users" A..= can_be_deleted_for_all_users_,
          "can_be_deleted_only_for_self" A..= can_be_deleted_only_for_self_,
          "can_be_saved" A..= can_be_saved_,
          "can_be_forwarded" A..= can_be_forwarded_,
          "can_be_edited" A..= can_be_edited_,
          "is_pinned" A..= is_pinned_,
          "is_outgoing" A..= is_outgoing_,
          "scheduling_state" A..= scheduling_state_,
          "sending_state" A..= sending_state_,
          "chat_id" A..= chat_id_,
          "sender_id" A..= sender_id_,
          "id" A..= _id_
        ]
