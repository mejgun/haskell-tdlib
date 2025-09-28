module TD.Query.IsProfileAudio
  (IsProfileAudio(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Checks whether a file is in the profile audio files of the current user. Returns a 404 error if it isn't. Returns 'TD.Data.Ok.Ok'
data IsProfileAudio
  = IsProfileAudio
    { file_id :: Maybe Int -- ^ Identifier of the audio file to check
    }
  deriving (Eq, Show)

instance I.ShortShow IsProfileAudio where
  shortShow
    IsProfileAudio
      { file_id = file_id_
      }
        = "IsProfileAudio"
          ++ I.cc
          [ "file_id" `I.p` file_id_
          ]

instance AT.ToJSON IsProfileAudio where
  toJSON
    IsProfileAudio
      { file_id = file_id_
      }
        = A.object
          [ "@type"   A..= AT.String "isProfileAudio"
          , "file_id" A..= file_id_
          ]

