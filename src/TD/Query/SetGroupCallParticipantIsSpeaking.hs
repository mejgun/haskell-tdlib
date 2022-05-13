{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetGroupCallParticipantIsSpeaking where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that speaking state of a participant of an active group has changed @group_call_id Group call identifier
data SetGroupCallParticipantIsSpeaking = SetGroupCallParticipantIsSpeaking
  { -- |
    is_speaking :: Maybe Bool,
    -- | Group call participant's synchronization audio source identifier, or 0 for the current user @is_speaking Pass true if the user is speaking
    audio_source :: Maybe Int,
    -- |
    group_call_id :: Maybe Int
  }
  deriving (Eq)

instance Show SetGroupCallParticipantIsSpeaking where
  show
    SetGroupCallParticipantIsSpeaking
      { is_speaking = is_speaking_,
        audio_source = audio_source_,
        group_call_id = group_call_id_
      } =
      "SetGroupCallParticipantIsSpeaking"
        ++ U.cc
          [ U.p "is_speaking" is_speaking_,
            U.p "audio_source" audio_source_,
            U.p "group_call_id" group_call_id_
          ]

instance T.ToJSON SetGroupCallParticipantIsSpeaking where
  toJSON
    SetGroupCallParticipantIsSpeaking
      { is_speaking = is_speaking_,
        audio_source = audio_source_,
        group_call_id = group_call_id_
      } =
      A.object
        [ "@type" A..= T.String "setGroupCallParticipantIsSpeaking",
          "is_speaking" A..= is_speaking_,
          "audio_source" A..= audio_source_,
          "group_call_id" A..= group_call_id_
        ]
