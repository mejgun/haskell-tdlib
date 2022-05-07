{-# LANGUAGE OverloadedStrings #-}

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
  = -- | Represents a link to an article or web page @id Unique identifier of the query result @url URL of the result, if it exists @hide_url True, if the URL must be not shown @title Title of the result
    InlineQueryResultArticle
      { -- |
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        hide_url :: Maybe Bool,
        -- |
        url :: Maybe String,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a user contact @id Unique identifier of the query result @contact A user contact @thumbnail Result thumbnail in JPEG format; may be null
    InlineQueryResultContact
      { -- |
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- |
        contact :: Maybe Contact.Contact,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a point on the map @id Unique identifier of the query result @location Location result @title Title of the result @thumbnail Result thumbnail in JPEG format; may be null
    InlineQueryResultLocation
      { -- |
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- |
        title :: Maybe String,
        -- |
        location :: Maybe Location.Location,
        -- |
        _id :: Maybe String
      }
  | -- | Represents information about a venue @id Unique identifier of the query result @venue Venue result @thumbnail Result thumbnail in JPEG format; may be null
    InlineQueryResultVenue
      { -- |
        thumbnail :: Maybe Thumbnail.Thumbnail,
        -- |
        venue :: Maybe Venue.Venue,
        -- |
        _id :: Maybe String
      }
  | -- | Represents information about a game @id Unique identifier of the query result @game Game result
    InlineQueryResultGame
      { -- |
        game :: Maybe Game.Game,
        -- |
        _id :: Maybe String
      }
  | -- | Represents an animation file @id Unique identifier of the query result @animation Animation file @title Animation title
    InlineQueryResultAnimation
      { -- |
        title :: Maybe String,
        -- |
        animation :: Maybe Animation.Animation,
        -- |
        _id :: Maybe String
      }
  | -- | Represents an audio file @id Unique identifier of the query result @audio Audio file
    InlineQueryResultAudio
      { -- |
        audio :: Maybe Audio.Audio,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a document @id Unique identifier of the query result @document Document @title Document title @param_description Document description
    InlineQueryResultDocument
      { -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        document :: Maybe Document.Document,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a photo @id Unique identifier of the query result @photo Photo @title Title of the result, if known @param_description A short description of the result, if known
    InlineQueryResultPhoto
      { -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        photo :: Maybe Photo.Photo,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a sticker @id Unique identifier of the query result @sticker Sticker
    InlineQueryResultSticker
      { -- |
        sticker :: Maybe Sticker.Sticker,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a video @id Unique identifier of the query result @video Video @title Title of the video @param_description Description of the video
    InlineQueryResultVideo
      { -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        video :: Maybe Video.Video,
        -- |
        _id :: Maybe String
      }
  | -- | Represents a voice note @id Unique identifier of the query result @voice_note Voice note @title Title of the voice note
    InlineQueryResultVoiceNote
      { -- |
        title :: Maybe String,
        -- |
        voice_note :: Maybe VoiceNote.VoiceNote,
        -- |
        _id :: Maybe String
      }
  deriving (Eq)

instance Show InlineQueryResult where
  show
    InlineQueryResultArticle
      { thumbnail = thumbnail,
        description = description,
        title = title,
        hide_url = hide_url,
        url = url,
        _id = _id
      } =
      "InlineQueryResultArticle"
        ++ U.cc
          [ U.p "thumbnail" thumbnail,
            U.p "description" description,
            U.p "title" title,
            U.p "hide_url" hide_url,
            U.p "url" url,
            U.p "_id" _id
          ]
  show
    InlineQueryResultContact
      { thumbnail = thumbnail,
        contact = contact,
        _id = _id
      } =
      "InlineQueryResultContact"
        ++ U.cc
          [ U.p "thumbnail" thumbnail,
            U.p "contact" contact,
            U.p "_id" _id
          ]
  show
    InlineQueryResultLocation
      { thumbnail = thumbnail,
        title = title,
        location = location,
        _id = _id
      } =
      "InlineQueryResultLocation"
        ++ U.cc
          [ U.p "thumbnail" thumbnail,
            U.p "title" title,
            U.p "location" location,
            U.p "_id" _id
          ]
  show
    InlineQueryResultVenue
      { thumbnail = thumbnail,
        venue = venue,
        _id = _id
      } =
      "InlineQueryResultVenue"
        ++ U.cc
          [ U.p "thumbnail" thumbnail,
            U.p "venue" venue,
            U.p "_id" _id
          ]
  show
    InlineQueryResultGame
      { game = game,
        _id = _id
      } =
      "InlineQueryResultGame"
        ++ U.cc
          [ U.p "game" game,
            U.p "_id" _id
          ]
  show
    InlineQueryResultAnimation
      { title = title,
        animation = animation,
        _id = _id
      } =
      "InlineQueryResultAnimation"
        ++ U.cc
          [ U.p "title" title,
            U.p "animation" animation,
            U.p "_id" _id
          ]
  show
    InlineQueryResultAudio
      { audio = audio,
        _id = _id
      } =
      "InlineQueryResultAudio"
        ++ U.cc
          [ U.p "audio" audio,
            U.p "_id" _id
          ]
  show
    InlineQueryResultDocument
      { description = description,
        title = title,
        document = document,
        _id = _id
      } =
      "InlineQueryResultDocument"
        ++ U.cc
          [ U.p "description" description,
            U.p "title" title,
            U.p "document" document,
            U.p "_id" _id
          ]
  show
    InlineQueryResultPhoto
      { description = description,
        title = title,
        photo = photo,
        _id = _id
      } =
      "InlineQueryResultPhoto"
        ++ U.cc
          [ U.p "description" description,
            U.p "title" title,
            U.p "photo" photo,
            U.p "_id" _id
          ]
  show
    InlineQueryResultSticker
      { sticker = sticker,
        _id = _id
      } =
      "InlineQueryResultSticker"
        ++ U.cc
          [ U.p "sticker" sticker,
            U.p "_id" _id
          ]
  show
    InlineQueryResultVideo
      { description = description,
        title = title,
        video = video,
        _id = _id
      } =
      "InlineQueryResultVideo"
        ++ U.cc
          [ U.p "description" description,
            U.p "title" title,
            U.p "video" video,
            U.p "_id" _id
          ]
  show
    InlineQueryResultVoiceNote
      { title = title,
        voice_note = voice_note,
        _id = _id
      } =
      "InlineQueryResultVoiceNote"
        ++ U.cc
          [ U.p "title" title,
            U.p "voice_note" voice_note,
            U.p "_id" _id
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
      { thumbnail = thumbnail,
        description = description,
        title = title,
        hide_url = hide_url,
        url = url,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultArticle",
          "thumbnail" A..= thumbnail,
          "description" A..= description,
          "title" A..= title,
          "hide_url" A..= hide_url,
          "url" A..= url,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultContact
      { thumbnail = thumbnail,
        contact = contact,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultContact",
          "thumbnail" A..= thumbnail,
          "contact" A..= contact,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultLocation
      { thumbnail = thumbnail,
        title = title,
        location = location,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultLocation",
          "thumbnail" A..= thumbnail,
          "title" A..= title,
          "location" A..= location,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultVenue
      { thumbnail = thumbnail,
        venue = venue,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVenue",
          "thumbnail" A..= thumbnail,
          "venue" A..= venue,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultGame
      { game = game,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultGame",
          "game" A..= game,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultAnimation
      { title = title,
        animation = animation,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultAnimation",
          "title" A..= title,
          "animation" A..= animation,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultAudio
      { audio = audio,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultAudio",
          "audio" A..= audio,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultDocument
      { description = description,
        title = title,
        document = document,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultDocument",
          "description" A..= description,
          "title" A..= title,
          "document" A..= document,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultPhoto
      { description = description,
        title = title,
        photo = photo,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultPhoto",
          "description" A..= description,
          "title" A..= title,
          "photo" A..= photo,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultSticker
      { sticker = sticker,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultSticker",
          "sticker" A..= sticker,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultVideo
      { description = description,
        title = title,
        video = video,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVideo",
          "description" A..= description,
          "title" A..= title,
          "video" A..= video,
          "id" A..= _id
        ]
  toJSON
    InlineQueryResultVoiceNote
      { title = title,
        voice_note = voice_note,
        _id = _id
      } =
      A.object
        [ "@type" A..= T.String "inlineQueryResultVoiceNote",
          "title" A..= title,
          "voice_note" A..= voice_note,
          "id" A..= _id
        ]
