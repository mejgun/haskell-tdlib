module TD.Data.MessageProperties
  (MessageProperties(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data MessageProperties
  = MessageProperties -- ^ Contains properties of a message and describes actions that can be done with the message right now
    { can_be_copied_to_secret_chat   :: Maybe Bool -- ^ True, if content of the message can be copied to a secret chat using inputMessageForwarded or forwardMessages with copy options
    , can_be_deleted_only_for_self   :: Maybe Bool -- ^ True, if the message can be deleted only for the current user while other users will continue to see it using the method deleteMessages with revoke == false
    , can_be_deleted_for_all_users   :: Maybe Bool -- ^ True, if the message can be deleted for all users using the method deleteMessages with revoke == true
    , can_be_edited                  :: Maybe Bool -- ^ True, if the message can be edited using the methods editMessageText, editMessageCaption, or editMessageReplyMarkup. For live location and poll messages this fields shows whether editMessageLiveLocation or stopPoll can be used with this message
    , can_be_forwarded               :: Maybe Bool -- ^ True, if the message can be forwarded using inputMessageForwarded or forwardMessages
    , can_be_paid                    :: Maybe Bool -- ^ True, if the message can be paid using inputInvoiceMessage
    , can_be_pinned                  :: Maybe Bool -- ^ True, if the message can be pinned or unpinned in the chat using pinChatMessage or unpinChatMessage
    , can_be_replied                 :: Maybe Bool -- ^ True, if the message can be replied in the same chat and forum topic using inputMessageReplyToMessage
    , can_be_replied_in_another_chat :: Maybe Bool -- ^ True, if the message can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
    , can_be_saved                   :: Maybe Bool -- ^ True, if content of the message can be saved locally or copied using inputMessageForwarded or forwardMessages with copy options
    , can_be_shared_in_story         :: Maybe Bool -- ^ True, if the message can be shared in a story using inputStoryAreaTypeMessage
    , can_edit_media                 :: Maybe Bool -- ^ True, if the message can be edited using the method editMessageMedia
    , can_edit_scheduling_state      :: Maybe Bool -- ^ True, if scheduling state of the message can be edited
    , can_get_embedding_code         :: Maybe Bool -- ^ True, if code for message embedding can be received using getMessageEmbeddingCode
    , can_get_link                   :: Maybe Bool -- ^ True, if a link can be generated for the message using getMessageLink
    , can_get_media_timestamp_links  :: Maybe Bool -- ^ True, if media timestamp links can be generated for media timestamp entities in the message text, caption or link preview description using getMessageLink
    , can_get_message_thread         :: Maybe Bool -- ^ True, if information about the message thread is available through getMessageThread and getMessageThreadHistory
    , can_get_read_date              :: Maybe Bool -- ^ True, if read date of the message can be received through getMessageReadDate
    , can_get_statistics             :: Maybe Bool -- ^ True, if message statistics are available through getMessageStatistics and message forwards can be received using getMessagePublicForwards
    , can_get_viewers                :: Maybe Bool -- ^ True, if chat members already viewed the message can be received through getMessageViewers
    , can_recognize_speech           :: Maybe Bool -- ^ True, if speech can be recognized for the message through recognizeSpeech
    , can_report_chat                :: Maybe Bool -- ^ True, if the message can be reported using reportChat
    , can_report_reactions           :: Maybe Bool -- ^ True, if reactions on the message can be reported through reportMessageReactions
    , can_report_supergroup_spam     :: Maybe Bool -- ^ True, if the message can be reported using reportSupergroupSpam
    , can_set_fact_check             :: Maybe Bool -- ^ True, if fact check for the message can be changed through setMessageFactCheck
    , need_show_statistics           :: Maybe Bool -- ^ True, if message statistics must be available from context menu of the message
    }
  deriving (Eq, Show)

instance I.ShortShow MessageProperties where
  shortShow MessageProperties
    { can_be_copied_to_secret_chat   = can_be_copied_to_secret_chat_
    , can_be_deleted_only_for_self   = can_be_deleted_only_for_self_
    , can_be_deleted_for_all_users   = can_be_deleted_for_all_users_
    , can_be_edited                  = can_be_edited_
    , can_be_forwarded               = can_be_forwarded_
    , can_be_paid                    = can_be_paid_
    , can_be_pinned                  = can_be_pinned_
    , can_be_replied                 = can_be_replied_
    , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
    , can_be_saved                   = can_be_saved_
    , can_be_shared_in_story         = can_be_shared_in_story_
    , can_edit_media                 = can_edit_media_
    , can_edit_scheduling_state      = can_edit_scheduling_state_
    , can_get_embedding_code         = can_get_embedding_code_
    , can_get_link                   = can_get_link_
    , can_get_media_timestamp_links  = can_get_media_timestamp_links_
    , can_get_message_thread         = can_get_message_thread_
    , can_get_read_date              = can_get_read_date_
    , can_get_statistics             = can_get_statistics_
    , can_get_viewers                = can_get_viewers_
    , can_recognize_speech           = can_recognize_speech_
    , can_report_chat                = can_report_chat_
    , can_report_reactions           = can_report_reactions_
    , can_report_supergroup_spam     = can_report_supergroup_spam_
    , can_set_fact_check             = can_set_fact_check_
    , need_show_statistics           = need_show_statistics_
    }
      = "MessageProperties"
        ++ I.cc
        [ "can_be_copied_to_secret_chat"   `I.p` can_be_copied_to_secret_chat_
        , "can_be_deleted_only_for_self"   `I.p` can_be_deleted_only_for_self_
        , "can_be_deleted_for_all_users"   `I.p` can_be_deleted_for_all_users_
        , "can_be_edited"                  `I.p` can_be_edited_
        , "can_be_forwarded"               `I.p` can_be_forwarded_
        , "can_be_paid"                    `I.p` can_be_paid_
        , "can_be_pinned"                  `I.p` can_be_pinned_
        , "can_be_replied"                 `I.p` can_be_replied_
        , "can_be_replied_in_another_chat" `I.p` can_be_replied_in_another_chat_
        , "can_be_saved"                   `I.p` can_be_saved_
        , "can_be_shared_in_story"         `I.p` can_be_shared_in_story_
        , "can_edit_media"                 `I.p` can_edit_media_
        , "can_edit_scheduling_state"      `I.p` can_edit_scheduling_state_
        , "can_get_embedding_code"         `I.p` can_get_embedding_code_
        , "can_get_link"                   `I.p` can_get_link_
        , "can_get_media_timestamp_links"  `I.p` can_get_media_timestamp_links_
        , "can_get_message_thread"         `I.p` can_get_message_thread_
        , "can_get_read_date"              `I.p` can_get_read_date_
        , "can_get_statistics"             `I.p` can_get_statistics_
        , "can_get_viewers"                `I.p` can_get_viewers_
        , "can_recognize_speech"           `I.p` can_recognize_speech_
        , "can_report_chat"                `I.p` can_report_chat_
        , "can_report_reactions"           `I.p` can_report_reactions_
        , "can_report_supergroup_spam"     `I.p` can_report_supergroup_spam_
        , "can_set_fact_check"             `I.p` can_set_fact_check_
        , "need_show_statistics"           `I.p` need_show_statistics_
        ]

instance AT.FromJSON MessageProperties where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "messageProperties" -> parseMessageProperties v
      _                   -> mempty
    
    where
      parseMessageProperties :: A.Value -> AT.Parser MessageProperties
      parseMessageProperties = A.withObject "MessageProperties" $ \o -> do
        can_be_copied_to_secret_chat_   <- o A..:?  "can_be_copied_to_secret_chat"
        can_be_deleted_only_for_self_   <- o A..:?  "can_be_deleted_only_for_self"
        can_be_deleted_for_all_users_   <- o A..:?  "can_be_deleted_for_all_users"
        can_be_edited_                  <- o A..:?  "can_be_edited"
        can_be_forwarded_               <- o A..:?  "can_be_forwarded"
        can_be_paid_                    <- o A..:?  "can_be_paid"
        can_be_pinned_                  <- o A..:?  "can_be_pinned"
        can_be_replied_                 <- o A..:?  "can_be_replied"
        can_be_replied_in_another_chat_ <- o A..:?  "can_be_replied_in_another_chat"
        can_be_saved_                   <- o A..:?  "can_be_saved"
        can_be_shared_in_story_         <- o A..:?  "can_be_shared_in_story"
        can_edit_media_                 <- o A..:?  "can_edit_media"
        can_edit_scheduling_state_      <- o A..:?  "can_edit_scheduling_state"
        can_get_embedding_code_         <- o A..:?  "can_get_embedding_code"
        can_get_link_                   <- o A..:?  "can_get_link"
        can_get_media_timestamp_links_  <- o A..:?  "can_get_media_timestamp_links"
        can_get_message_thread_         <- o A..:?  "can_get_message_thread"
        can_get_read_date_              <- o A..:?  "can_get_read_date"
        can_get_statistics_             <- o A..:?  "can_get_statistics"
        can_get_viewers_                <- o A..:?  "can_get_viewers"
        can_recognize_speech_           <- o A..:?  "can_recognize_speech"
        can_report_chat_                <- o A..:?  "can_report_chat"
        can_report_reactions_           <- o A..:?  "can_report_reactions"
        can_report_supergroup_spam_     <- o A..:?  "can_report_supergroup_spam"
        can_set_fact_check_             <- o A..:?  "can_set_fact_check"
        need_show_statistics_           <- o A..:?  "need_show_statistics"
        pure $ MessageProperties
          { can_be_copied_to_secret_chat   = can_be_copied_to_secret_chat_
          , can_be_deleted_only_for_self   = can_be_deleted_only_for_self_
          , can_be_deleted_for_all_users   = can_be_deleted_for_all_users_
          , can_be_edited                  = can_be_edited_
          , can_be_forwarded               = can_be_forwarded_
          , can_be_paid                    = can_be_paid_
          , can_be_pinned                  = can_be_pinned_
          , can_be_replied                 = can_be_replied_
          , can_be_replied_in_another_chat = can_be_replied_in_another_chat_
          , can_be_saved                   = can_be_saved_
          , can_be_shared_in_story         = can_be_shared_in_story_
          , can_edit_media                 = can_edit_media_
          , can_edit_scheduling_state      = can_edit_scheduling_state_
          , can_get_embedding_code         = can_get_embedding_code_
          , can_get_link                   = can_get_link_
          , can_get_media_timestamp_links  = can_get_media_timestamp_links_
          , can_get_message_thread         = can_get_message_thread_
          , can_get_read_date              = can_get_read_date_
          , can_get_statistics             = can_get_statistics_
          , can_get_viewers                = can_get_viewers_
          , can_recognize_speech           = can_recognize_speech_
          , can_report_chat                = can_report_chat_
          , can_report_reactions           = can_report_reactions_
          , can_report_supergroup_spam     = can_report_supergroup_spam_
          , can_set_fact_check             = can_set_fact_check_
          , need_show_statistics           = need_show_statistics_
          }
  parseJSON _ = mempty

