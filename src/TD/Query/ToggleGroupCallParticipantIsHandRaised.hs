{-# LANGUAGE OverloadedStrings #-}

module TD.Query.ToggleGroupCallParticipantIsHandRaised where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Toggles whether a group call participant hand is rased
data ToggleGroupCallParticipantIsHandRaised = ToggleGroupCallParticipantIsHandRaised
  { -- | Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed group call flag to lower other's hand
    is_hand_raised :: Maybe Bool,
    -- |
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier @participant_id Participant identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallParticipantIsHandRaised where
  show
    ToggleGroupCallParticipantIsHandRaised
      { is_hand_raised = is_hand_raised,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      "ToggleGroupCallParticipantIsHandRaised"
        ++ U.cc
          [ U.p "is_hand_raised" is_hand_raised,
            U.p "participant_id" participant_id,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON ToggleGroupCallParticipantIsHandRaised where
  toJSON
    ToggleGroupCallParticipantIsHandRaised
      { is_hand_raised = is_hand_raised,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallParticipantIsHandRaised",
          "is_hand_raised" A..= is_hand_raised,
          "participant_id" A..= participant_id,
          "group_call_id" A..= group_call_id
        ]
