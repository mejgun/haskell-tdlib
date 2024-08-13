module TD.Data.InlineQueryResult
  (InlineQueryResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.Contact as Contact
import qualified TD.Data.Location as Location
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Game as Game
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Document as Document
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Video as Video
import qualified TD.Data.VoiceNote as VoiceNote

-- | Represents a single result of an inline query
data InlineQueryResult
  = InlineQueryResultArticle -- ^ Represents a link to an article or web page
    { _id         :: Maybe T.Text              -- ^ Unique identifier of the query result
    , url         :: Maybe T.Text              -- ^ URL of the result, if it exists
    , hide_url    :: Maybe Bool                -- ^ True, if the URL must be not shown
    , title       :: Maybe T.Text              -- ^ Title of the result
    , description :: Maybe T.Text              -- ^ A short description of the result
    , thumbnail   :: Maybe Thumbnail.Thumbnail -- ^ Result thumbnail in JPEG format; may be null
    }
  | InlineQueryResultContact -- ^ Represents a user contact
    { _id       :: Maybe T.Text              -- ^ Unique identifier of the query result
    , contact   :: Maybe Contact.Contact     -- ^ A user contact
    , thumbnail :: Maybe Thumbnail.Thumbnail -- ^ Result thumbnail in JPEG format; may be null
    }
  | InlineQueryResultLocation -- ^ Represents a point on the map
    { _id       :: Maybe T.Text              -- ^ Unique identifier of the query result
    , location  :: Maybe Location.Location   -- ^ Location result
    , title     :: Maybe T.Text              -- ^ Title of the result
    , thumbnail :: Maybe Thumbnail.Thumbnail -- ^ Result thumbnail in JPEG format; may be null
    }
  | InlineQueryResultVenue -- ^ Represents information about a venue
    { _id       :: Maybe T.Text              -- ^ Unique identifier of the query result
    , venue     :: Maybe Venue.Venue         -- ^ Venue result
    , thumbnail :: Maybe Thumbnail.Thumbnail -- ^ Result thumbnail in JPEG format; may be null
    }
  | InlineQueryResultGame -- ^ Represents information about a game
    { _id  :: Maybe T.Text    -- ^ Unique identifier of the query result
    , game :: Maybe Game.Game -- ^ Game result
    }
  | InlineQueryResultAnimation -- ^ Represents an animation file
    { _id       :: Maybe T.Text              -- ^ Unique identifier of the query result
    , animation :: Maybe Animation.Animation -- ^ Animation file
    , title     :: Maybe T.Text              -- ^ Animation title
    }
  | InlineQueryResultAudio -- ^ Represents an audio file
    { _id   :: Maybe T.Text      -- ^ Unique identifier of the query result
    , audio :: Maybe Audio.Audio -- ^ Audio file
    }
  | InlineQueryResultDocument -- ^ Represents a document
    { _id         :: Maybe T.Text            -- ^ Unique identifier of the query result
    , document    :: Maybe Document.Document -- ^ Document
    , title       :: Maybe T.Text            -- ^ Document title
    , description :: Maybe T.Text            -- ^ Document description
    }
  | InlineQueryResultPhoto -- ^ Represents a photo
    { _id         :: Maybe T.Text      -- ^ Unique identifier of the query result
    , photo       :: Maybe Photo.Photo -- ^ Photo
    , title       :: Maybe T.Text      -- ^ Title of the result, if known
    , description :: Maybe T.Text      -- ^ A short description of the result, if known
    }
  | InlineQueryResultSticker -- ^ Represents a sticker
    { _id     :: Maybe T.Text          -- ^ Unique identifier of the query result
    , sticker :: Maybe Sticker.Sticker -- ^ Sticker
    }
  | InlineQueryResultVideo -- ^ Represents a video
    { _id         :: Maybe T.Text      -- ^ Unique identifier of the query result
    , video       :: Maybe Video.Video -- ^ Video
    , title       :: Maybe T.Text      -- ^ Title of the video
    , description :: Maybe T.Text      -- ^ Description of the video
    }
  | InlineQueryResultVoiceNote -- ^ Represents a voice note
    { _id        :: Maybe T.Text              -- ^ Unique identifier of the query result
    , voice_note :: Maybe VoiceNote.VoiceNote -- ^ Voice note
    , title      :: Maybe T.Text              -- ^ Title of the voice note
    }
  deriving (Eq, Show)

instance I.ShortShow InlineQueryResult where
  shortShow InlineQueryResultArticle
    { _id         = _id_
    , url         = url_
    , hide_url    = hide_url_
    , title       = title_
    , description = description_
    , thumbnail   = thumbnail_
    }
      = "InlineQueryResultArticle"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "url"         `I.p` url_
        , "hide_url"    `I.p` hide_url_
        , "title"       `I.p` title_
        , "description" `I.p` description_
        , "thumbnail"   `I.p` thumbnail_
        ]
  shortShow InlineQueryResultContact
    { _id       = _id_
    , contact   = contact_
    , thumbnail = thumbnail_
    }
      = "InlineQueryResultContact"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "contact"   `I.p` contact_
        , "thumbnail" `I.p` thumbnail_
        ]
  shortShow InlineQueryResultLocation
    { _id       = _id_
    , location  = location_
    , title     = title_
    , thumbnail = thumbnail_
    }
      = "InlineQueryResultLocation"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "location"  `I.p` location_
        , "title"     `I.p` title_
        , "thumbnail" `I.p` thumbnail_
        ]
  shortShow InlineQueryResultVenue
    { _id       = _id_
    , venue     = venue_
    , thumbnail = thumbnail_
    }
      = "InlineQueryResultVenue"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "venue"     `I.p` venue_
        , "thumbnail" `I.p` thumbnail_
        ]
  shortShow InlineQueryResultGame
    { _id  = _id_
    , game = game_
    }
      = "InlineQueryResultGame"
        ++ I.cc
        [ "_id"  `I.p` _id_
        , "game" `I.p` game_
        ]
  shortShow InlineQueryResultAnimation
    { _id       = _id_
    , animation = animation_
    , title     = title_
    }
      = "InlineQueryResultAnimation"
        ++ I.cc
        [ "_id"       `I.p` _id_
        , "animation" `I.p` animation_
        , "title"     `I.p` title_
        ]
  shortShow InlineQueryResultAudio
    { _id   = _id_
    , audio = audio_
    }
      = "InlineQueryResultAudio"
        ++ I.cc
        [ "_id"   `I.p` _id_
        , "audio" `I.p` audio_
        ]
  shortShow InlineQueryResultDocument
    { _id         = _id_
    , document    = document_
    , title       = title_
    , description = description_
    }
      = "InlineQueryResultDocument"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "document"    `I.p` document_
        , "title"       `I.p` title_
        , "description" `I.p` description_
        ]
  shortShow InlineQueryResultPhoto
    { _id         = _id_
    , photo       = photo_
    , title       = title_
    , description = description_
    }
      = "InlineQueryResultPhoto"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "photo"       `I.p` photo_
        , "title"       `I.p` title_
        , "description" `I.p` description_
        ]
  shortShow InlineQueryResultSticker
    { _id     = _id_
    , sticker = sticker_
    }
      = "InlineQueryResultSticker"
        ++ I.cc
        [ "_id"     `I.p` _id_
        , "sticker" `I.p` sticker_
        ]
  shortShow InlineQueryResultVideo
    { _id         = _id_
    , video       = video_
    , title       = title_
    , description = description_
    }
      = "InlineQueryResultVideo"
        ++ I.cc
        [ "_id"         `I.p` _id_
        , "video"       `I.p` video_
        , "title"       `I.p` title_
        , "description" `I.p` description_
        ]
  shortShow InlineQueryResultVoiceNote
    { _id        = _id_
    , voice_note = voice_note_
    , title      = title_
    }
      = "InlineQueryResultVoiceNote"
        ++ I.cc
        [ "_id"        `I.p` _id_
        , "voice_note" `I.p` voice_note_
        , "title"      `I.p` title_
        ]

