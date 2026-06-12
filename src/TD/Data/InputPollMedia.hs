module TD.Data.InputPollMedia
  (InputPollMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputAnimation as InputAnimation
import qualified TD.Data.InputAudio as InputAudio
import qualified TD.Data.InputDocument as InputDocument
import qualified Data.Text as T
import qualified TD.Data.Location as Location
import qualified TD.Data.InputPhoto as InputPhoto
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail
import qualified TD.Data.Venue as Venue
import qualified TD.Data.InputVideo as InputVideo

-- | The content of a poll media to send
data InputPollMedia
  = InputPollMediaAnimation -- ^ An animation
    { animation :: Maybe InputAnimation.InputAnimation -- ^ The animation to be sent
    }
  | InputPollMediaAudio -- ^ An audio
    { audio :: Maybe InputAudio.InputAudio -- ^ The audio to be sent
    }
  | InputPollMediaDocument -- ^ A document (general file)
    { document :: Maybe InputDocument.InputDocument -- ^ The document to be sent
    }
  | InputPollMediaLink -- ^ A link
    { url :: Maybe T.Text -- ^ URL of the link
    }
  | InputPollMediaLocation -- ^ A location
    { location :: Maybe Location.Location -- ^ Location to be sent
    }
  | InputPollMediaPhoto -- ^ A photo
    { photo :: Maybe InputPhoto.InputPhoto -- ^ Photo to be sent
    }
  | InputPollMediaSticker -- ^ A sticker
    { sticker   :: Maybe InputFile.InputFile           -- ^ Sticker to be sent
    , thumbnail :: Maybe InputThumbnail.InputThumbnail -- ^ Sticker thumbnail; pass null to skip thumbnail uploading
    , width     :: Maybe Int                           -- ^ Sticker width
    , height    :: Maybe Int                           -- ^ Sticker height
    }
  | InputPollMediaVenue -- ^ A venue
    { venue :: Maybe Venue.Venue -- ^ Venue to send
    }
  | InputPollMediaVideo -- ^ A video
    { video :: Maybe InputVideo.InputVideo -- ^ The video to be sent
    }
  deriving (Eq, Show)

instance I.ShortShow InputPollMedia where
  shortShow InputPollMediaAnimation
    { animation = animation_
    }
      = "InputPollMediaAnimation"
        ++ I.cc
        [ "animation" `I.p` animation_
        ]
  shortShow InputPollMediaAudio
    { audio = audio_
    }
      = "InputPollMediaAudio"
        ++ I.cc
        [ "audio" `I.p` audio_
        ]
  shortShow InputPollMediaDocument
    { document = document_
    }
      = "InputPollMediaDocument"
        ++ I.cc
        [ "document" `I.p` document_
        ]
  shortShow InputPollMediaLink
    { url = url_
    }
      = "InputPollMediaLink"
        ++ I.cc
        [ "url" `I.p` url_
        ]
  shortShow InputPollMediaLocation
    { location = location_
    }
      = "InputPollMediaLocation"
        ++ I.cc
        [ "location" `I.p` location_
        ]
  shortShow InputPollMediaPhoto
    { photo = photo_
    }
      = "InputPollMediaPhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        ]
  shortShow InputPollMediaSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = "InputPollMediaSticker"
        ++ I.cc
        [ "sticker"   `I.p` sticker_
        , "thumbnail" `I.p` thumbnail_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        ]
  shortShow InputPollMediaVenue
    { venue = venue_
    }
      = "InputPollMediaVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  shortShow InputPollMediaVideo
    { video = video_
    }
      = "InputPollMediaVideo"
        ++ I.cc
        [ "video" `I.p` video_
        ]

instance AT.FromJSON InputPollMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputPollMediaAnimation" -> parseInputPollMediaAnimation v
      "inputPollMediaAudio"     -> parseInputPollMediaAudio v
      "inputPollMediaDocument"  -> parseInputPollMediaDocument v
      "inputPollMediaLink"      -> parseInputPollMediaLink v
      "inputPollMediaLocation"  -> parseInputPollMediaLocation v
      "inputPollMediaPhoto"     -> parseInputPollMediaPhoto v
      "inputPollMediaSticker"   -> parseInputPollMediaSticker v
      "inputPollMediaVenue"     -> parseInputPollMediaVenue v
      "inputPollMediaVideo"     -> parseInputPollMediaVideo v
      _                         -> mempty
    
    where
      parseInputPollMediaAnimation :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaAnimation = A.withObject "InputPollMediaAnimation" $ \o -> do
        animation_ <- o A..:?  "animation"
        pure $ InputPollMediaAnimation
          { animation = animation_
          }
      parseInputPollMediaAudio :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaAudio = A.withObject "InputPollMediaAudio" $ \o -> do
        audio_ <- o A..:?  "audio"
        pure $ InputPollMediaAudio
          { audio = audio_
          }
      parseInputPollMediaDocument :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaDocument = A.withObject "InputPollMediaDocument" $ \o -> do
        document_ <- o A..:?  "document"
        pure $ InputPollMediaDocument
          { document = document_
          }
      parseInputPollMediaLink :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaLink = A.withObject "InputPollMediaLink" $ \o -> do
        url_ <- o A..:?  "url"
        pure $ InputPollMediaLink
          { url = url_
          }
      parseInputPollMediaLocation :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaLocation = A.withObject "InputPollMediaLocation" $ \o -> do
        location_ <- o A..:?  "location"
        pure $ InputPollMediaLocation
          { location = location_
          }
      parseInputPollMediaPhoto :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaPhoto = A.withObject "InputPollMediaPhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        pure $ InputPollMediaPhoto
          { photo = photo_
          }
      parseInputPollMediaSticker :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaSticker = A.withObject "InputPollMediaSticker" $ \o -> do
        sticker_   <- o A..:?  "sticker"
        thumbnail_ <- o A..:?  "thumbnail"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        pure $ InputPollMediaSticker
          { sticker   = sticker_
          , thumbnail = thumbnail_
          , width     = width_
          , height    = height_
          }
      parseInputPollMediaVenue :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaVenue = A.withObject "InputPollMediaVenue" $ \o -> do
        venue_ <- o A..:?  "venue"
        pure $ InputPollMediaVenue
          { venue = venue_
          }
      parseInputPollMediaVideo :: A.Value -> AT.Parser InputPollMedia
      parseInputPollMediaVideo = A.withObject "InputPollMediaVideo" $ \o -> do
        video_ <- o A..:?  "video"
        pure $ InputPollMediaVideo
          { video = video_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputPollMedia where
  toJSON InputPollMediaAnimation
    { animation = animation_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPollMediaAnimation"
        , "animation" A..= animation_
        ]
  toJSON InputPollMediaAudio
    { audio = audio_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollMediaAudio"
        , "audio" A..= audio_
        ]
  toJSON InputPollMediaDocument
    { document = document_
    }
      = A.object
        [ "@type"    A..= AT.String "inputPollMediaDocument"
        , "document" A..= document_
        ]
  toJSON InputPollMediaLink
    { url = url_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollMediaLink"
        , "url"   A..= url_
        ]
  toJSON InputPollMediaLocation
    { location = location_
    }
      = A.object
        [ "@type"    A..= AT.String "inputPollMediaLocation"
        , "location" A..= location_
        ]
  toJSON InputPollMediaPhoto
    { photo = photo_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollMediaPhoto"
        , "photo" A..= photo_
        ]
  toJSON InputPollMediaSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    }
      = A.object
        [ "@type"     A..= AT.String "inputPollMediaSticker"
        , "sticker"   A..= sticker_
        , "thumbnail" A..= thumbnail_
        , "width"     A..= width_
        , "height"    A..= height_
        ]
  toJSON InputPollMediaVenue
    { venue = venue_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollMediaVenue"
        , "venue" A..= venue_
        ]
  toJSON InputPollMediaVideo
    { video = video_
    }
      = A.object
        [ "@type" A..= AT.String "inputPollMediaVideo"
        , "video" A..= video_
        ]

