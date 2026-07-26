module TD.Query.AddProfileAudio
  (AddProfileAudio(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputAudio as InputAudio

-- | Adds an audio file to the beginning of the profile audio files of the current user. Returns 'TD.Data.Ok.Ok'
data AddProfileAudio
  = AddProfileAudio
    { audio :: Maybe InputAudio.InputAudio -- ^ The audio to add
    }
  deriving (Eq, Show)

instance I.ShortShow AddProfileAudio where
  shortShow
    AddProfileAudio
      { audio = audio_
      }
        = "AddProfileAudio"
          ++ I.cc
          [ "audio" `I.p` audio_
          ]

instance AT.ToJSON AddProfileAudio where
  toJSON
    AddProfileAudio
      { audio = audio_
      }
        = A.object
          [ "@type" A..= AT.String "addProfileAudio"
          , "audio" A..= audio_
          ]

