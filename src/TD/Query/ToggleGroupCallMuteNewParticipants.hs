{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.ToggleGroupCallMuteNewParticipants where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Toggles whether new participants of a group call can be unmuted only by administrators of the group call. Requires groupCall.can_toggle_mute_new_participants group call flag
data ToggleGroupCallMuteNewParticipants = ToggleGroupCallMuteNewParticipants
  { -- | New value of the mute_new_participants setting
    mute_new_participants :: Maybe Bool,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show ToggleGroupCallMuteNewParticipants where
  show
    ToggleGroupCallMuteNewParticipants
      { mute_new_participants = mute_new_participants_,
        group_call_id = group_call_id_
      } =
      "ToggleGroupCallMuteNewParticipants"
        ++ U.cc
          [ U.p "mute_new_participants" mute_new_participants_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON ToggleGroupCallMuteNewParticipants where
  toJSON
    ToggleGroupCallMuteNewParticipants
      { mute_new_participants = mute_new_participants_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "toggleGroupCallMuteNewParticipants",
          "mute_new_participants" A..= mute_new_participants_,
          "group_call_id" A..= group_call_id_
        ]
