-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.GroupCallParticipant where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.GroupCallParticipantVideoInfo as GroupCallParticipantVideoInfo
import {-# SOURCE #-} qualified API.MessageSender as MessageSender

-- |
-- 
-- Represents a group call participant
-- 
-- __participant_id__ Identifier of the group call participant
-- 
-- __audio_source_id__ User's audio channel synchronization source identifier
-- 
-- __screen_sharing_audio_source_id__ User's screen sharing audio channel synchronization source identifier
-- 
-- __video_info__ Information about user's video channel; may be null if there is no active video
-- 
-- __screen_sharing_video_info__ Information about user's screen sharing video channel; may be null if there is no active screen sharing video
-- 
-- __bio__ The participant user's bio or the participant chat's description
-- 
-- __is_current_user__ True, if the participant is the current user
-- 
-- __is_speaking__ True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
-- 
-- __is_hand_raised__ True, if the participant hand is raised
-- 
-- __can_be_muted_for_all_users__ True, if the current user can mute the participant for all other group call participants
-- 
-- __can_be_unmuted_for_all_users__ True, if the current user can allow the participant to unmute themselves or unmute the participant (if the participant is the current user)
-- 
-- __can_be_muted_for_current_user__ True, if the current user can mute the participant only for self
-- 
-- __can_be_unmuted_for_current_user__ True, if the current user can unmute the participant for self
-- 
-- __is_muted_for_all_users__ True, if the participant is muted for all users
-- 
-- __is_muted_for_current_user__ True, if the participant is muted for the current user
-- 
-- __can_unmute_self__ True, if the participant is muted for all users, but can unmute themselves
-- 
-- __volume_level__ Participant's volume level; 1-20000 in hundreds of percents
-- 
-- __order__ User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
data GroupCallParticipant = 

 GroupCallParticipant { order :: Maybe String, volume_level :: Maybe Int, can_unmute_self :: Maybe Bool, is_muted_for_current_user :: Maybe Bool, is_muted_for_all_users :: Maybe Bool, can_be_unmuted_for_current_user :: Maybe Bool, can_be_muted_for_current_user :: Maybe Bool, can_be_unmuted_for_all_users :: Maybe Bool, can_be_muted_for_all_users :: Maybe Bool, is_hand_raised :: Maybe Bool, is_speaking :: Maybe Bool, is_current_user :: Maybe Bool, bio :: Maybe String, screen_sharing_video_info :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo, video_info :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo, screen_sharing_audio_source_id :: Maybe Int, audio_source_id :: Maybe Int, participant_id :: Maybe MessageSender.MessageSender }  deriving (Eq)

instance Show GroupCallParticipant where
 show GroupCallParticipant { order=order, volume_level=volume_level, can_unmute_self=can_unmute_self, is_muted_for_current_user=is_muted_for_current_user, is_muted_for_all_users=is_muted_for_all_users, can_be_unmuted_for_current_user=can_be_unmuted_for_current_user, can_be_muted_for_current_user=can_be_muted_for_current_user, can_be_unmuted_for_all_users=can_be_unmuted_for_all_users, can_be_muted_for_all_users=can_be_muted_for_all_users, is_hand_raised=is_hand_raised, is_speaking=is_speaking, is_current_user=is_current_user, bio=bio, screen_sharing_video_info=screen_sharing_video_info, video_info=video_info, screen_sharing_audio_source_id=screen_sharing_audio_source_id, audio_source_id=audio_source_id, participant_id=participant_id } =
  "GroupCallParticipant" ++ U.cc [U.p "order" order, U.p "volume_level" volume_level, U.p "can_unmute_self" can_unmute_self, U.p "is_muted_for_current_user" is_muted_for_current_user, U.p "is_muted_for_all_users" is_muted_for_all_users, U.p "can_be_unmuted_for_current_user" can_be_unmuted_for_current_user, U.p "can_be_muted_for_current_user" can_be_muted_for_current_user, U.p "can_be_unmuted_for_all_users" can_be_unmuted_for_all_users, U.p "can_be_muted_for_all_users" can_be_muted_for_all_users, U.p "is_hand_raised" is_hand_raised, U.p "is_speaking" is_speaking, U.p "is_current_user" is_current_user, U.p "bio" bio, U.p "screen_sharing_video_info" screen_sharing_video_info, U.p "video_info" video_info, U.p "screen_sharing_audio_source_id" screen_sharing_audio_source_id, U.p "audio_source_id" audio_source_id, U.p "participant_id" participant_id ]

instance T.ToJSON GroupCallParticipant where
 toJSON GroupCallParticipant { order = order, volume_level = volume_level, can_unmute_self = can_unmute_self, is_muted_for_current_user = is_muted_for_current_user, is_muted_for_all_users = is_muted_for_all_users, can_be_unmuted_for_current_user = can_be_unmuted_for_current_user, can_be_muted_for_current_user = can_be_muted_for_current_user, can_be_unmuted_for_all_users = can_be_unmuted_for_all_users, can_be_muted_for_all_users = can_be_muted_for_all_users, is_hand_raised = is_hand_raised, is_speaking = is_speaking, is_current_user = is_current_user, bio = bio, screen_sharing_video_info = screen_sharing_video_info, video_info = video_info, screen_sharing_audio_source_id = screen_sharing_audio_source_id, audio_source_id = audio_source_id, participant_id = participant_id } =
  A.object [ "@type" A..= T.String "groupCallParticipant", "order" A..= order, "volume_level" A..= volume_level, "can_unmute_self" A..= can_unmute_self, "is_muted_for_current_user" A..= is_muted_for_current_user, "is_muted_for_all_users" A..= is_muted_for_all_users, "can_be_unmuted_for_current_user" A..= can_be_unmuted_for_current_user, "can_be_muted_for_current_user" A..= can_be_muted_for_current_user, "can_be_unmuted_for_all_users" A..= can_be_unmuted_for_all_users, "can_be_muted_for_all_users" A..= can_be_muted_for_all_users, "is_hand_raised" A..= is_hand_raised, "is_speaking" A..= is_speaking, "is_current_user" A..= is_current_user, "bio" A..= bio, "screen_sharing_video_info" A..= screen_sharing_video_info, "video_info" A..= video_info, "screen_sharing_audio_source_id" A..= screen_sharing_audio_source_id, "audio_source_id" A..= audio_source_id, "participant_id" A..= participant_id ]

instance T.FromJSON GroupCallParticipant where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "groupCallParticipant" -> parseGroupCallParticipant v
   _ -> mempty
  where
   parseGroupCallParticipant :: A.Value -> T.Parser GroupCallParticipant
   parseGroupCallParticipant = A.withObject "GroupCallParticipant" $ \o -> do
    order <- o A..:? "order"
    volume_level <- mconcat [ o A..:? "volume_level", readMaybe <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
    can_unmute_self <- o A..:? "can_unmute_self"
    is_muted_for_current_user <- o A..:? "is_muted_for_current_user"
    is_muted_for_all_users <- o A..:? "is_muted_for_all_users"
    can_be_unmuted_for_current_user <- o A..:? "can_be_unmuted_for_current_user"
    can_be_muted_for_current_user <- o A..:? "can_be_muted_for_current_user"
    can_be_unmuted_for_all_users <- o A..:? "can_be_unmuted_for_all_users"
    can_be_muted_for_all_users <- o A..:? "can_be_muted_for_all_users"
    is_hand_raised <- o A..:? "is_hand_raised"
    is_speaking <- o A..:? "is_speaking"
    is_current_user <- o A..:? "is_current_user"
    bio <- o A..:? "bio"
    screen_sharing_video_info <- o A..:? "screen_sharing_video_info"
    video_info <- o A..:? "video_info"
    screen_sharing_audio_source_id <- mconcat [ o A..:? "screen_sharing_audio_source_id", readMaybe <$> (o A..: "screen_sharing_audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    audio_source_id <- mconcat [ o A..:? "audio_source_id", readMaybe <$> (o A..: "audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    participant_id <- o A..:? "participant_id"
    return $ GroupCallParticipant { order = order, volume_level = volume_level, can_unmute_self = can_unmute_self, is_muted_for_current_user = is_muted_for_current_user, is_muted_for_all_users = is_muted_for_all_users, can_be_unmuted_for_current_user = can_be_unmuted_for_current_user, can_be_muted_for_current_user = can_be_muted_for_current_user, can_be_unmuted_for_all_users = can_be_unmuted_for_all_users, can_be_muted_for_all_users = can_be_muted_for_all_users, is_hand_raised = is_hand_raised, is_speaking = is_speaking, is_current_user = is_current_user, bio = bio, screen_sharing_video_info = screen_sharing_video_info, video_info = video_info, screen_sharing_audio_source_id = screen_sharing_audio_source_id, audio_source_id = audio_source_id, participant_id = participant_id }
 parseJSON _ = mempty
