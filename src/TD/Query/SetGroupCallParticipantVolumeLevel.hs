module TD.Query.SetGroupCallParticipantVolumeLevel
  (SetGroupCallParticipantVolumeLevel(..)
  , defaultSetGroupCallParticipantVolumeLevel
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender

-- | Changes volume level of a participant of an active group call. If the current user can manage the group call, then the participant's volume level will be changed for all users with the default volume level. Returns 'TD.Data.Ok.Ok'
data SetGroupCallParticipantVolumeLevel
  = SetGroupCallParticipantVolumeLevel
    { group_call_id  :: Maybe Int                         -- ^ Group call identifier
    , participant_id :: Maybe MessageSender.MessageSender -- ^ Participant identifier
    , volume_level   :: Maybe Int                         -- ^ New participant's volume level; 1-20000 in hundreds of percents
    }
  deriving (Eq, Show)

instance I.ShortShow SetGroupCallParticipantVolumeLevel where
  shortShow
    SetGroupCallParticipantVolumeLevel
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , volume_level   = volume_level_
      }
        = "SetGroupCallParticipantVolumeLevel"
          ++ I.cc
          [ "group_call_id"  `I.p` group_call_id_
          , "participant_id" `I.p` participant_id_
          , "volume_level"   `I.p` volume_level_
          ]

instance AT.ToJSON SetGroupCallParticipantVolumeLevel where
  toJSON
    SetGroupCallParticipantVolumeLevel
      { group_call_id  = group_call_id_
      , participant_id = participant_id_
      , volume_level   = volume_level_
      }
        = A.object
          [ "@type"          A..= AT.String "setGroupCallParticipantVolumeLevel"
          , "group_call_id"  A..= group_call_id_
          , "participant_id" A..= participant_id_
          , "volume_level"   A..= volume_level_
          ]

defaultSetGroupCallParticipantVolumeLevel :: SetGroupCallParticipantVolumeLevel
defaultSetGroupCallParticipantVolumeLevel =
  SetGroupCallParticipantVolumeLevel
    { group_call_id  = Nothing
    , participant_id = Nothing
    , volume_level   = Nothing
    }

