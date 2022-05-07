{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SetGroupCallParticipantVolumeLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level
data SetGroupCallParticipantVolumeLevel = SetGroupCallParticipantVolumeLevel
  { -- |
    volume_level :: Maybe Int,
    -- |
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier @participant_id Participant identifier @volume_level New participant's volume level; 1-20000 in hundreds of percents
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGroupCallParticipantVolumeLevel where
  show
    SetGroupCallParticipantVolumeLevel
      { volume_level = volume_level,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      "SetGroupCallParticipantVolumeLevel"
        ++ U.cc
          [ U.p "volume_level" volume_level,
            U.p "participant_id" participant_id,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON SetGroupCallParticipantVolumeLevel where
  toJSON
    SetGroupCallParticipantVolumeLevel
      { volume_level = volume_level,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "setGroupCallParticipantVolumeLevel",
          "volume_level" A..= volume_level,
          "participant_id" A..= participant_id,
          "group_call_id" A..= group_call_id
        ]
