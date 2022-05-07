{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleGroupCallParticipantIsMuted where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
data ToggleGroupCallParticipantIsMuted = ToggleGroupCallParticipantIsMuted
  { -- |
    is_muted :: Maybe Bool,
    -- |
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier @participant_id Participant identifier @is_muted Pass true to mute the user; pass false to unmute the them
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallParticipantIsMuted where
  show
    ToggleGroupCallParticipantIsMuted
      { is_muted = is_muted,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      "ToggleGroupCallParticipantIsMuted"
        ++ U.cc
          [ U.p "is_muted" is_muted,
            U.p "participant_id" participant_id,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON ToggleGroupCallParticipantIsMuted where
  toJSON
    ToggleGroupCallParticipantIsMuted
      { is_muted = is_muted,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallParticipantIsMuted",
          "is_muted" A..= is_muted,
          "participant_id" A..= participant_id,
          "group_call_id" A..= group_call_id
        ]
