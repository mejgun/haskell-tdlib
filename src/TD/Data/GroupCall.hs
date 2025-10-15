module TD.Data.GroupCall
  (GroupCall(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.GroupCallRecentSpeaker as GroupCallRecentSpeaker

data GroupCall
  = GroupCall -- ^ Describes a group call
    { _id                              :: Maybe Int                                             -- ^ Group call identifier
    , title                            :: Maybe T.Text                                          -- ^ Group call title; for video chats only
    , invite_link                      :: Maybe T.Text                                          -- ^ Invite link for the group call; for group calls that aren't bound to a chat. For video chats call getVideoChatInviteLink to get the link
    , scheduled_start_date             :: Maybe Int                                             -- ^ Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 if it is already active or was ended; for video chats only
    , enabled_start_notification       :: Maybe Bool                                            -- ^ True, if the group call is scheduled and the current user will receive a notification when the group call starts; for video chats only
    , is_active                        :: Maybe Bool                                            -- ^ True, if the call is active
    , is_video_chat                    :: Maybe Bool                                            -- ^ True, if the call is bound to a chat
    , is_rtmp_stream                   :: Maybe Bool                                            -- ^ True, if the call is an RTMP stream instead of an ordinary video chat; for video chats only
    , is_joined                        :: Maybe Bool                                            -- ^ True, if the call is joined
    , need_rejoin                      :: Maybe Bool                                            -- ^ True, if user was kicked from the call because of network loss and the call needs to be rejoined
    , is_owned                         :: Maybe Bool                                            -- ^ True, if the user is the owner of the call and can end the call, change volume level of other users, or ban users there; for group calls that aren't bound to a chat
    , can_be_managed                   :: Maybe Bool                                            -- ^ True, if the current user can manage the group call; for video chats only
    , participant_count                :: Maybe Int                                             -- ^ Number of participants in the group call
    , has_hidden_listeners             :: Maybe Bool                                            -- ^ True, if group call participants, which are muted, aren't returned in participant list; for video chats only
    , loaded_all_participants          :: Maybe Bool                                            -- ^ True, if all group call participants are loaded
    , recent_speakers                  :: Maybe [GroupCallRecentSpeaker.GroupCallRecentSpeaker] -- ^ At most 3 recently speaking users in the group call
    , is_my_video_enabled              :: Maybe Bool                                            -- ^ True, if the current user's video is enabled
    , is_my_video_paused               :: Maybe Bool                                            -- ^ True, if the current user's video is paused
    , can_enable_video                 :: Maybe Bool                                            -- ^ True, if the current user can broadcast video or share screen
    , mute_new_participants            :: Maybe Bool                                            -- ^ True, if only group call administrators can unmute new participants; for video chats only
    , can_toggle_mute_new_participants :: Maybe Bool                                            -- ^ True, if the current user can enable or disable mute_new_participants setting; for video chats only
    , can_send_messages                :: Maybe Bool                                            -- ^ True, if users can send messages to the group call
    , can_toggle_can_send_messages     :: Maybe Bool                                            -- ^ True, if the current user can enable or disable sending messages in the group call
    , record_duration                  :: Maybe Int                                             -- ^ Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
    , is_video_recorded                :: Maybe Bool                                            -- ^ True, if a video file is being recorded for the call
    , duration                         :: Maybe Int                                             -- ^ Call duration, in seconds; for ended calls only
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCall where
  shortShow GroupCall
    { _id                              = _id_
    , title                            = title_
    , invite_link                      = invite_link_
    , scheduled_start_date             = scheduled_start_date_
    , enabled_start_notification       = enabled_start_notification_
    , is_active                        = is_active_
    , is_video_chat                    = is_video_chat_
    , is_rtmp_stream                   = is_rtmp_stream_
    , is_joined                        = is_joined_
    , need_rejoin                      = need_rejoin_
    , is_owned                         = is_owned_
    , can_be_managed                   = can_be_managed_
    , participant_count                = participant_count_
    , has_hidden_listeners             = has_hidden_listeners_
    , loaded_all_participants          = loaded_all_participants_
    , recent_speakers                  = recent_speakers_
    , is_my_video_enabled              = is_my_video_enabled_
    , is_my_video_paused               = is_my_video_paused_
    , can_enable_video                 = can_enable_video_
    , mute_new_participants            = mute_new_participants_
    , can_toggle_mute_new_participants = can_toggle_mute_new_participants_
    , can_send_messages                = can_send_messages_
    , can_toggle_can_send_messages     = can_toggle_can_send_messages_
    , record_duration                  = record_duration_
    , is_video_recorded                = is_video_recorded_
    , duration                         = duration_
    }
      = "GroupCall"
        ++ I.cc
        [ "_id"                              `I.p` _id_
        , "title"                            `I.p` title_
        , "invite_link"                      `I.p` invite_link_
        , "scheduled_start_date"             `I.p` scheduled_start_date_
        , "enabled_start_notification"       `I.p` enabled_start_notification_
        , "is_active"                        `I.p` is_active_
        , "is_video_chat"                    `I.p` is_video_chat_
        , "is_rtmp_stream"                   `I.p` is_rtmp_stream_
        , "is_joined"                        `I.p` is_joined_
        , "need_rejoin"                      `I.p` need_rejoin_
        , "is_owned"                         `I.p` is_owned_
        , "can_be_managed"                   `I.p` can_be_managed_
        , "participant_count"                `I.p` participant_count_
        , "has_hidden_listeners"             `I.p` has_hidden_listeners_
        , "loaded_all_participants"          `I.p` loaded_all_participants_
        , "recent_speakers"                  `I.p` recent_speakers_
        , "is_my_video_enabled"              `I.p` is_my_video_enabled_
        , "is_my_video_paused"               `I.p` is_my_video_paused_
        , "can_enable_video"                 `I.p` can_enable_video_
        , "mute_new_participants"            `I.p` mute_new_participants_
        , "can_toggle_mute_new_participants" `I.p` can_toggle_mute_new_participants_
        , "can_send_messages"                `I.p` can_send_messages_
        , "can_toggle_can_send_messages"     `I.p` can_toggle_can_send_messages_
        , "record_duration"                  `I.p` record_duration_
        , "is_video_recorded"                `I.p` is_video_recorded_
        , "duration"                         `I.p` duration_
        ]

instance AT.FromJSON GroupCall where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCall" -> parseGroupCall v
      _           -> mempty
    
    where
      parseGroupCall :: A.Value -> AT.Parser GroupCall
      parseGroupCall = A.withObject "GroupCall" $ \o -> do
        _id_                              <- o A..:?  "id"
        title_                            <- o A..:?  "title"
        invite_link_                      <- o A..:?  "invite_link"
        scheduled_start_date_             <- o A..:?  "scheduled_start_date"
        enabled_start_notification_       <- o A..:?  "enabled_start_notification"
        is_active_                        <- o A..:?  "is_active"
        is_video_chat_                    <- o A..:?  "is_video_chat"
        is_rtmp_stream_                   <- o A..:?  "is_rtmp_stream"
        is_joined_                        <- o A..:?  "is_joined"
        need_rejoin_                      <- o A..:?  "need_rejoin"
        is_owned_                         <- o A..:?  "is_owned"
        can_be_managed_                   <- o A..:?  "can_be_managed"
        participant_count_                <- o A..:?  "participant_count"
        has_hidden_listeners_             <- o A..:?  "has_hidden_listeners"
        loaded_all_participants_          <- o A..:?  "loaded_all_participants"
        recent_speakers_                  <- o A..:?  "recent_speakers"
        is_my_video_enabled_              <- o A..:?  "is_my_video_enabled"
        is_my_video_paused_               <- o A..:?  "is_my_video_paused"
        can_enable_video_                 <- o A..:?  "can_enable_video"
        mute_new_participants_            <- o A..:?  "mute_new_participants"
        can_toggle_mute_new_participants_ <- o A..:?  "can_toggle_mute_new_participants"
        can_send_messages_                <- o A..:?  "can_send_messages"
        can_toggle_can_send_messages_     <- o A..:?  "can_toggle_can_send_messages"
        record_duration_                  <- o A..:?  "record_duration"
        is_video_recorded_                <- o A..:?  "is_video_recorded"
        duration_                         <- o A..:?  "duration"
        pure $ GroupCall
          { _id                              = _id_
          , title                            = title_
          , invite_link                      = invite_link_
          , scheduled_start_date             = scheduled_start_date_
          , enabled_start_notification       = enabled_start_notification_
          , is_active                        = is_active_
          , is_video_chat                    = is_video_chat_
          , is_rtmp_stream                   = is_rtmp_stream_
          , is_joined                        = is_joined_
          , need_rejoin                      = need_rejoin_
          , is_owned                         = is_owned_
          , can_be_managed                   = can_be_managed_
          , participant_count                = participant_count_
          , has_hidden_listeners             = has_hidden_listeners_
          , loaded_all_participants          = loaded_all_participants_
          , recent_speakers                  = recent_speakers_
          , is_my_video_enabled              = is_my_video_enabled_
          , is_my_video_paused               = is_my_video_paused_
          , can_enable_video                 = can_enable_video_
          , mute_new_participants            = mute_new_participants_
          , can_toggle_mute_new_participants = can_toggle_mute_new_participants_
          , can_send_messages                = can_send_messages_
          , can_toggle_can_send_messages     = can_toggle_can_send_messages_
          , record_duration                  = record_duration_
          , is_video_recorded                = is_video_recorded_
          , duration                         = duration_
          }
  parseJSON _ = mempty

