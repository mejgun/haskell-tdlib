{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallParticipantIsMuted where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
data ToggleGroupCallParticipantIsMuted = ToggleGroupCallParticipantIsMuted
  { -- | Pass true to mute the user; pass false to unmute them
    is_muted :: Maybe Bool,
    -- | Participant identifier
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallParticipantIsMuted where
  show
    ToggleGroupCallParticipantIsMuted
      { is_muted = is_muted_,
        participant_id = participant_id_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallParticipantIsMuted"
        ++ U.cc
          [ U.p "is_muted" is_muted_,
            U.p "participant_id" participant_id_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallParticipantIsMuted where
  toJSON
    ToggleGroupCallParticipantIsMuted
      { is_muted = is_muted_,
        participant_id = participant_id_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallParticipantIsMuted",
          "is_muted" A..= is_muted_,
          "participant_id" A..= participant_id_,
          "group_call_id" A..= group_call_id_
        ]
