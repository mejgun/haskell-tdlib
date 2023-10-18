module TD.Query.ToggleGroupCallMuteNewParticipants
  (ToggleGroupCallMuteNewParticipants(..)
  , defaultToggleGroupCallMuteNewParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_toggle_mute_new_participants group call flag. Returns 'TD.Data.Ok.Ok'
data ToggleGroupCallMuteNewParticipants
  = ToggleGroupCallMuteNewParticipants
    { group_call_id         :: Maybe Int  -- ^ Group call identifier
    , mute_new_participants :: Maybe Bool -- ^ New value of the mute_new_participants setting
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleGroupCallMuteNewParticipants where
  shortShow
    ToggleGroupCallMuteNewParticipants
      { group_call_id         = group_call_id_
      , mute_new_participants = mute_new_participants_
      }
        = "ToggleGroupCallMuteNewParticipants"
          ++ I.cc
          [ "group_call_id"         `I.p` group_call_id_
          , "mute_new_participants" `I.p` mute_new_participants_
          ]

instance AT.ToJSON ToggleGroupCallMuteNewParticipants where
  toJSON
    ToggleGroupCallMuteNewParticipants
      { group_call_id         = group_call_id_
      , mute_new_participants = mute_new_participants_
      }
        = A.object
          [ "@type"                 A..= AT.String "toggleGroupCallMuteNewParticipants"
          , "group_call_id"         A..= group_call_id_
          , "mute_new_participants" A..= mute_new_participants_
          ]

defaultToggleGroupCallMuteNewParticipants :: ToggleGroupCallMuteNewParticipants
defaultToggleGroupCallMuteNewParticipants =
  ToggleGroupCallMuteNewParticipants
    { group_call_id         = Nothing
    , mute_new_participants = Nothing
    }

