{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.GroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.GroupCallRecentSpeaker as GroupCallRecentSpeaker
import qualified Utils as U

data GroupCall = -- | Describes a group call
  GroupCall
  { -- | Call duration, in seconds; for ended calls only
    duration :: Maybe Int,
    -- | True, if a video file is being recorded for the call
    is_video_recorded :: Maybe Bool,
    -- | Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
    record_duration :: Maybe Int,
    -- | True, if the current user can enable or disable mute_new_participants setting
    can_toggle_mute_new_participants :: Maybe Bool,
    -- | True, if only group call administrators can unmute new participants
    mute_new_participants :: Maybe Bool,
    -- | True, if the current user can broadcast video or share screen
    can_enable_video :: Maybe Bool,
    -- | True, if the current user's video is paused
    is_my_video_paused :: Maybe Bool,
    -- | True, if the current user's video is enabled
    is_my_video_enabled :: Maybe Bool,
    -- | At most 3 recently speaking users in the group call
    recent_speakers :: Maybe [GroupCallRecentSpeaker.GroupCallRecentSpeaker],
    -- | True, if all group call participants are loaded
    loaded_all_participants :: Maybe Bool,
    -- | True, if group call participants, which are muted, aren't returned in participant list
    has_hidden_listeners :: Maybe Bool,
    -- | Number of participants in the group call
    participant_count :: Maybe Int,
    -- | True, if the current user can manage the group call
    can_be_managed :: Maybe Bool,
    -- | True, if user was kicked from the call because of network loss and the call needs to be rejoined
    need_rejoin :: Maybe Bool,
    -- | True, if the call is joined
    is_joined :: Maybe Bool,
    -- | True, if the chat is an RTMP stream instead of an ordinary video chat
    is_rtmp_stream :: Maybe Bool,
    -- | True, if the call is active
    is_active :: Maybe Bool,
    -- | True, if the group call is scheduled and the current user will receive a notification when the group call will start
    enabled_start_notification :: Maybe Bool,
    -- | Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 if it is already active or was ended
    scheduled_start_date :: Maybe Int,
    -- | Group call title
    title :: Maybe String,
    -- | Group call identifier
    _id :: Maybe Int
  }
  deriving (Eq)

instance Show GroupCall where
  show
    GroupCall
      { duration = duration,
        is_video_recorded = is_video_recorded,
        record_duration = record_duration,
        can_toggle_mute_new_participants = can_toggle_mute_new_participants,
        mute_new_participants = mute_new_participants,
        can_enable_video = can_enable_video,
        is_my_video_paused = is_my_video_paused,
        is_my_video_enabled = is_my_video_enabled,
        recent_speakers = recent_speakers,
        loaded_all_participants = loaded_all_participants,
        has_hidden_listeners = has_hidden_listeners,
        participant_count = participant_count,
        can_be_managed = can_be_managed,
        need_rejoin = need_rejoin,
        is_joined = is_joined,
        is_rtmp_stream = is_rtmp_stream,
        is_active = is_active,
        enabled_start_notification = enabled_start_notification,
        scheduled_start_date = scheduled_start_date,
        title = title,
        _id = _id
      } =
      "GroupCall"
        ++ U.cc
          [ U.p "duration" duration,
            U.p "is_video_recorded" is_video_recorded,
            U.p "record_duration" record_duration,
            U.p "can_toggle_mute_new_participants" can_toggle_mute_new_participants,
            U.p "mute_new_participants" mute_new_participants,
            U.p "can_enable_video" can_enable_video,
            U.p "is_my_video_paused" is_my_video_paused,
            U.p "is_my_video_enabled" is_my_video_enabled,
            U.p "recent_speakers" recent_speakers,
            U.p "loaded_all_participants" loaded_all_participants,
            U.p "has_hidden_listeners" has_hidden_listeners,
            U.p "participant_count" participant_count,
            U.p "can_be_managed" can_be_managed,
            U.p "need_rejoin" need_rejoin,
            U.p "is_joined" is_joined,
            U.p "is_rtmp_stream" is_rtmp_stream,
            U.p "is_active" is_active,
            U.p "enabled_start_notification" enabled_start_notification,
            U.p "scheduled_start_date" scheduled_start_date,
            U.p "title" title,
            U.p "_id" _id
          ]

instance T.FromJSON GroupCall where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCall" -> parseGroupCall v
      _ -> fail ""
    where
      parseGroupCall :: A.Value -> T.Parser GroupCall
      parseGroupCall = A.withObject "GroupCall" $ \o -> do
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        is_video_recorded_ <- o A..:? "is_video_recorded"
        record_duration_ <- mconcat [o A..:? "record_duration", U.rm <$> (o A..: "record_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        can_toggle_mute_new_participants_ <- o A..:? "can_toggle_mute_new_participants"
        mute_new_participants_ <- o A..:? "mute_new_participants"
        can_enable_video_ <- o A..:? "can_enable_video"
        is_my_video_paused_ <- o A..:? "is_my_video_paused"
        is_my_video_enabled_ <- o A..:? "is_my_video_enabled"
        recent_speakers_ <- o A..:? "recent_speakers"
        loaded_all_participants_ <- o A..:? "loaded_all_participants"
        has_hidden_listeners_ <- o A..:? "has_hidden_listeners"
        participant_count_ <- mconcat [o A..:? "participant_count", U.rm <$> (o A..: "participant_count" :: T.Parser String)] :: T.Parser (Maybe Int)
        can_be_managed_ <- o A..:? "can_be_managed"
        need_rejoin_ <- o A..:? "need_rejoin"
        is_joined_ <- o A..:? "is_joined"
        is_rtmp_stream_ <- o A..:? "is_rtmp_stream"
        is_active_ <- o A..:? "is_active"
        enabled_start_notification_ <- o A..:? "enabled_start_notification"
        scheduled_start_date_ <- mconcat [o A..:? "scheduled_start_date", U.rm <$> (o A..: "scheduled_start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        title_ <- o A..:? "title"
        _id_ <- mconcat [o A..:? "id", U.rm <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ GroupCall {duration = duration_, is_video_recorded = is_video_recorded_, record_duration = record_duration_, can_toggle_mute_new_participants = can_toggle_mute_new_participants_, mute_new_participants = mute_new_participants_, can_enable_video = can_enable_video_, is_my_video_paused = is_my_video_paused_, is_my_video_enabled = is_my_video_enabled_, recent_speakers = recent_speakers_, loaded_all_participants = loaded_all_participants_, has_hidden_listeners = has_hidden_listeners_, participant_count = participant_count_, can_be_managed = can_be_managed_, need_rejoin = need_rejoin_, is_joined = is_joined_, is_rtmp_stream = is_rtmp_stream_, is_active = is_active_, enabled_start_notification = enabled_start_notification_, scheduled_start_date = scheduled_start_date_, title = title_, _id = _id_}
  parseJSON _ = fail ""

instance T.ToJSON GroupCall where
  toJSON
    GroupCall
      { duration = duration,
        is_video_recorded = is_video_recorded,
        record_duration = record_duration,
        can_toggle_mute_new_participants = can_toggle_mute_new_participants,
        mute_new_participants = mute_new_participants,
        can_enable_video = can_enable_video,
        is_my_video_paused = is_my_video_paused,
        is_my_video_enabled = is_my_video_enabled,
        recent_speakers = recent_speakers,
        loaded_all_participants = loaded_all_participants,
        has_hidden_listeners = has_hidden_listeners,
        participant_count = participant_count,
        can_be_managed = can_be_managed,
        need_rejoin = need_rejoin,
        is_joined = is_joined,
        is_rtmp_stream = is_rtmp_stream,
        is_active = is_active,
        enabled_start_notification = enabled_start_notification,
        scheduled_start_date = scheduled_start_date,
        title = title,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "groupCall",
          "duration" A..= duration,
          "is_video_recorded" A..= is_video_recorded,
          "record_duration" A..= record_duration,
          "can_toggle_mute_new_participants" A..= can_toggle_mute_new_participants,
          "mute_new_participants" A..= mute_new_participants,
          "can_enable_video" A..= can_enable_video,
          "is_my_video_paused" A..= is_my_video_paused,
          "is_my_video_enabled" A..= is_my_video_enabled,
          "recent_speakers" A..= recent_speakers,
          "loaded_all_participants" A..= loaded_all_participants,
          "has_hidden_listeners" A..= has_hidden_listeners,
          "participant_count" A..= participant_count,
          "can_be_managed" A..= can_be_managed,
          "need_rejoin" A..= need_rejoin,
          "is_joined" A..= is_joined,
          "is_rtmp_stream" A..= is_rtmp_stream,
          "is_active" A..= is_active,
          "enabled_start_notification" A..= enabled_start_notification,
          "scheduled_start_date" A..= scheduled_start_date,
          "title" A..= title,
          "id" A..= _id
        ]
