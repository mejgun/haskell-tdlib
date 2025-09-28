module TD.Query.RemoveProfileAudio
  (RemoveProfileAudio(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Removes an audio file from the profile audio files of the current user. Returns 'TD.Data.Ok.Ok'
data RemoveProfileAudio
  = RemoveProfileAudio
    { file_id :: Maybe Int -- ^ Identifier of the audio file to be removed
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveProfileAudio where
  shortShow
    RemoveProfileAudio
      { file_id = file_id_
      }
        = "RemoveProfileAudio"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON RemoveProfileAudio where
  toJSON
    RemoveProfileAudio
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "removeProfileAudio"
          , "file_id" A..= file_id_
          ]