instance AT.FromJSON InlineQueryResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inlineQueryResultArticle"   -> parseInlineQueryResultArticle v
      "inlineQueryResultContact"   -> parseInlineQueryResultContact v
      "inlineQueryResultLocation"  -> parseInlineQueryResultLocation v
      "inlineQueryResultVenue"     -> parseInlineQueryResultVenue v
      "inlineQueryResultGame"      -> parseInlineQueryResultGame v
      "inlineQueryResultAnimation" -> parseInlineQueryResultAnimation v
      "inlineQueryResultAudio"     -> parseInlineQueryResultAudio v
      "inlineQueryResultDocument"  -> parseInlineQueryResultDocument v
      "inlineQueryResultPhoto"     -> parseInlineQueryResultPhoto v
      "inlineQueryResultSticker"   -> parseInlineQueryResultSticker v
      "inlineQueryResultVideo"     -> parseInlineQueryResultVideo v
      "inlineQueryResultVoiceNote" -> parseInlineQueryResultVoiceNote v
      _                            -> mempty
    
    where
      parseInlineQueryResultArticle :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultArticle = A.withObject "InlineQueryResultArticle" $ \o -> do
        _id_         <- o A..:?  "id"
        url_         <- o A..:?  "url"
        hide_url_    <- o A..:?  "hide_url"
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        thumbnail_   <- o A..:?  "thumbnail"
        pure $ InlineQueryResultArticle
          { _id         = _id_
          , url         = url_
          , hide_url    = hide_url_
          , title       = title_
          , description = description_
          , thumbnail   = thumbnail_
          }
      parseInlineQueryResultContact :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultContact = A.withObject "InlineQueryResultContact" $ \o -> do
        _id_       <- o A..:?  "id"
        contact_   <- o A..:?  "contact"
        thumbnail_ <- o A..:?  "thumbnail"
        pure $ InlineQueryResultContact
          { _id       = _id_
          , contact   = contact_
          , thumbnail = thumbnail_
          }
      parseInlineQueryResultLocation :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultLocation = A.withObject "InlineQueryResultLocation" $ \o -> do
        _id_       <- o A..:?  "id"
        location_  <- o A..:?  "location"
        title_     <- o A..:?  "title"
        thumbnail_ <- o A..:?  "thumbnail"
        pure $ InlineQueryResultLocation
          { _id       = _id_
          , location  = location_
          , title     = title_
          , thumbnail = thumbnail_
          }
      parseInlineQueryResultVenue :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultVenue = A.withObject "InlineQueryResultVenue" $ \o -> do
        _id_       <- o A..:?  "id"
        venue_     <- o A..:?  "venue"
        thumbnail_ <- o A..:?  "thumbnail"
        pure $ InlineQueryResultVenue
          { _id       = _id_
          , venue     = venue_
          , thumbnail = thumbnail_
          }
      parseInlineQueryResultGame :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultGame = A.withObject "InlineQueryResultGame" $ \o -> do
        _id_  <- o A..:?  "id"
        game_ <- o A..:?  "game"
        pure $ InlineQueryResultGame
          { _id  = _id_
          , game = game_
          }
      parseInlineQueryResultAnimation :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultAnimation = A.withObject "InlineQueryResultAnimation" $ \o -> do
        _id_       <- o A..:?  "id"
        animation_ <- o A..:?  "animation"
        title_     <- o A..:?  "title"
        pure $ InlineQueryResultAnimation
          { _id       = _id_
          , animation = animation_
          , title     = title_
          }
      parseInlineQueryResultAudio :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultAudio = A.withObject "InlineQueryResultAudio" $ \o -> do
        _id_   <- o A..:?  "id"
        audio_ <- o A..:?  "audio"
        pure $ InlineQueryResultAudio
          { _id   = _id_
          , audio = audio_
          }
      parseInlineQueryResultDocument :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultDocument = A.withObject "InlineQueryResultDocument" $ \o -> do
        _id_         <- o A..:?  "id"
        document_    <- o A..:?  "document"
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        pure $ InlineQueryResultDocument
          { _id         = _id_
          , document    = document_
          , title       = title_
          , description = description_
          }
      parseInlineQueryResultPhoto :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultPhoto = A.withObject "InlineQueryResultPhoto" $ \o -> do
        _id_         <- o A..:?  "id"
        photo_       <- o A..:?  "photo"
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        pure $ InlineQueryResultPhoto
          { _id         = _id_
          , photo       = photo_
          , title       = title_
          , description = description_
          }
      parseInlineQueryResultSticker :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultSticker = A.withObject "InlineQueryResultSticker" $ \o -> do
        _id_     <- o A..:?  "id"
        sticker_ <- o A..:?  "sticker"
        pure $ InlineQueryResultSticker
          { _id     = _id_
          , sticker = sticker_
          }
      parseInlineQueryResultVideo :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultVideo = A.withObject "InlineQueryResultVideo" $ \o -> do
        _id_         <- o A..:?  "id"
        video_       <- o A..:?  "video"
        title_       <- o A..:?  "title"
        description_ <- o A..:?  "description"
        pure $ InlineQueryResultVideo
          { _id         = _id_
          , video       = video_
          , title       = title_
          , description = description_
          }
      parseInlineQueryResultVoiceNote :: A.Value -> AT.Parser InlineQueryResult
      parseInlineQueryResultVoiceNote = A.withObject "InlineQueryResultVoiceNote" $ \o -> do
        _id_        <- o A..:?  "id"
        voice_note_ <- o A..:?  "voice_note"
        title_      <- o A..:?  "title"
        pure $ InlineQueryResultVoiceNote
          { _id        = _id_
          , voice_note = voice_note_
          , title      = title_
          }
  parseJSON _ = mempty

