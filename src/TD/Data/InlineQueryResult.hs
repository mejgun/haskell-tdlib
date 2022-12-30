{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.InlineQueryResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Animation as Animation
import qualified TD.Data.Audio as Audio
import qualified TD.Data.Contact as Contact
import qualified TD.Data.Document as Document
import qualified TD.Data.Game as Game
import qualified TD.Data.Location as Location
import qualified TD.Data.Photo as Photo
import qualified TD.Data.Sticker as Sticker
import qualified TD.Data.Thumbnail as Thumbnail
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Video as Video
import qualified TD.Data.VoiceNote as VoiceNote
import qualified Utils as U

-- | Represents a single result of an inline query
data InlineQueryResult
  = -- | Represents a link to an article or web page
    InlineQueryResultArticle
      { -- | Result thumbnail in JPEG format; may be null
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- |
        description :: Maybe String,
        -- | Title of the result
        title :: Maybe String,
        -- | True, if the URL must be not shown
        hide_url :: Maybe Bool,
        -- | URL of the result, if it exists
        url :: Maybe String,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a user contact
    InlineQueryResultContact
      { -- | Result thumbnail in JPEG format; may be null
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- | A user contact
        contact :: Maybe Contact.Contact,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a point on the map
    InlineQueryResultLocation
      { -- | Result thumbnail in JPEG format; may be null
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- | Title of the result
        title :: Maybe String,
        -- | Location result
        location :: Maybe Location.Location,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents information about a venue
    InlineQueryResultVenue
      { -- | Result thumbnail in JPEG format; may be null
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- | Venue result
        venue :: Maybe Venue.Venue,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents information about a game
    InlineQueryResultGame
      { -- | Game result
        game :: Maybe Game.Game,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents an animation file
    InlineQueryResultAnimation
      { -- | Animation title
        title :: Maybe String,
        -- | Animation file
        animation :: Maybe Animation.Animation,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents an audio file
    InlineQueryResultAudio
      { -- | Audio file
        audio :: Maybe Audio.Audio,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a document
    InlineQueryResultDocument
      { -- |
        description :: Maybe String,
        -- | Document title
        title :: Maybe String,
        -- | Document
        document :: Maybe Document.Document,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a photo
    InlineQueryResultPhoto
      { -- |
        description :: Maybe String,
        -- | Title of the result, if known
        title :: Maybe String,
        -- | Photo
        photo :: Maybe Photo.Photo,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a sticker
    InlineQueryResultSticker
      { -- | Sticker
        sticker :: Maybe Sticker.Sticker,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a video
    InlineQueryResultVideo
      { -- |
        description :: Maybe String,
        -- | Title of the video
        title :: Maybe String,
        -- | Video
        video :: Maybe Video.Video,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  | -- | Represents a voice note
    InlineQueryResultVoiceNote
      { -- | Title of the voice note
        title :: Maybe String,
        -- | Voice note
        voice_note :: Maybe VoiceNote.VoiceNote,
        -- | Unique identifier of the query result
        _id :: Maybe String
      }
  deriving (Eq)

instance Show InlineQueryResult where
  show
    InlineQueryResultArticle
      { thumbnail = thumbnail_,
        description = description_,
        title = title_,
        hide_url = hide_url_,
        url = url_,
        _id = _id_
      } =
      "InlineQueryResultArticle"
        ++ U.cc
          [ U.p "thumbnail" thumbnail_,
            U.p "description" description_,
            U.p "title" title_,
            U.p "hide_url" hide_url_,
            U.p "url" url_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultContact
      { thumbnail = thumbnail_,
        contact = contact_,
        _id = _id_
      } =
      "InlineQueryResultContact"
        ++ U.cc
          [ U.p "thumbnail" thumbnail_,
            U.p "contact" contact_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultLocation
      { thumbnail = thumbnail_,
        title = title_,
        location = location_,
        _id = _id_
      } =
      "InlineQueryResultLocation"
        ++ U.cc
          [ U.p "thumbnail" thumbnail_,
            U.p "title" title_,
            U.p "location" location_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultVenue
      { thumbnail = thumbnail_,
        venue = venue_,
        _id = _id_
      } =
      "InlineQueryResultVenue"
        ++ U.cc
          [ U.p "thumbnail" thumbnail_,
            U.p "venue" venue_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultGame
      { game = game_,
        _id = _id_
      } =
      "InlineQueryResultGame"
        ++ U.cc
          [ U.p "game" game_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultAnimation
      { title = title_,
        animation = animation_,
        _id = _id_
      } =
      "InlineQueryResultAnimation"
        ++ U.cc
          [ U.p "title" title_,
            U.p "animation" animation_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultAudio
      { audio = audio_,
        _id = _id_
      } =
      "InlineQueryResultAudio"
        ++ U.cc
          [ U.p "audio" audio_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultDocument
      { description = description_,
        title = title_,
        document = document_,
        _id = _id_
      } =
      "InlineQueryResultDocument"
        ++ U.cc
          [ U.p "description" description_,
            U.p "title" title_,
            U.p "document" document_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultPhoto
      { description = description_,
        title = title_,
        photo = photo_,
        _id = _id_
      } =
      "InlineQueryResultPhoto"
        ++ U.cc
          [ U.p "description" description_,
            U.p "title" title_,
            U.p "photo" photo_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultSticker
      { sticker = sticker_,
        _id = _id_
      } =
      "InlineQueryResultSticker"
        ++ U.cc
          [ U.p "sticker" sticker_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultVideo
      { description = description_,
        title = title_,
        video = video_,
        _id = _id_
      } =
      "InlineQueryResultVideo"
        ++ U.cc
          [ U.p "description" description_,
            U.p "title" title_,
            U.p "video" video_,
            U.p "_id" _id_
          ]
  show
    InlineQueryResultVoiceNote
      { title = title_,
        voice_note = voice_note_,
        _id = _id_
      } =
      "InlineQueryResultVoiceNote"
        ++ U.cc
          [ U.p "title" title_,
            U.p "voice_note" voice_note_,
            U.p "_id" _id_
          ]

instance T.FromJSON InlineQueryResult where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "inlineQueryResultArticle" -> parseInlineQueryResultArticle v
      "inlineQueryResultContact" -> parseInlineQueryResultContact v
      "inlineQueryResultLocation" -> parseInlineQueryResultLocation v
      "inlineQueryResultVenue" -> parseInlineQueryResultVenue v
      "inlineQueryResultGame" -> parseInlineQueryResultGame v
      "inlineQueryResultAnimation" -> parseInlineQueryResultAnimation v
      "inlineQueryResultAudio" -> parseInlineQueryResultAudio v
      "inlineQueryResultDocument" -> parseInlineQueryResultDocument v
      "inlineQueryResultPhoto" -> parseInlineQueryResultPhoto v
      "inlineQueryResultSticker" -> parseInlineQueryResultSticker v
      "inlineQueryResultVideo" -> parseInlineQueryResultVideo v
      "inlineQueryResultVoiceNote" -> parseInlineQueryResultVoiceNote v
      _ -> mempty
    where
      parseInlineQueryResultArticle :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultArticle = A.withObject "InlineQueryResultArticle" $ \o -> do
        thumbnail_ <- o A..:? "thumbnail"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        hide_url_ <- o A..:? "hide_url"
        url_ <- o A..:? "url"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultArticle {thumbnail = thumbnail_, description = description_, title = title_, hide_url = hide_url_, url = url_, _id = _id_}

      parseInlineQueryResultContact :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultContact = A.withObject "InlineQueryResultContact" $ \o -> do
        thumbnail_ <- o A..:? "thumbnail"
        contact_ <- o A..:? "contact"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultContact {thumbnail = thumbnail_, contact = contact_, _id = _id_}

      parseInlineQueryResultLocation :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultLocation = A.withObject "InlineQueryResultLocation" $ \o -> do
        thumbnail_ <- o A..:? "thumbnail"
        title_ <- o A..:? "title"
        location_ <- o A..:? "location"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultLocation {thumbnail = thumbnail_, title = title_, location = location_, _id = _id_}

      parseInlineQueryResultVenue :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultVenue = A.withObject "InlineQueryResultVenue" $ \o -> do
        thumbnail_ <- o A..:? "thumbnail"
        venue_ <- o A..:? "venue"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultVenue {thumbnail = thumbnail_, venue = venue_, _id = _id_}

      parseInlineQueryResultGame :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultGame = A.withObject "InlineQueryResultGame" $ \o -> do
        game_ <- o A..:? "game"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultGame {game = game_, _id = _id_}

      parseInlineQueryResultAnimation :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultAnimation = A.withObject "InlineQueryResultAnimation" $ \o -> do
        title_ <- o A..:? "title"
        animation_ <- o A..:? "animation"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultAnimation {title = title_, animation = animation_, _id = _id_}

      parseInlineQueryResultAudio :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultAudio = A.withObject "InlineQueryResultAudio" $ \o -> do
        audio_ <- o A..:? "audio"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultAudio {audio = audio_, _id = _id_}

      parseInlineQueryResultDocument :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultDocument = A.withObject "InlineQueryResultDocument" $ \o -> do
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        document_ <- o A..:? "document"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultDocument {description = description_, title = title_, document = document_, _id = _id_}

      parseInlineQueryResultPhoto :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultPhoto = A.withObject "InlineQueryResultPhoto" $ \o -> do
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        photo_ <- o A..:? "photo"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultPhoto {description = description_, title = title_, photo = photo_, _id = _id_}

      parseInlineQueryResultSticker :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultSticker = A.withObject "InlineQueryResultSticker" $ \o -> do
        sticker_ <- o A..:? "sticker"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultSticker {sticker = sticker_, _id = _id_}

      parseInlineQueryResultVideo :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultVideo = A.withObject "InlineQueryResultVideo" $ \o -> do
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        video_ <- o A..:? "video"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultVideo {description = description_, title = title_, video = video_, _id = _id_}

      parseInlineQueryResultVoiceNote :: A.Value -> T.Parser InlineQueryResult
      parseInlineQueryResultVoiceNote = A.withObject "InlineQueryResultVoiceNote" $ \o -> do
        title_ <- o A..:? "title"
        voice_note_ <- o A..:? "voice_note"
        _id_ <- o A..:? "id"
        return $ InlineQueryResultVoiceNote {title = title_, voice_note = voice_note_, _id = _id_}
  parseJSON _ = mempty

instance T.ToJSON InlineQueryResult where
  toJSON
    InlineQueryResultArticle
      { thumbnail = thumbnail_,
        description = description_,
        title = title_,
        hide_url = hide_url_,
        url = url_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultArticle",
          "thumbnail" A..= thumbnail_,
          "description" A..= description_,
          "title" A..= title_,
          "hide_url" A..= hide_url_,
          "url" A..= url_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultContact
      { thumbnail = thumbnail_,
        contact = contact_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultContact",
          "thumbnail" A..= thumbnail_,
          "contact" A..= contact_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultLocation
      { thumbnail = thumbnail_,
        title = title_,
        location = location_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultLocation",
          "thumbnail" A..= thumbnail_,
          "title" A..= title_,
          "location" A..= location_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultVenue
      { thumbnail = thumbnail_,
        venue = venue_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVenue",
          "thumbnail" A..= thumbnail_,
          "venue" A..= venue_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultGame
      { game = game_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultGame",
          "game" A..= game_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultAnimation
      { title = title_,
        animation = animation_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultAnimation",
          "title" A..= title_,
          "animation" A..= animation_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultAudio
      { audio = audio_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultAudio",
          "audio" A..= audio_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultDocument
      { description = description_,
        title = title_,
        document = document_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultDocument",
          "description" A..= description_,
          "title" A..= title_,
          "document" A..= document_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultPhoto
      { description = description_,
        title = title_,
        photo = photo_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultPhoto",
          "description" A..= description_,
          "title" A..= title_,
          "photo" A..= photo_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultSticker
      { sticker = sticker_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultSticker",
          "sticker" A..= sticker_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultVideo
      { description = description_,
        title = title_,
        video = video_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVideo",
          "description" A..= description_,
          "title" A..= title_,
          "video" A..= video_,
          "id" A..= _id_
        ]
  toJSON
    InlineQueryResultVoiceNote
      { title = title_,
        voice_note = voice_note_,
        _id = _id_
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVoiceNote",
          "title" A..= title_,
          "voice_note" A..= voice_note_,
          "id" A..= _id_
        ]
