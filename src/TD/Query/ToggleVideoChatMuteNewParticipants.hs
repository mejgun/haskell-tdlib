module TD.Query.ToggleVideoChatMuteNewParticipants
  (ToggleVideoChatMuteNewParticipants(..)
  , defaultToggleVideoChatMuteNewParticipants
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Toggles whether new participants of a video chat can be unmuted only by administrators of the video chat. Requires groupCall.can_toggle_mute_new_participants right. Returns 'TD.Data.Ok.Ok'
data ToggleVideoChatMuteNewParticipants
  = ToggleVideoChatMuteNewParticipants
    { group_call_id         :: Maybe Int  -- ^ Group call identifier
    , mute_new_participants :: Maybe Bool -- ^ New value of the mute_new_participants setting
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleVideoChatMuteNewParticipants where
  shortShow
    ToggleVideoChatMuteNewParticipants
      { group_call_id         = group_call_id_
      , mute_new_participants = mute_new_participants_
      }
        = "ToggleVideoChatMuteNewParticipants"
          ++ I.cc
          [ "group_call_id"         `I.p` group_call_id_
          , "mute_new_participants" `I.p` mute_new_participants_
          ]

instance AT.ToJSON ToggleVideoChatMuteNewParticipants where
  toJSON
    ToggleVideoChatMuteNewParticipants
      { group_call_id         = group_call_id_
      , mute_new_participants = mute_new_participants_
      }
        = A.object
          [ "@type"                 A..= AT.String "toggleVideoChatMuteNewParticipants"
          , "group_call_id"         A..= group_call_id_
          , "mute_new_participants" A..= mute_new_participants_
          ]

defaultToggleVideoChatMuteNewParticipants :: ToggleVideoChatMuteNewParticipants
defaultToggleVideoChatMuteNewParticipants =
  ToggleVideoChatMuteNewParticipants
    { group_call_id         = Nothing
    , mute_new_participants = Nothing
    }

