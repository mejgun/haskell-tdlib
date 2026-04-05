module TD.Query.ListenToAudio
  (ListenToAudio(..)
  , defaultListenToAudio
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Informs TDLib that an audio was listened by the user. Returns 'TD.Data.Ok.Ok'
data ListenToAudio
  = ListenToAudio
    { audio_file_id :: Maybe Int -- ^ Identifier of the file with an audio
    , duration      :: Maybe Int -- ^ Duration of the listening to the audio, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow ListenToAudio where
  shortShow
    ListenToAudio
      { audio_file_id = audio_file_id_
      , duration      = duration_
      }
        = "ListenToAudio"
          ++ I.cc
          [ "audio_file_id" `I.p` audio_file_id_
          , "duration"      `I.p` duration_
          ]

instance AT.ToJSON ListenToAudio where
  toJSON
    ListenToAudio
      { audio_file_id = audio_file_id_
      , duration      = duration_
      }
        = A.object
          [ "@type"         A..= AT.String "listenToAudio"
          , "audio_file_id" A..= audio_file_id_
          , "duration"      A..= duration_
          ]

defaultListenToAudio :: ListenToAudio
defaultListenToAudio =
  ListenToAudio
    { audio_file_id = Nothing
    , duration      = Nothing
    }

