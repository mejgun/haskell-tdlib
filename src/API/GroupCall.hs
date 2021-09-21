-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCall where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.GroupCallRecentSpeaker as GroupCallRecentSpeaker

-- |
-- 
-- Describes a group call
-- 
-- __id__ Group call identifier
-- 
-- __title__ Group call title
-- 
-- __scheduled_start_date__ Point in time (Unix timestamp) when the group call is supposed to be started by an administrator; 0 if it is already active or was ended
-- 
-- __enabled_start_notification__ True, if the group call is scheduled and the current user will receive a notification when the group call will start
-- 
-- __is_active__ True, if the call is active
-- 
-- __is_joined__ True, if the call is joined
-- 
-- __need_rejoin__ True, if user was kicked from the call because of network loss and the call needs to be rejoined
-- 
-- __can_be_managed__ True, if the current user can manage the group call
-- 
-- __participant_count__ Number of participants in the group call
-- 
-- __loaded_all_participants__ True, if all group call participants are loaded
-- 
-- __recent_speakers__ Recently speaking users in the group call
-- 
-- __is_my_video_enabled__ True, if the current user's video is enabled
-- 
-- __is_my_video_paused__ True, if the current user's video is paused
-- 
-- __can_enable_video__ True, if the current user can broadcast video or share screen
-- 
-- __mute_new_participants__ True, if only group call administrators can unmute new participants
-- 
-- __can_change_mute_new_participants__ True, if the current user can enable or disable mute_new_participants setting
-- 
-- __record_duration__ Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
-- 
-- __is_video_recorded__ True, if a video file is being recorded for the call
-- 
-- __duration__ Call duration, in seconds; for ended calls only
data GroupCall = 

 GroupCall { duration :: Maybe Int, is_video_recorded :: Maybe Bool, record_duration :: Maybe Int, can_change_mute_new_participants :: Maybe Bool, mute_new_participants :: Maybe Bool, can_enable_video :: Maybe Bool, is_my_video_paused :: Maybe Bool, is_my_video_enabled :: Maybe Bool, recent_speakers :: Maybe [GroupCallRecentSpeaker.GroupCallRecentSpeaker], loaded_all_participants :: Maybe Bool, participant_count :: Maybe Int, can_be_managed :: Maybe Bool, need_rejoin :: Maybe Bool, is_joined :: Maybe Bool, is_active :: Maybe Bool, enabled_start_notification :: Maybe Bool, scheduled_start_date :: Maybe Int, title :: Maybe String, _id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON GroupCall where
 toJSON (GroupCall { duration = duration, is_video_recorded = is_video_recorded, record_duration = record_duration, can_change_mute_new_participants = can_change_mute_new_participants, mute_new_participants = mute_new_participants, can_enable_video = can_enable_video, is_my_video_paused = is_my_video_paused, is_my_video_enabled = is_my_video_enabled, recent_speakers = recent_speakers, loaded_all_participants = loaded_all_participants, participant_count = participant_count, can_be_managed = can_be_managed, need_rejoin = need_rejoin, is_joined = is_joined, is_active = is_active, enabled_start_notification = enabled_start_notification, scheduled_start_date = scheduled_start_date, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "groupCall", "duration" A..= duration, "is_video_recorded" A..= is_video_recorded, "record_duration" A..= record_duration, "can_change_mute_new_participants" A..= can_change_mute_new_participants, "mute_new_participants" A..= mute_new_participants, "can_enable_video" A..= can_enable_video, "is_my_video_paused" A..= is_my_video_paused, "is_my_video_enabled" A..= is_my_video_enabled, "recent_speakers" A..= recent_speakers, "loaded_all_participants" A..= loaded_all_participants, "participant_count" A..= participant_count, "can_be_managed" A..= can_be_managed, "need_rejoin" A..= need_rejoin, "is_joined" A..= is_joined, "is_active" A..= is_active, "enabled_start_notification" A..= enabled_start_notification, "scheduled_start_date" A..= scheduled_start_date, "title" A..= title, "id" A..= _id ]

instance T.FromJSON GroupCall where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCall" -> parseGroupCall v
   _ -> mempty
  where
   parseGroupCall :: A.Value -> T.Parser GroupCall
   parseGroupCall = A.withObject "GroupCall" $ \o -> do
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    is_video_recorded <- o A..:? "is_video_recorded"
    record_duration <- mconcat [ o A..:? "record_duration", readMaybe <$> (o A..: "record_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    can_change_mute_new_participants <- o A..:? "can_change_mute_new_participants"
    mute_new_participants <- o A..:? "mute_new_participants"
    can_enable_video <- o A..:? "can_enable_video"
    is_my_video_paused <- o A..:? "is_my_video_paused"
    is_my_video_enabled <- o A..:? "is_my_video_enabled"
    recent_speakers <- o A..:? "recent_speakers"
    loaded_all_participants <- o A..:? "loaded_all_participants"
    participant_count <- mconcat [ o A..:? "participant_count", readMaybe <$> (o A..: "participant_count" :: T.Parser String)] :: T.Parser (Maybe Int)
    can_be_managed <- o A..:? "can_be_managed"
    need_rejoin <- o A..:? "need_rejoin"
    is_joined <- o A..:? "is_joined"
    is_active <- o A..:? "is_active"
    enabled_start_notification <- o A..:? "enabled_start_notification"
    scheduled_start_date <- mconcat [ o A..:? "scheduled_start_date", readMaybe <$> (o A..: "scheduled_start_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    title <- o A..:? "title"
    _id <- mconcat [ o A..:? "id", readMaybe <$> (o A..: "id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GroupCall { duration = duration, is_video_recorded = is_video_recorded, record_duration = record_duration, can_change_mute_new_participants = can_change_mute_new_participants, mute_new_participants = mute_new_participants, can_enable_video = can_enable_video, is_my_video_paused = is_my_video_paused, is_my_video_enabled = is_my_video_enabled, recent_speakers = recent_speakers, loaded_all_participants = loaded_all_participants, participant_count = participant_count, can_be_managed = can_be_managed, need_rejoin = need_rejoin, is_joined = is_joined, is_active = is_active, enabled_start_notification = enabled_start_notification, scheduled_start_date = scheduled_start_date, title = title, _id = _id }