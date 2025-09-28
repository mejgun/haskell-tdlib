module TD.Query.SetProfileAudioPosition
  (SetProfileAudioPosition(..)
  , defaultSetProfileAudioPosition
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes position of an audio file in the profile audio files of the current user. Returns 'TD.Data.Ok.Ok'
data SetProfileAudioPosition
  = SetProfileAudioPosition
    { file_id       :: Maybe Int -- ^ Identifier of the file from profile audio files, which position will be changed
    , after_file_id :: Maybe Int -- ^ Identifier of the file from profile audio files after which the file will be positioned; pass 0 to move the file to the beginning of the list
    }
  deriving (Eq, Show)

instance I.ShortShow SetProfileAudioPosition where
  shortShow
    SetProfileAudioPosition
      { file_id       = file_id_
      , after_file_id = after_file_id_
      }
        = "SetProfileAudioPosition"
          ++ I.cc
          [ "file_id"       `I.p` file_id_
          , "after_file_id" `I.p` after_file_id_
          ]

instance AT.ToJSON SetProfileAudioPosition where
  toJSON
    SetProfileAudioPosition
      { file_id       = file_id_
      , after_file_id = after_file_id_
      }
        = A.object
          [ "@type"         A..= AT.String "setProfileAudioPosition"
          , "file_id"       A..= file_id_
          , "after_file_id" A..= after_file_id_
          ]

defaultSetProfileAudioPosition :: SetProfileAudioPosition
defaultSetProfileAudioPosition =
  SetProfileAudioPosition
    { file_id       = Nothing
    , after_file_id = Nothing
    }

