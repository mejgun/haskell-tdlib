module TD.Query.SetGroupCallParticipantIsSpeaking where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetGroupCallParticipantIsSpeaking -- ^ Informs TDLib that speaking state of a participant of an active group has changed
  = SetGroupCallParticipantIsSpeaking
    { group_call_id :: Maybe Int  -- ^ Group call identifier
    , audio_source  :: Maybe Int  -- ^ Group call participant's synchronization audio source identifier, or 0 for the current user
    , is_speaking   :: Maybe Bool -- ^ Pass true if the user is speaking
    }
  deriving (Eq)

instance Show SetGroupCallParticipantIsSpeaking where
  show
    SetGroupCallParticipantIsSpeaking
      { group_call_id = group_call_id_
      , audio_source  = audio_source_
      , is_speaking   = is_speaking_
      }
        = "SetGroupCallParticipantIsSpeaking"
          ++ I.cc
          [ "group_call_id" `I.p` group_call_id_
          , "audio_source"  `I.p` audio_source_
          , "is_speaking"   `I.p` is_speaking_
          ]

instance AT.ToJSON SetGroupCallParticipantIsSpeaking where
  toJSON
    SetGroupCallParticipantIsSpeaking
      { group_call_id = group_call_id_
      , audio_source  = audio_source_
      , is_speaking   = is_speaking_
      }
        = A.object
          [ "@type"         A..= AT.String "setGroupCallParticipantIsSpeaking"
          , "group_call_id" A..= group_call_id_
          , "audio_source"  A..= audio_source_
          , "is_speaking"   A..= is_speaking_
          ]
