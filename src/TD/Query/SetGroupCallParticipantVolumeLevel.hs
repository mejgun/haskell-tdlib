{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetGroupCallParticipantVolumeLevel where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level
data SetGroupCallParticipantVolumeLevel = SetGroupCallParticipantVolumeLevel
  { -- | New participant's volume level; 1-20000 in hundreds of percents
    volume_level :: Maybe Int,
    -- | Participant identifier
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGroupCallParticipantVolumeLevel where
  show
    SetGroupCallParticipantVolumeLevel
      { volume_level = volume_level_,
        participant_id = participant_id_,
        group_call_id = group_call_id_
      } =
      "SetGroupCallParticipantVolumeLevel"
        ++ U.cc
          [ U.p "volume_level" volume_level_,
            U.p "participant_id" participant_id_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON SetGroupCallParticipantVolumeLevel where
  toJSON
    SetGroupCallParticipantVolumeLevel
      { volume_level = volume_level_,
        participant_id = participant_id_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "setGroupCallParticipantVolumeLevel",
          "volume_level" A..= volume_level_,
          "participant_id" A..= participant_id_,
          "group_call_id" A..= group_call_id_
        ]
