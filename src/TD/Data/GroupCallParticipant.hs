module TD.Data.GroupCallParticipant
  (GroupCallParticipant(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified TD.Data.GroupCallParticipantVideoInfo as GroupCallParticipantVideoInfo
import qualified Data.Text as T

data GroupCallParticipant
  = GroupCallParticipant -- ^ Represents a group call participant
    { participant_id                  :: Maybe MessageSender.MessageSender                                 -- ^ Identifier of the group call participant
    , audio_source_id                 :: Maybe Int                                                         -- ^ User's audio channel synchronization source identifier
    , screen_sharing_audio_source_id  :: Maybe Int                                                         -- ^ User's screen sharing audio channel synchronization source identifier
    , video_info                      :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo -- ^ Information about user's video channel; may be null if there is no active video
    , screen_sharing_video_info       :: Maybe GroupCallParticipantVideoInfo.GroupCallParticipantVideoInfo -- ^ Information about user's screen sharing video channel; may be null if there is no active screen sharing video
    , bio                             :: Maybe T.Text                                                      -- ^ The participant user's bio or the participant chat's description
    , is_current_user                 :: Maybe Bool                                                        -- ^ True, if the participant is the current user
    , is_speaking                     :: Maybe Bool                                                        -- ^ True, if the participant is speaking as set by setGroupCallParticipantIsSpeaking
    , is_hand_raised                  :: Maybe Bool                                                        -- ^ True, if the participant hand is raised
    , can_be_muted_for_all_users      :: Maybe Bool                                                        -- ^ True, if the current user can mute the participant for all other group call participants
    , can_be_unmuted_for_all_users    :: Maybe Bool                                                        -- ^ True, if the current user can allow the participant to unmute themselves or unmute the participant (if the participant is the current user)
    , can_be_muted_for_current_user   :: Maybe Bool                                                        -- ^ True, if the current user can mute the participant only for self
    , can_be_unmuted_for_current_user :: Maybe Bool                                                        -- ^ True, if the current user can unmute the participant for self
    , is_muted_for_all_users          :: Maybe Bool                                                        -- ^ True, if the participant is muted for all users
    , is_muted_for_current_user       :: Maybe Bool                                                        -- ^ True, if the participant is muted for the current user
    , can_unmute_self                 :: Maybe Bool                                                        -- ^ True, if the participant is muted for all users, but can unmute themselves
    , volume_level                    :: Maybe Int                                                         -- ^ Participant's volume level; 1-20000 in hundreds of percents
    , order                           :: Maybe T.Text                                                      -- ^ User's order in the group call participant list. Orders must be compared lexicographically. The bigger is order, the higher is user in the list. If order is empty, the user must be removed from the participant list
    }
  deriving (Eq, Show)

instance I.ShortShow GroupCallParticipant where
  shortShow GroupCallParticipant
    { participant_id                  = participant_id_
    , audio_source_id                 = audio_source_id_
    , screen_sharing_audio_source_id  = screen_sharing_audio_source_id_
    , video_info                      = video_info_
    , screen_sharing_video_info       = screen_sharing_video_info_
    , bio                             = bio_
    , is_current_user                 = is_current_user_
    , is_speaking                     = is_speaking_
    , is_hand_raised                  = is_hand_raised_
    , can_be_muted_for_all_users      = can_be_muted_for_all_users_
    , can_be_unmuted_for_all_users    = can_be_unmuted_for_all_users_
    , can_be_muted_for_current_user   = can_be_muted_for_current_user_
    , can_be_unmuted_for_current_user = can_be_unmuted_for_current_user_
    , is_muted_for_all_users          = is_muted_for_all_users_
    , is_muted_for_current_user       = is_muted_for_current_user_
    , can_unmute_self                 = can_unmute_self_
    , volume_level                    = volume_level_
    , order                           = order_
    }
      = "GroupCallParticipant"
        ++ I.cc
        [ "participant_id"                  `I.p` participant_id_
        , "audio_source_id"                 `I.p` audio_source_id_
        , "screen_sharing_audio_source_id"  `I.p` screen_sharing_audio_source_id_
        , "video_info"                      `I.p` video_info_
        , "screen_sharing_video_info"       `I.p` screen_sharing_video_info_
        , "bio"                             `I.p` bio_
        , "is_current_user"                 `I.p` is_current_user_
        , "is_speaking"                     `I.p` is_speaking_
        , "is_hand_raised"                  `I.p` is_hand_raised_
        , "can_be_muted_for_all_users"      `I.p` can_be_muted_for_all_users_
        , "can_be_unmuted_for_all_users"    `I.p` can_be_unmuted_for_all_users_
        , "can_be_muted_for_current_user"   `I.p` can_be_muted_for_current_user_
        , "can_be_unmuted_for_current_user" `I.p` can_be_unmuted_for_current_user_
        , "is_muted_for_all_users"          `I.p` is_muted_for_all_users_
        , "is_muted_for_current_user"       `I.p` is_muted_for_current_user_
        , "can_unmute_self"                 `I.p` can_unmute_self_
        , "volume_level"                    `I.p` volume_level_
        , "order"                           `I.p` order_
        ]

instance AT.FromJSON GroupCallParticipant where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "groupCallParticipant" -> parseGroupCallParticipant v
      _                      -> mempty
    
    where
      parseGroupCallParticipant :: A.Value -> AT.Parser GroupCallParticipant
      parseGroupCallParticipant = A.withObject "GroupCallParticipant" $ \o -> do
        participant_id_                  <- o A..:?  "participant_id"
        audio_source_id_                 <- o A..:?  "audio_source_id"
        screen_sharing_audio_source_id_  <- o A..:?  "screen_sharing_audio_source_id"
        video_info_                      <- o A..:?  "video_info"
        screen_sharing_video_info_       <- o A..:?  "screen_sharing_video_info"
        bio_                             <- o A..:?  "bio"
        is_current_user_                 <- o A..:?  "is_current_user"
        is_speaking_                     <- o A..:?  "is_speaking"
        is_hand_raised_                  <- o A..:?  "is_hand_raised"
        can_be_muted_for_all_users_      <- o A..:?  "can_be_muted_for_all_users"
        can_be_unmuted_for_all_users_    <- o A..:?  "can_be_unmuted_for_all_users"
        can_be_muted_for_current_user_   <- o A..:?  "can_be_muted_for_current_user"
        can_be_unmuted_for_current_user_ <- o A..:?  "can_be_unmuted_for_current_user"
        is_muted_for_all_users_          <- o A..:?  "is_muted_for_all_users"
        is_muted_for_current_user_       <- o A..:?  "is_muted_for_current_user"
        can_unmute_self_                 <- o A..:?  "can_unmute_self"
        volume_level_                    <- o A..:?  "volume_level"
        order_                           <- o A..:?  "order"
        pure $ GroupCallParticipant
          { participant_id                  = participant_id_
          , audio_source_id                 = audio_source_id_
          , screen_sharing_audio_source_id  = screen_sharing_audio_source_id_
          , video_info                      = video_info_
          , screen_sharing_video_info       = screen_sharing_video_info_
          , bio                             = bio_
          , is_current_user                 = is_current_user_
          , is_speaking                     = is_speaking_
          , is_hand_raised                  = is_hand_raised_
          , can_be_muted_for_all_users      = can_be_muted_for_all_users_
          , can_be_unmuted_for_all_users    = can_be_unmuted_for_all_users_
          , can_be_muted_for_current_user   = can_be_muted_for_current_user_
          , can_be_unmuted_for_current_user = can_be_unmuted_for_current_user_
          , is_muted_for_all_users          = is_muted_for_all_users_
          , is_muted_for_current_user       = is_muted_for_current_user_
          , can_unmute_self                 = can_unmute_self_
          , volume_level                    = volume_level_
          , order                           = order_
          }
  parseJSON _ = mempty

