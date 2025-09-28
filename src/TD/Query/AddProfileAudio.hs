module TD.Query.AddProfileAudio
  (AddProfileAudio(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Adds an audio file to the beginning of the profile audio files of the current user. Returns 'TD.Data.Ok.Ok'
data AddProfileAudio
  = AddProfileAudio
    { file_id :: Maybe Int -- ^ Identifier of the audio file to be added. The file must have been uploaded to the server
    }
  deriving (Eq, Show)

instance I.ShortShow AddProfileAudio where
  shortShow
    AddProfileAudio
      { file_id = file_id_
      }
        = "AddProfileAudio"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON AddProfileAudio where
  toJSON
    AddProfileAudio
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "addProfileAudio"
          , "file_id" A..= file_id_
          ]

