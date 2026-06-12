module TD.Data.PollMedia
  (PollMedia(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified Data.Text as T
import qualified TD.Data.LinkPreview as LinkPreview
import qualified TD.Data.Location as Location
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Video as Video
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Venue as Venue
import qualified TD.Data.AlternativeVideo as AlternativeVideo
import qualified TD.Data.VideoStoryboard as VideoStoryboard

-- | Contains the media in a poll
data PollMedia
  = PollMediaAnimation -- ^ An animation
    { animation :: Maybe Animation.Animation -- ^ The animation
    }
  | PollMediaAudio -- ^ An audio
    { audio :: Maybe Audio.Audio -- ^ The audio
    }
  | PollMediaDocument -- ^ A document (general file)
    { document :: Maybe Document.Document -- ^ The document
    }
  | PollMediaLink -- ^ A link
    { url          :: Maybe T.Text                  -- ^ URL of the link
    , link_preview :: Maybe LinkPreview.LinkPreview -- ^ Preview of the link; may be null if unknown
    }
  | PollMediaLocation -- ^ A location
    { location :: Maybe Location.Location -- ^ The location
    }
  | PollMediaPhoto -- ^ A photo
    { photo :: Maybe Photo.Photo -- ^ The photo
    , video :: Maybe Video.Video -- ^ The video representing the live photo; may be null if the photo is static
    }
  | PollMediaSticker -- ^ A sticker
    { sticker :: Maybe Sticker.Sticker -- ^ The sticker
    }
  | PollMediaVenue -- ^ A venue
    { venue :: Maybe Venue.Venue -- ^ The venue
    }
  | PollMediaVideo -- ^ A video
    { video              :: Maybe Video.Video                         -- ^ The video description
    , alternative_videos :: Maybe [AlternativeVideo.AlternativeVideo] -- ^ Alternative qualities of the video
    , storyboards        :: Maybe [VideoStoryboard.VideoStoryboard]   -- ^ Available storyboards for the video
    , cover              :: Maybe Photo.Photo                         -- ^ Cover of the video; may be null if none
    , start_timestamp    :: Maybe Int                                 -- ^ Timestamp from which the video playing must start, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow PollMedia where
  shortShow PollMediaAnimation
    { animation = animation_
    }
      = "PollMediaAnimation"
        ++ I.cc
        [ "animation" `I.p` animation_
        ]
  shortShow PollMediaAudio
    { audio = audio_
    }
      = "PollMediaAudio"
        ++ I.cc
        [ "audio" `I.p` audio_
        ]
  shortShow PollMediaDocument
    { document = document_
    }
      = "PollMediaDocument"
        ++ I.cc
        [ "document" `I.p` document_
        ]
  shortShow PollMediaLink
    { url          = url_
    , link_preview = link_preview_
    }
      = "PollMediaLink"
        ++ I.cc
        [ "url"          `I.p` url_
        , "link_preview" `I.p` link_preview_
        ]
  shortShow PollMediaLocation
    { location = location_
    }
      = "PollMediaLocation"
        ++ I.cc
        [ "location" `I.p` location_
        ]
  shortShow PollMediaPhoto
    { photo = photo_
    , video = video_
    }
      = "PollMediaPhoto"
        ++ I.cc
        [ "photo" `I.p` photo_
        , "video" `I.p` video_
        ]
  shortShow PollMediaSticker
    { sticker = sticker_
    }
      = "PollMediaSticker"
        ++ I.cc
        [ "sticker" `I.p` sticker_
        ]
  shortShow PollMediaVenue
    { venue = venue_
    }
      = "PollMediaVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  shortShow PollMediaVideo
    { video              = video_
    , alternative_videos = alternative_videos_
    , storyboards        = storyboards_
    , cover              = cover_
    , start_timestamp    = start_timestamp_
    }
      = "PollMediaVideo"
        ++ I.cc
        [ "video"              `I.p` video_
        , "alternative_videos" `I.p` alternative_videos_
        , "storyboards"        `I.p` storyboards_
        , "cover"              `I.p` cover_
        , "start_timestamp"    `I.p` start_timestamp_
        ]

instance AT.FromJSON PollMedia where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "pollMediaAnimation" -> parsePollMediaAnimation v
      "pollMediaAudio"     -> parsePollMediaAudio v
      "pollMediaDocument"  -> parsePollMediaDocument v
      "pollMediaLink"      -> parsePollMediaLink v
      "pollMediaLocation"  -> parsePollMediaLocation v
      "pollMediaPhoto"     -> parsePollMediaPhoto v
      "pollMediaSticker"   -> parsePollMediaSticker v
      "pollMediaVenue"     -> parsePollMediaVenue v
      "pollMediaVideo"     -> parsePollMediaVideo v
      _                    -> mempty
    
    where
      parsePollMediaAnimation :: A.Value -> AT.Parser PollMedia
      parsePollMediaAnimation = A.withObject "PollMediaAnimation" $ \o -> do
        animation_ <- o A..:?  "animation"
        pure $ PollMediaAnimation
          { animation = animation_
          }
      parsePollMediaAudio :: A.Value -> AT.Parser PollMedia
      parsePollMediaAudio = A.withObject "PollMediaAudio" $ \o -> do
        audio_ <- o A..:?  "audio"
        pure $ PollMediaAudio
          { audio = audio_
          }
      parsePollMediaDocument :: A.Value -> AT.Parser PollMedia
      parsePollMediaDocument = A.withObject "PollMediaDocument" $ \o -> do
        document_ <- o A..:?  "document"
        pure $ PollMediaDocument
          { document = document_
          }
      parsePollMediaLink :: A.Value -> AT.Parser PollMedia
      parsePollMediaLink = A.withObject "PollMediaLink" $ \o -> do
        url_          <- o A..:?  "url"
        link_preview_ <- o A..:?  "link_preview"
        pure $ PollMediaLink
          { url          = url_
          , link_preview = link_preview_
          }
      parsePollMediaLocation :: A.Value -> AT.Parser PollMedia
      parsePollMediaLocation = A.withObject "PollMediaLocation" $ \o -> do
        location_ <- o A..:?  "location"
        pure $ PollMediaLocation
          { location = location_
          }
      parsePollMediaPhoto :: A.Value -> AT.Parser PollMedia
      parsePollMediaPhoto = A.withObject "PollMediaPhoto" $ \o -> do
        photo_ <- o A..:?  "photo"
        video_ <- o A..:?  "video"
        pure $ PollMediaPhoto
          { photo = photo_
          , video = video_
          }
      parsePollMediaSticker :: A.Value -> AT.Parser PollMedia
      parsePollMediaSticker = A.withObject "PollMediaSticker" $ \o -> do
        sticker_ <- o A..:?  "sticker"
        pure $ PollMediaSticker
          { sticker = sticker_
          }
      parsePollMediaVenue :: A.Value -> AT.Parser PollMedia
      parsePollMediaVenue = A.withObject "PollMediaVenue" $ \o -> do
        venue_ <- o A..:?  "venue"
        pure $ PollMediaVenue
          { venue = venue_
          }
      parsePollMediaVideo :: A.Value -> AT.Parser PollMedia
      parsePollMediaVideo = A.withObject "PollMediaVideo" $ \o -> do
        video_              <- o A..:?  "video"
        alternative_videos_ <- o A..:?  "alternative_videos"
        storyboards_        <- o A..:?  "storyboards"
        cover_              <- o A..:?  "cover"
        start_timestamp_    <- o A..:?  "start_timestamp"
        pure $ PollMediaVideo
          { video              = video_
          , alternative_videos = alternative_videos_
          , storyboards        = storyboards_
          , cover              = cover_
          , start_timestamp    = start_timestamp_
          }
  parseJSON _ = mempty

