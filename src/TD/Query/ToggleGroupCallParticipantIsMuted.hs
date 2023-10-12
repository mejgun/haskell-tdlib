module TD.Query.ToggleGroupCallParticipantIsMuted where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

data ToggleGroupCallParticipantIsMuted -- ^ Toggles whether a participant of an active group call is muted, unmuted, or allowed to unmute themselves
  = ToggleGroupCallParticipantIsMuted
    { group_call_id  :: Maybe Int                         -- ^ Group call identifier
    , participant_id :: Maybe MessageSender.MessageSender -- ^ Participant identifier
    , is_muted       :: Maybe Bool                        -- ^ Pass true to mute the user; pass false to unmute them
    }
  deriving (Eq)

instance Show ToggleGroupCallParticipantIsMuted where
  show
    ToggleGroupCallParticipantIsMuted
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , is_muted       = is_muted_
      }
        = "ToggleGroupCallParticipantIsMuted"
          ++ I.cc
          [ "group_call_id"  `I.p` group_call_id_
          , "participant_id" `I.p` participant_id_
          , "is_muted"       `I.p` is_muted_
          ]

instance AT.ToJSON ToggleGroupCallParticipantIsMuted where
  toJSON
    ToggleGroupCallParticipantIsMuted
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , is_muted       = is_muted_
      }
        = A.object
          [ "@type"          A..= AT.String "toggleGroupCallParticipantIsMuted"
          , "group_call_id"  A..= group_call_id_
          , "participant_id" A..= participant_id_
          , "is_muted"       A..= is_muted_
          ]
