{-# LANGUAGE OverloadedStrings #-}

module TD.Query.JoinGroupCall where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.MessageSender as MessageSender
import qualified Utils as U

-- |
-- Joins an active group call. Returns join response payload for tgcalls
data JoinGroupCall = JoinGroupCall
  { -- | If non-empty, invite hash to be used to join the group call without being muted by administrators
    invite_hash :: Maybe String,
    -- | Pass true if the user's video is enabled
    is_my_video_enabled :: Maybe Bool,
    -- | Pass true to join the call with muted microphone
    is_muted :: Maybe Bool,
    -- | Group call join payload; received from tgcalls
    payload :: Maybe String,
    -- | Caller audio channel synchronization source identifier; received from tgcalls
    audio_source_id :: Maybe Int,
    -- | Identifier of a group call participant, which will be used to join the call; pass null to join as self; video chats only
    participant_id :: Maybe MessageSender.MessageSender,
    -- | Group call identifier
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show JoinGroupCall where
  show
    JoinGroupCall
      { invite_hash = invite_hash,
        is_my_video_enabled = is_my_video_enabled,
        is_muted = is_muted,
        payload = payload,
        audio_source_id = audio_source_id,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      "JoinGroupCall"
        ++ U.cc
          [ U.p "invite_hash" invite_hash,
            U.p "is_my_video_enabled" is_my_video_enabled,
            U.p "is_muted" is_muted,
            U.p "payload" payload,
            U.p "audio_source_id" audio_source_id,
            U.p "participant_id" participant_id,
            U.p "group_call_id" group_call_id
          ]

instance T.ToJSON JoinGroupCall where
  toJSON
    JoinGroupCall
      { invite_hash = invite_hash,
        is_my_video_enabled = is_my_video_enabled,
        is_muted = is_muted,
        payload = payload,
        audio_source_id = audio_source_id,
        participant_id = participant_id,
        group_call_id = group_call_id
      } =
      A.object
        [ "@type" A..= T.String "joinGroupCall",
          "invite_hash" A..= invite_hash,
          "is_my_video_enabled" A..= is_my_video_enabled,
          "is_muted" A..= is_muted,
          "payload" A..= payload,
          "audio_source_id" A..= audio_source_id,
          "participant_id" A..= participant_id,
          "group_call_id" A..= group_call_id
        ]
