module TD.Query.JoinGroupCall
  (JoinGroupCall(..)
  , defaultJoinGroupCall
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.MessageSender as MessageSender
import qualified Data.Text as T

-- | Joins an active group call. Returns join response payload for tgcalls. Returns 'TD.Data.Text.Text'
data JoinGroupCall
  = JoinGroupCall
    { group_call_id       :: Maybe Int                         -- ^ Group call identifier
    , participant_id      :: Maybe MessageSender.MessageSender -- ^ Identifier of a group call participant, which will be used to join the call; pass null to join as self; video chats only
    , audio_source_id     :: Maybe Int                         -- ^ Caller audio channel synchronization source identifier; received from tgcalls
    , payload             :: Maybe T.Text                      -- ^ Group call join payload; received from tgcalls
    , is_muted            :: Maybe Bool                        -- ^ Pass true to join the call with muted microphone
    , is_my_video_enabled :: Maybe Bool                        -- ^ Pass true if the user's video is enabled
    , invite_hash         :: Maybe T.Text                      -- ^ If non-empty, invite hash to be used to join the group call without being muted by administrators
    }
  deriving (Eq, Show)

instance I.ShortShow JoinGroupCall where
  shortShow
    JoinGroupCall
      { group_call_id       = group_call_id_
      , participant_id      = participant_id_
      , audio_source_id     = audio_source_id_
      , payload             = payload_
      , is_muted            = is_muted_
      , is_my_video_enabled = is_my_video_enabled_
      , invite_hash         = invite_hash_
      }
        = "JoinGroupCall"
          ++ I.cc
          [ "group_call_id"       `I.p` group_call_id_
          , "participant_id"      `I.p` participant_id_
          , "audio_source_id"     `I.p` audio_source_id_
          , "payload"             `I.p` payload_
          , "is_muted"            `I.p` is_muted_
          , "is_my_video_enabled" `I.p` is_my_video_enabled_
          , "invite_hash"         `I.p` invite_hash_
          ]

instance AT.ToJSON JoinGroupCall where
  toJSON
    JoinGroupCall
      { group_call_id       = group_call_id_
      , participant_id      = participant_id_
      , audio_source_id     = audio_source_id_
      , payload             = payload_
      , is_muted            = is_muted_
      , is_my_video_enabled = is_my_video_enabled_
      , invite_hash         = invite_hash_
      }
        = A.object
          [ "@type"               A..= AT.String "joinGroupCall"
          , "group_call_id"       A..= group_call_id_
          , "participant_id"      A..= participant_id_
          , "audio_source_id"     A..= audio_source_id_
          , "payload"             A..= payload_
          , "is_muted"            A..= is_muted_
          , "is_my_video_enabled" A..= is_my_video_enabled_
          , "invite_hash"         A..= invite_hash_
          ]

defaultJoinGroupCall :: JoinGroupCall
defaultJoinGroupCall =
  JoinGroupCall
    { group_call_id       = Nothing
    , participant_id      = Nothing
    , audio_source_id     = Nothing
    , payload             = Nothing
    , is_muted            = Nothing
    , is_my_video_enabled = Nothing
    , invite_hash         = Nothing
    }

