module TD.Data.Message
  (Message(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.MessageSendingState as MessageSendingState
import qualified TD.Data.MessageSchedulingState as MessageSchedulingState
import qualified TD.Data.MessageForwardInfo as MessageForwardInfo
import qualified TD.Data.MessageImportInfo as MessageImportInfo
import qualified TD.Data.MessageInteractionInfo as MessageInteractionInfo
import qualified TD.Data.UnreadReaction as UnreadReaction
import qualified TD.Data.MessageReplyTo as MessageReplyTo
import qualified TD.Data.MessageSelfDestructType as MessageSelfDestructType
import qualified Data.Text as T
import qualified TD.Data.MessageContent as MessageContent
import qualified TD.Data.ReplyMarkup as ReplyMarkup

data Message
  = Message -- ^ Describes a message
    { _id                            :: Maybe Int                                             -- ^ Message identifier; unique for the chat to which the message belongs
    , sender_id                      :: Maybe MessageSender.MessageSender                     -- ^ Identifier of the sender of the message
    , chat_id                        :: Maybe Int                                             -- ^ Chat identifier
    , sending_state                  :: Maybe MessageSendingState.MessageSendingState         -- ^ The sending state of the message; may be null if the message isn't being sent and didn't fail to be sent
    , scheduling_state               :: Maybe MessageSchedulingState.MessageSchedulingState   -- ^ The scheduling state of the message; may be null if the message isn't scheduled
    , is_outgoing                    :: Maybe Bool                                            -- ^ True, if the message is outgoing
    , is_pinned                      :: Maybe Bool                                            -- ^ True, if the message is pinned
    , can_be_edited                  :: Maybe Bool                                            -- ^ True, if the message can be edited. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message by the application
    , can_be_forwarded               :: Maybe Bool                                            -- ^ True, if the message can be forwarded
    , can_be_replied_in_another_chat :: Maybe Bool                                            -- ^ True, if the message can be replied in another chat
    , can_be_saved                   :: Maybe Bool                                            -- ^ True, if content of the message can be saved locally or copied
    , can_be_deleted_only_for_self   :: Maybe Bool                                            -- ^ True, if the message can be deleted only for the current user while other users will continue to see it
    , can_be_deleted_for_all_users   :: Maybe Bool                                            -- ^ True, if the message can be deleted for all users
    , can_get_added_reactions        :: Maybe Bool                                            -- ^ True, if the list of added reactions is available through getMessageAddedReactions
    , can_get_statistics             :: Maybe Bool                                            -- ^ True, if the message statistics are available through getMessageStatistics
    , can_get_message_thread         :: Maybe Bool                                            -- ^ True, if information about the message thread is available through getMessageThread and getMessageThreadHistory
    , can_get_viewers                :: Maybe Bool                                            -- ^ True, if chat members already viewed the message can be received through getMessageViewers
    , can_get_media_timestamp_links  :: Maybe Bool                                            -- ^ True, if media timestamp links can be generated for media timestamp entities in the message text, caption or web page description through getMessageLink
    , can_report_reactions           :: Maybe Bool                                            -- ^ True, if reactions on the message can be reported through reportMessageReactions
    , has_timestamped_media          :: Maybe Bool                                            -- ^ True, if media timestamp entities refers to a media in this message as opposed to a media in the replied message
    , is_channel_post                :: Maybe Bool                                            -- ^ True, if the message is a channel post. All messages to channels are channel posts, all other messages are not channel posts
    , is_topic_message               :: Maybe Bool                                            -- ^ True, if the message is a forum topic message
    , contains_unread_mention        :: Maybe Bool                                            -- ^ True, if the message contains an unread mention for the current user
    , date                           :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the message was sent
    , edit_date                      :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the message was last edited
    , forward_info                   :: Maybe MessageForwardInfo.MessageForwardInfo           -- ^ Information about the initial message sender; may be null if none or unknown
    , import_info                    :: Maybe MessageImportInfo.MessageImportInfo             -- ^ Information about the initial message for messages created with importMessages; may be null if the message isn't imported
    , interaction_info               :: Maybe MessageInteractionInfo.MessageInteractionInfo   -- ^ Information about interactions with the message; may be null if none
    , unread_reactions               :: Maybe [UnreadReaction.UnreadReaction]                 -- ^ Information about unread reactions added to the message
    , reply_to                       :: Maybe MessageReplyTo.MessageReplyTo                   -- ^ Information about the message or the story this message is replying to; may be null if none
    , message_thread_id              :: Maybe Int                                             -- ^ If non-zero, the identifier of the message thread the message belongs to; unique within the chat to which the message belongs
    , self_destruct_type             :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ The message's self-destruct type; may be null if none
    , self_destruct_in               :: Maybe Double                                          -- ^ Time left before the message self-destruct timer expires, in seconds; 0 if self-destruction isn't scheduled yet
    , auto_delete_in                 :: Maybe Double                                          -- ^ Time left before the message will be automatically deleted by message_auto_delete_time setting of the chat, in seconds; 0 if never
    , via_bot_user_id                :: Maybe Int                                             -- ^ If non-zero, the user identifier of the bot through which this message was sent
    , author_signature               :: Maybe T.Text                                          -- ^ For channel posts and anonymous group messages, optional author signature
    , media_album_id                 :: Maybe Int                                             -- ^ Unique identifier of an album this message belongs to. Only audios, documents, photos and videos can be grouped together in albums
    , restriction_reason             :: Maybe T.Text                                          -- ^ If non-empty, contains a human-readable description of the reason why access to this message must be restricted
    , content                        :: Maybe MessageContent.MessageContent                   -- ^ Content of the message
    , reply_markup                   :: Maybe ReplyMarkup.ReplyMarkup                         -- ^ Reply markup for the message; may be null if none
    }
  deriving (Eq, Show)

instance I.ShortShow Message where
  shortShow Message
    { _id                            = _id_
    , sender_id                      = sender_id_
    , chat_id                        = chat_id_
    , sending_state                  = sending_state_
    , scheduling_state               = scheduling_state_
    , is_outgoing                    = is_outgoing_
    , is_pinned                      = is_pinned_
    , can_be_edited                  = can_be_edited_
    , can_be_forwarded               = can_be_forwarded_
    , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
    , can_be_saved                   = can_be_saved_
    , can_be_deleted_only_for_self   = can_be_deleted_only_for_self_
    , can_be_deleted_for_all_users   = can_be_deleted_for_all_users_
    , can_get_added_reactions        = can_get_added_reactions_
    , can_get_statistics             = can_get_statistics_
    , can_get_message_thread         = can_get_message_thread_
    , can_get_viewers                = can_get_viewers_
    , can_get_media_timestamp_links  = can_get_media_timestamp_links_
    , can_report_reactions           = can_report_reactions_
    , has_timestamped_media          = has_timestamped_media_
    , is_channel_post                = is_channel_post_
    , is_topic_message               = is_topic_message_
    , contains_unread_mention        = contains_unread_mention_
    , date                           = date_
    , edit_date                      = edit_date_
    , forward_info                   = forward_info_
    , import_info                    = import_info_
    , interaction_info               = interaction_info_
    , unread_reactions               = unread_reactions_
    , reply_to                       = reply_to_
    , message_thread_id              = message_thread_id_
    , self_destruct_type             = self_destruct_type_
    , self_destruct_in               = self_destruct_in_
    , auto_delete_in                 = auto_delete_in_
    , via_bot_user_id                = via_bot_user_id_
    , author_signature               = author_signature_
    , media_album_id                 = media_album_id_
    , restriction_reason             = restriction_reason_
    , content                        = content_
    , reply_markup                   = reply_markup_
    }
      = "Message"
        ++ I.cc
        [ "_id"                            `I.p` _id_
        , "sender_id"                      `I.p` sender_id_
        , "chat_id"                        `I.p` chat_id_
        , "sending_state"                  `I.p` sending_state_
        , "scheduling_state"               `I.p` scheduling_state_
        , "is_outgoing"                    `I.p` is_outgoing_
        , "is_pinned"                      `I.p` is_pinned_
        , "can_be_edited"                  `I.p` can_be_edited_
        , "can_be_forwarded"               `I.p` can_be_forwarded_
        , "can_be_replied_in_another_chat" `I.p` can_be_replied_in_another_chat_
        , "can_be_saved"                   `I.p` can_be_saved_
        , "can_be_deleted_only_for_self"   `I.p` can_be_deleted_only_for_self_
        , "can_be_deleted_for_all_users"   `I.p` can_be_deleted_for_all_users_
        , "can_get_added_reactions"        `I.p` can_get_added_reactions_
        , "can_get_statistics"             `I.p` can_get_statistics_
        , "can_get_message_thread"         `I.p` can_get_message_thread_
        , "can_get_viewers"                `I.p` can_get_viewers_
        , "can_get_media_timestamp_links"  `I.p` can_get_media_timestamp_links_
        , "can_report_reactions"           `I.p` can_report_reactions_
        , "has_timestamped_media"          `I.p` has_timestamped_media_
        , "is_channel_post"                `I.p` is_channel_post_
        , "is_topic_message"               `I.p` is_topic_message_
        , "contains_unread_mention"        `I.p` contains_unread_mention_
        , "date"                           `I.p` date_
        , "edit_date"                      `I.p` edit_date_
        , "forward_info"                   `I.p` forward_info_
        , "import_info"                    `I.p` import_info_
        , "interaction_info"               `I.p` interaction_info_
        , "unread_reactions"               `I.p` unread_reactions_
        , "reply_to"                       `I.p` reply_to_
        , "message_thread_id"              `I.p` message_thread_id_
        , "self_destruct_type"             `I.p` self_destruct_type_
        , "self_destruct_in"               `I.p` self_destruct_in_
        , "auto_delete_in"                 `I.p` auto_delete_in_
        , "via_bot_user_id"                `I.p` via_bot_user_id_
        , "author_signature"               `I.p` author_signature_
        , "media_album_id"                 `I.p` media_album_id_
        , "restriction_reason"             `I.p` restriction_reason_
        , "content"                        `I.p` content_
        , "reply_markup"                   `I.p` reply_markup_
        ]

instance AT.FromJSON Message where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "message" -> parseMessage v
      _         -> mempty
    
    where
      parseMessage :: A.Value -> AT.Parser Message
      parseMessage = A.withObject "Message" $ \o -> do
        _id_                            <- o A..:?                       "id"
        sender_id_                      <- o A..:?                       "sender_id"
        chat_id_                        <- o A..:?                       "chat_id"
        sending_state_                  <- o A..:?                       "sending_state"
        scheduling_state_               <- o A..:?                       "scheduling_state"
        is_outgoing_                    <- o A..:?                       "is_outgoing"
        is_pinned_                      <- o A..:?                       "is_pinned"
        can_be_edited_                  <- o A..:?                       "can_be_edited"
        can_be_forwarded_               <- o A..:?                       "can_be_forwarded"
        can_be_replied_in_another_chat_ <- o A..:?                       "can_be_replied_in_another_chat"
        can_be_saved_                   <- o A..:?                       "can_be_saved"
        can_be_deleted_only_for_self_   <- o A..:?                       "can_be_deleted_only_for_self"
        can_be_deleted_for_all_users_   <- o A..:?                       "can_be_deleted_for_all_users"
        can_get_added_reactions_        <- o A..:?                       "can_get_added_reactions"
        can_get_statistics_             <- o A..:?                       "can_get_statistics"
        can_get_message_thread_         <- o A..:?                       "can_get_message_thread"
        can_get_viewers_                <- o A..:?                       "can_get_viewers"
        can_get_media_timestamp_links_  <- o A..:?                       "can_get_media_timestamp_links"
        can_report_reactions_           <- o A..:?                       "can_report_reactions"
        has_timestamped_media_          <- o A..:?                       "has_timestamped_media"
        is_channel_post_                <- o A..:?                       "is_channel_post"
        is_topic_message_               <- o A..:?                       "is_topic_message"
        contains_unread_mention_        <- o A..:?                       "contains_unread_mention"
        date_                           <- o A..:?                       "date"
        edit_date_                      <- o A..:?                       "edit_date"
        forward_info_                   <- o A..:?                       "forward_info"
        import_info_                    <- o A..:?                       "import_info"
        interaction_info_               <- o A..:?                       "interaction_info"
        unread_reactions_               <- o A..:?                       "unread_reactions"
        reply_to_                       <- o A..:?                       "reply_to"
        message_thread_id_              <- o A..:?                       "message_thread_id"
        self_destruct_type_             <- o A..:?                       "self_destruct_type"
        self_destruct_in_               <- o A..:?                       "self_destruct_in"
        auto_delete_in_                 <- o A..:?                       "auto_delete_in"
        via_bot_user_id_                <- o A..:?                       "via_bot_user_id"
        author_signature_               <- o A..:?                       "author_signature"
        media_album_id_                 <- fmap I.readInt64 <$> o A..:?  "media_album_id"
        restriction_reason_             <- o A..:?                       "restriction_reason"
        content_                        <- o A..:?                       "content"
        reply_markup_                   <- o A..:?                       "reply_markup"
        pure $ Message
          { _id                            = _id_
          , sender_id                      = sender_id_
          , chat_id                        = chat_id_
          , sending_state                  = sending_state_
          , scheduling_state               = scheduling_state_
          , is_outgoing                    = is_outgoing_
          , is_pinned                      = is_pinned_
          , can_be_edited                  = can_be_edited_
          , can_be_forwarded               = can_be_forwarded_
          , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
          , can_be_saved                   = can_be_saved_
          , can_be_deleted_only_for_self   = can_be_deleted_only_for_self_
          , can_be_deleted_for_all_users   = can_be_deleted_for_all_users_
          , can_get_added_reactions        = can_get_added_reactions_
          , can_get_statistics             = can_get_statistics_
          , can_get_message_thread         = can_get_message_thread_
          , can_get_viewers                = can_get_viewers_
          , can_get_media_timestamp_links  = can_get_media_timestamp_links_
          , can_report_reactions           = can_report_reactions_
          , has_timestamped_media          = has_timestamped_media_
          , is_channel_post                = is_channel_post_
          , is_topic_message               = is_topic_message_
          , contains_unread_mention        = contains_unread_mention_
          , date                           = date_
          , edit_date                      = edit_date_
          , forward_info                   = forward_info_
          , import_info                    = import_info_
          , interaction_info               = interaction_info_
          , unread_reactions               = unread_reactions_
          , reply_to                       = reply_to_
          , message_thread_id              = message_thread_id_
          , self_destruct_type             = self_destruct_type_
          , self_destruct_in               = self_destruct_in_
          , auto_delete_in                 = auto_delete_in_
          , via_bot_user_id                = via_bot_user_id_
          , author_signature               = author_signature_
          , media_album_id                 = media_album_id_
          , restriction_reason             = restriction_reason_
          , content                        = content_
          , reply_markup                   = reply_markup_
          }
  parseJSON _ = mempty

