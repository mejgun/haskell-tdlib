module TD.Query.InviteGroupCallParticipant
  (InviteGroupCallParticipant(..)
  , defaultInviteGroupCallParticipant
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Invites a user to an active group call; for group calls not bound to a chat only. Sends a service message of the type messageGroupCall. The group call can have at most getOption("group_call_participant_count_max") participants. Returns 'TD.Data.InviteGroupCallParticipantResult.InviteGroupCallParticipantResult'
data InviteGroupCallParticipant
  = InviteGroupCallParticipant
    { group_call_id :: Maybe Int  -- ^ Group call identifier
    , user_id       :: Maybe Int  -- ^ User identifier
    , is_video      :: Maybe Bool -- ^ Pass true if the group call is a video call
    }
  deriving (Eq, Show)

instance I.ShortShow InviteGroupCallParticipant where
  shortShow
    InviteGroupCallParticipant
      { group_call_id = group_call_id_
      , user_id       = user_id_
      , is_video      = is_video_
      }
        = "InviteGroupCallParticipant"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "user_id"       `I.p` user_id_
          , "is_video"      `I.p` is_video_
          ]

instance AT.ToJSON InviteGroupCallParticipant where
  toJSON
    InviteGroupCallParticipant
      { group_call_id = group_call_id_
      , user_id       = user_id_
      , is_video      = is_video_
      }
        = A.object
          [ "@type"         A..= AT.String "inviteGroupCallParticipant"
          , "group_call_id" A..= group_call_id_
          , "user_id"       A..= user_id_
          , "is_video"      A..= is_video_
          ]

defaultInviteGroupCallParticipant :: InviteGroupCallParticipant
defaultInviteGroupCallParticipant =
  InviteGroupCallParticipant
    { group_call_id = Nothing
    , user_id       = Nothing
    , is_video      = Nothing
    }

