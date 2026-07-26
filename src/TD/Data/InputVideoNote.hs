module TD.Data.InputVideoNote
  ( InputVideoNote(..)    
  , defaultInputVideoNote 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail

data InputVideoNote
  = InputVideoNote -- ^ A video note to be sent
    { video_note :: Maybe InputFile.InputFile           -- ^ Video note file to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle
    , thumbnail  :: Maybe InputThumbnail.InputThumbnail -- ^ Video thumbnail; may be null if empty; pass null to skip thumbnail uploading
    , duration   :: Maybe Int                           -- ^ Duration of the video, in seconds; 0-60
    , _length    :: Maybe Int                           -- ^ Video width and height; must be positive and not greater than 640
    }
  deriving (Eq, Show)

instance I.ShortShow InputVideoNote where
  shortShow InputVideoNote
    { video_note = video_note_
    , thumbnail  = thumbnail_
    , duration   = duration_
    , _length    = _length_
    }
      = "InputVideoNote"
        ++ I.cc
        [ "video_note" `I.p` video_note_
        , "thumbnail"  `I.p` thumbnail_
        , "duration"   `I.p` duration_
        , "_length"    `I.p` _length_
        ]

instance AT.FromJSON InputVideoNote where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputVideoNote" -> parseInputVideoNote v
      _                -> mempty
    
    where
      parseInputVideoNote :: A.Value -> AT.Parser InputVideoNote
      parseInputVideoNote = A.withObject "InputVideoNote" $ \o -> do
        video_note_ <- o A..:?  "video_note"
        thumbnail_  <- o A..:?  "thumbnail"
        duration_   <- o A..:?  "duration"
        _length_    <- o A..:?  "length"
        pure $ InputVideoNote
          { video_note = video_note_
          , thumbnail  = thumbnail_
          , duration   = duration_
          , _length    = _length_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputVideoNote where
  toJSON InputVideoNote
    { video_note = video_note_
    , thumbnail  = thumbnail_
    , duration   = duration_
    , _length    = _length_
    }
      = A.object
        [ "@type"      A..= AT.String "inputVideoNote"
        , "video_note" A..= video_note_
        , "thumbnail"  A..= thumbnail_
        , "duration"   A..= duration_
        , "length"     A..= _length_
        ]

defaultInputVideoNote :: InputVideoNote
defaultInputVideoNote =
  InputVideoNote
    { video_note = Nothing
    , thumbnail  = Nothing
    , duration   = Nothing
    , _length    = Nothing
    }

