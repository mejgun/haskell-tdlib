{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.GroupCallParticipant where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.GroupCallParticipantVideoInfo as GroupCallParticipantVideoInfo
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
data GroupCallParticipant = -- | Represents a group call participant
  GroupCallParticipant
  { -- | User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
    order :: Maybe String,
    -- | Participant's volume level; 1-20000 in hundreds of percents
    volume_level :: Maybe Int,
    -- | True, if the participant is muted for all users, but can unmute themselves
    can_unmute_self :: Maybe Bool,
    -- | True, if the participant is muted for the current user
    is_muted_for_current_user :: Maybe Bool,
    -- | True, if the participant is muted for all users
    is_muted_for_all_users :: Maybe Bool,
    -- | True, if the current user can unmute the participant for self
    can_be_unmuted_for_current_user :: Maybe Bool,
    -- | True, if the current user can mute the participant only for self
    can_be_muted_for_current_user :: Maybe Bool,
    -- | True, if the current user can allow the participant to unmute themselves or unmute the participant (if the participant is the current user)
    can_be_unmuted_for_all_users :: Maybe Bool,
    -- | True, if the current user can mute the participant for all other group call participants
    can_be_muted_for_all_users :: Maybe Bool,
    -- | True, if the participant hand is raised
    is_hand_raised :: Maybe Bool,
    -- | True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
    is_speaking :: Maybe Bool,
    -- | True, if the participant is the current user
    is_current_user :: Maybe Bool,
    -- | The participant user's bio or the participant chat's description
    bio :: Maybe String,
    -- | Information about user's screen sharing video channel; may be null if there is no active screen sharing video
    screen_sharing_video_info :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo,
    -- | Information about user's video channel; may be null if there is no active video
    video_info :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo,
    -- | User's screen sharing audio channel synchronization source identifier
    screen_sharing_audio_source_id :: Maybe Int,
    -- | User's audio channel synchronization source identifier
    audio_source_id :: Maybe Int,
    -- | Identifier of the group call participant
    participant_id :: Maybe MessageSender.MessageSender
  }
  deriving (Eq)

instance Show GroupCallParticipant where
  show
    GroupCallParticipant
      { order = order_,
        volume_level = volume_level_,
        can_unmute_self = can_unmute_self_,
        is_muted_for_current_user = is_muted_for_current_user_,
        is_muted_for_all_users = is_muted_for_all_users_,
        can_be_unmuted_for_current_user = can_be_unmuted_for_current_user_,
        can_be_muted_for_current_user = can_be_muted_for_current_user_,
        can_be_unmuted_for_all_users = can_be_unmuted_for_all_users_,
        can_be_muted_for_all_users = can_be_muted_for_all_users_,
        is_hand_raised = is_hand_raised_,
        is_speaking = is_speaking_,
        is_current_user = is_current_user_,
        bio = bio_,
        screen_sharing_video_info = screen_sharing_video_info_,
        video_info = video_info_,
        screen_sharing_audio_source_id = screen_sharing_audio_source_id_,
        audio_source_id = audio_source_id_,
        participant_id = participant_id_
      } =
      "GroupCallParticipant"
        ++ U.cc
          [ U.p "order" order_,
            U.p "volume_level" volume_level_,
            U.p "can_unmute_self" can_unmute_self_,
            U.p "is_muted_for_current_user" is_muted_for_current_user_,
            U.p "is_muted_for_all_users" is_muted_for_all_users_,
            U.p "can_be_unmuted_for_current_user" can_be_unmuted_for_current_user_,
            U.p "can_be_muted_for_current_user" can_be_muted_for_current_user_,
            U.p "can_be_unmuted_for_all_users" can_be_unmuted_for_all_users_,
            U.p "can_be_muted_for_all_users" can_be_muted_for_all_users_,
            U.p "is_hand_raised" is_hand_raised_,
            U.p "is_speaking" is_speaking_,
            U.p "is_current_user" is_current_user_,
            U.p "bio" bio_,
            U.p "screen_sharing_video_info" screen_sharing_video_info_,
            U.p "video_info" video_info_,
            U.p "screen_sharing_audio_source_id" screen_sharing_audio_source_id_,
            U.p "audio_source_id" audio_source_id_,
            U.p "participant_id" participant_id_
          ]

instance T.FromJSON GroupCallParticipant where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "groupCallParticipant" -> parseGroupCallParticipant v
      _ -> mempty
    where
      parseGroupCallParticipant :: A.Value -> T.Parser GroupCallParticipant
      parseGroupCallParticipant = A.withObject "GroupCallParticipant" $ \o -> do
        order_ <- o A..:? "order"
        volume_level_ <- mconcat [o A..:? "volume_level", U.rm <$> (o A..: "volume_level" :: T.Parser String)] :: T.Parser (Maybe Int)
        can_unmute_self_ <- o A..:? "can_unmute_self"
        is_muted_for_current_user_ <- o A..:? "is_muted_for_current_user"
        is_muted_for_all_users_ <- o A..:? "is_muted_for_all_users"
        can_be_unmuted_for_current_user_ <- o A..:? "can_be_unmuted_for_current_user"
        can_be_muted_for_current_user_ <- o A..:? "can_be_muted_for_current_user"
        can_be_unmuted_for_all_users_ <- o A..:? "can_be_unmuted_for_all_users"
        can_be_muted_for_all_users_ <- o A..:? "can_be_muted_for_all_users"
        is_hand_raised_ <- o A..:? "is_hand_raised"
        is_speaking_ <- o A..:? "is_speaking"
        is_current_user_ <- o A..:? "is_current_user"
        bio_ <- o A..:? "bio"
        screen_sharing_video_info_ <- o A..:? "screen_sharing_video_info"
        video_info_ <- o A..:? "video_info"
        screen_sharing_audio_source_id_ <- mconcat [o A..:? "screen_sharing_audio_source_id", U.rm <$> (o A..: "screen_sharing_audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        audio_source_id_ <- mconcat [o A..:? "audio_source_id", U.rm <$> (o A..: "audio_source_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        participant_id_ <- o A..:? "participant_id"
        return $ GroupCallParticipant {order = order_, volume_level = volume_level_, can_unmute_self = can_unmute_self_, is_muted_for_current_user = is_muted_for_current_user_, is_muted_for_all_users = is_muted_for_all_users_, can_be_unmuted_for_current_user = can_be_unmuted_for_current_user_, can_be_muted_for_current_user = can_be_muted_for_current_user_, can_be_unmuted_for_all_users = can_be_unmuted_for_all_users_, can_be_muted_for_all_users = can_be_muted_for_all_users_, is_hand_raised = is_hand_raised_, is_speaking = is_speaking_, is_current_user = is_current_user_, bio = bio_, screen_sharing_video_info = screen_sharing_video_info_, video_info = video_info_, screen_sharing_audio_source_id = screen_sharing_audio_source_id_, audio_source_id = audio_source_id_, participant_id = participant_id_}
  parseJSON _ = mempty

instance T.ToJSON GroupCallParticipant where
  toJSON
    GroupCallParticipant
      { order = order_,
        volume_level = volume_level_,
        can_unmute_self = can_unmute_self_,
        is_muted_for_current_user = is_muted_for_current_user_,
        is_muted_for_all_users = is_muted_for_all_users_,
        can_be_unmuted_for_current_user = can_be_unmuted_for_current_user_,
        can_be_muted_for_current_user = can_be_muted_for_current_user_,
        can_be_unmuted_for_all_users = can_be_unmuted_for_all_users_,
        can_be_muted_for_all_users = can_be_muted_for_all_users_,
        is_hand_raised = is_hand_raised_,
        is_speaking = is_speaking_,
        is_current_user = is_current_user_,
        bio = bio_,
        screen_sharing_video_info = screen_sharing_video_info_,
        video_info = video_info_,
        screen_sharing_audio_source_id = screen_sharing_audio_source_id_,
        audio_source_id = audio_source_id_,
        participant_id = participant_id_
      } =
      A.object
        [ "@type" A..= T.String "groupCallParticipant",
          "order" A..= order_,
          "volume_level" A..= volume_level_,
          "can_unmute_self" A..= can_unmute_self_,
          "is_muted_for_current_user" A..= is_muted_for_current_user_,
          "is_muted_for_all_users" A..= is_muted_for_all_users_,
          "can_be_unmuted_for_current_user" A..= can_be_unmuted_for_current_user_,
          "can_be_muted_for_current_user" A..= can_be_muted_for_current_user_,
          "can_be_unmuted_for_all_users" A..= can_be_unmuted_for_all_users_,
          "can_be_muted_for_all_users" A..= can_be_muted_for_all_users_,
          "is_hand_raised" A..= is_hand_raised_,
          "is_speaking" A..= is_speaking_,
          "is_current_user" A..= is_current_user_,
          "bio" A..= bio_,
          "screen_sharing_video_info" A..= screen_sharing_video_info_,
          "video_info" A..= video_info_,
          "screen_sharing_audio_source_id" A..= screen_sharing_audio_source_id_,
          "audio_source_id" A..= audio_source_id_,
          "participant_id" A..= participant_id_
        ]
