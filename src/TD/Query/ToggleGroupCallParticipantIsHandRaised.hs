module TD.Query.ToggleGroupCallParticipantIsHandRaised(ToggleGroupCallParticipantIsHandRaised(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data ToggleGroupCallParticipantIsHandRaised -- ^ Toggles whether a group call participant hand is rased
  = ToggleGroupCallParticipantIsHandRaised
    { group_call_id  :: Maybe Int                         -- ^ Group call identifier
    , participant_id :: Maybe MessageSender.MessageSender -- ^ Participant identifier
    , is_hand_raised :: Maybe Bool                        -- ^ Pass true if the user's hand needs to be raised. Only self hand can be raised. Requires groupCall.can_be_managed group call flag to lower other's hand
    }
  deriving (Eq)

instance Show ToggleGroupCallParticipantIsHandRaised where
  show
    ToggleGroupCallParticipantIsHandRaised
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , is_hand_raised = is_hand_raised_
      }
        = "ToggleGroupCallParticipantIsHandRaised"
          ++ I.cc
          [ "group_call_id"  `I.p` group_call_id_
          , "participant_id" `I.p` participant_id_
          , "is_hand_raised" `I.p` is_hand_raised_
          ]

instance AT.ToJSON ToggleGroupCallParticipantIsHandRaised where
  toJSON
    ToggleGroupCallParticipantIsHandRaised
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , is_hand_raised = is_hand_raised_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleGroupCallParticipantIsHandRaised"
          , "group_call_id"  A..= group_call_id_
          , "participant_id" A..= participant_id_
          , "is_hand_raised" A..= is_hand_raised_
          ]
