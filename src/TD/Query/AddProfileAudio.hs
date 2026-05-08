module TD.Query.AddProfileAudio
  (AddProfileAudio(..)
  , defaultAddProfileAudio
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified Data.Text as T

-- | Adds an audio file to the beginning of the profile audio files of the current user. Returns 'TD.Data.Ok.Ok'
data AddProfileAudio
  = AddProfileAudio
    { audio     :: Maybe InputFile.InputFile -- ^ The audio file to be added
    , duration  :: Maybe Int                 -- ^ Duration of the audio, in seconds; may be replaced by the server; ignored for already uploaded files
    , title     :: Maybe T.Text              -- ^ Title of the audio; 0-64 characters; may be replaced by the server; ignored for already uploaded files
    , performer :: Maybe T.Text              -- ^ Performer of the audio; 0-64 characters, may be replaced by the server; ignored for already uploaded files
    }
  deriving (Eq, Show)

instance I.ShortShow AddProfileAudio where
  shortShow
    AddProfileAudio
      { audio     = audio_
      , duration  = duration_
      , title     = title_
      , performer = performer_
      }
        = "AddProfileAudio"
          ++ I.cc
          [ "audio"     `I.p` audio_
          , "duration"  `I.p` duration_
          , "title"     `I.p` title_
          , "performer" `I.p` performer_
          ]

instance AT.ToJSON AddProfileAudio where
  toJSON
    AddProfileAudio
      { audio     = audio_
      , duration  = duration_
      , title     = title_
      , performer = performer_
      }
        = A.object
          [ "@type"     A..= AT.String "addProfileAudio"
          , "audio"     A..= audio_
          , "duration"  A..= duration_
          , "title"     A..= title_
          , "performer" A..= performer_
          ]

defaultAddProfileAudio :: AddProfileAudio
defaultAddProfileAudio =
  AddProfileAudio
    { audio     = Nothing
    , duration  = Nothing
    , title     = Nothing
    , performer = Nothing
    }

