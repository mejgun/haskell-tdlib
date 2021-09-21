-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InlineQueryResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.Thumbnail as Thumbnail
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.Game as Game
import {-# SOURCE #-} qualified API.Animation as Animation
import {-# SOURCE #-} qualified API.Audio as Audio
import {-# SOURCE #-} qualified API.Document as Document
import {-# SOURCE #-} qualified API.Photo as Photo
import {-# SOURCE #-} qualified API.Sticker as Sticker
import {-# SOURCE #-} qualified API.Video as Video
import {-# SOURCE #-} qualified API.VoiceNote as VoiceNote

-- |
-- 
-- Represents a single result of an inline query
data InlineQueryResult = 
 -- |
 -- 
 -- Represents a link to an article or web page 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __url__ URL of the result, if it exists
 -- 
 -- __hide_url__ True, if the URL must be not shown
 -- 
 -- __title__ Title of the result
 -- 
 -- __param_description__ A short description of the result
 -- 
 -- __thumbnail__ Result thumbnail in JPEG format; may be null
 InlineQueryResultArticle { thumbnail :: Maybe Thumbnail.Thumbnail, description :: Maybe String, title :: Maybe String, hide_url :: Maybe Bool, url :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a user contact 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __contact__ A user contact
 -- 
 -- __thumbnail__ Result thumbnail in JPEG format; may be null
 InlineQueryResultContact { thumbnail :: Maybe Thumbnail.Thumbnail, contact :: Maybe Contact.Contact, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a point on the map 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __location__ Location result
 -- 
 -- __title__ Title of the result
 -- 
 -- __thumbnail__ Result thumbnail in JPEG format; may be null
 InlineQueryResultLocation { thumbnail :: Maybe Thumbnail.Thumbnail, title :: Maybe String, location :: Maybe Location.Location, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents information about a venue 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __venue__ Venue result
 -- 
 -- __thumbnail__ Result thumbnail in JPEG format; may be null
 InlineQueryResultVenue { thumbnail :: Maybe Thumbnail.Thumbnail, venue :: Maybe Venue.Venue, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents information about a game 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __game__ Game result
 InlineQueryResultGame { game :: Maybe Game.Game, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents an animation file 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __animation__ Animation file
 -- 
 -- __title__ Animation title
 InlineQueryResultAnimation { title :: Maybe String, animation :: Maybe Animation.Animation, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents an audio file 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __audio__ Audio file
 InlineQueryResultAudio { audio :: Maybe Audio.Audio, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a document 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __document__ Document
 -- 
 -- __title__ Document title
 -- 
 -- __param_description__ Document description
 InlineQueryResultDocument { description :: Maybe String, title :: Maybe String, document :: Maybe Document.Document, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a photo 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __photo__ Photo
 -- 
 -- __title__ Title of the result, if known
 -- 
 -- __param_description__ A short description of the result, if known
 InlineQueryResultPhoto { description :: Maybe String, title :: Maybe String, photo :: Maybe Photo.Photo, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a sticker 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __sticker__ Sticker
 InlineQueryResultSticker { sticker :: Maybe Sticker.Sticker, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a video 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __video__ Video
 -- 
 -- __title__ Title of the video
 -- 
 -- __param_description__ Description of the video
 InlineQueryResultVideo { description :: Maybe String, title :: Maybe String, video :: Maybe Video.Video, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a voice note 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __voice_note__ Voice note
 -- 
 -- __title__ Title of the voice note
 InlineQueryResultVoiceNote { title :: Maybe String, voice_note :: Maybe VoiceNote.VoiceNote, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InlineQueryResult where
 toJSON (InlineQueryResultArticle { thumbnail = thumbnail, description = description, title = title, hide_url = hide_url, url = url, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultArticle", "thumbnail" A..= thumbnail, "description" A..= description, "title" A..= title, "hide_url" A..= hide_url, "url" A..= url, "id" A..= _id ]

 toJSON (InlineQueryResultContact { thumbnail = thumbnail, contact = contact, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultContact", "thumbnail" A..= thumbnail, "contact" A..= contact, "id" A..= _id ]

 toJSON (InlineQueryResultLocation { thumbnail = thumbnail, title = title, location = location, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultLocation", "thumbnail" A..= thumbnail, "title" A..= title, "location" A..= location, "id" A..= _id ]

 toJSON (InlineQueryResultVenue { thumbnail = thumbnail, venue = venue, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVenue", "thumbnail" A..= thumbnail, "venue" A..= venue, "id" A..= _id ]

 toJSON (InlineQueryResultGame { game = game, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultGame", "game" A..= game, "id" A..= _id ]

 toJSON (InlineQueryResultAnimation { title = title, animation = animation, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultAnimation", "title" A..= title, "animation" A..= animation, "id" A..= _id ]

 toJSON (InlineQueryResultAudio { audio = audio, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultAudio", "audio" A..= audio, "id" A..= _id ]

 toJSON (InlineQueryResultDocument { description = description, title = title, document = document, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultDocument", "description" A..= description, "title" A..= title, "document" A..= document, "id" A..= _id ]

 toJSON (InlineQueryResultPhoto { description = description, title = title, photo = photo, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultPhoto", "description" A..= description, "title" A..= title, "photo" A..= photo, "id" A..= _id ]

 toJSON (InlineQueryResultSticker { sticker = sticker, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultSticker", "sticker" A..= sticker, "id" A..= _id ]

 toJSON (InlineQueryResultVideo { description = description, title = title, video = video, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVideo", "description" A..= description, "title" A..= title, "video" A..= video, "id" A..= _id ]

 toJSON (InlineQueryResultVoiceNote { title = title, voice_note = voice_note, _id = _id }) =
  A.object [ "@type" A..= T.String "inlineQueryResultVoiceNote", "title" A..= title, "voice_note" A..= voice_note, "id" A..= _id ]

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
    thumbnail <- o A..:? "thumbnail"
    description <- o A..:? "description"
    title <- o A..:? "title"
    hide_url <- o A..:? "hide_url"
    url <- o A..:? "url"
    _id <- o A..:? "id"
    return $ InlineQueryResultArticle { thumbnail = thumbnail, description = description, title = title, hide_url = hide_url, url = url, _id = _id }

   parseInlineQueryResultContact :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultContact = A.withObject "InlineQueryResultContact" $ \o -> do
    thumbnail <- o A..:? "thumbnail"
    contact <- o A..:? "contact"
    _id <- o A..:? "id"
    return $ InlineQueryResultContact { thumbnail = thumbnail, contact = contact, _id = _id }

   parseInlineQueryResultLocation :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultLocation = A.withObject "InlineQueryResultLocation" $ \o -> do
    thumbnail <- o A..:? "thumbnail"
    title <- o A..:? "title"
    location <- o A..:? "location"
    _id <- o A..:? "id"
    return $ InlineQueryResultLocation { thumbnail = thumbnail, title = title, location = location, _id = _id }

   parseInlineQueryResultVenue :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultVenue = A.withObject "InlineQueryResultVenue" $ \o -> do
    thumbnail <- o A..:? "thumbnail"
    venue <- o A..:? "venue"
    _id <- o A..:? "id"
    return $ InlineQueryResultVenue { thumbnail = thumbnail, venue = venue, _id = _id }

   parseInlineQueryResultGame :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultGame = A.withObject "InlineQueryResultGame" $ \o -> do
    game <- o A..:? "game"
    _id <- o A..:? "id"
    return $ InlineQueryResultGame { game = game, _id = _id }

   parseInlineQueryResultAnimation :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultAnimation = A.withObject "InlineQueryResultAnimation" $ \o -> do
    title <- o A..:? "title"
    animation <- o A..:? "animation"
    _id <- o A..:? "id"
    return $ InlineQueryResultAnimation { title = title, animation = animation, _id = _id }

   parseInlineQueryResultAudio :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultAudio = A.withObject "InlineQueryResultAudio" $ \o -> do
    audio <- o A..:? "audio"
    _id <- o A..:? "id"
    return $ InlineQueryResultAudio { audio = audio, _id = _id }

   parseInlineQueryResultDocument :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultDocument = A.withObject "InlineQueryResultDocument" $ \o -> do
    description <- o A..:? "description"
    title <- o A..:? "title"
    document <- o A..:? "document"
    _id <- o A..:? "id"
    return $ InlineQueryResultDocument { description = description, title = title, document = document, _id = _id }

   parseInlineQueryResultPhoto :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultPhoto = A.withObject "InlineQueryResultPhoto" $ \o -> do
    description <- o A..:? "description"
    title <- o A..:? "title"
    photo <- o A..:? "photo"
    _id <- o A..:? "id"
    return $ InlineQueryResultPhoto { description = description, title = title, photo = photo, _id = _id }

   parseInlineQueryResultSticker :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultSticker = A.withObject "InlineQueryResultSticker" $ \o -> do
    sticker <- o A..:? "sticker"
    _id <- o A..:? "id"
    return $ InlineQueryResultSticker { sticker = sticker, _id = _id }

   parseInlineQueryResultVideo :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultVideo = A.withObject "InlineQueryResultVideo" $ \o -> do
    description <- o A..:? "description"
    title <- o A..:? "title"
    video <- o A..:? "video"
    _id <- o A..:? "id"
    return $ InlineQueryResultVideo { description = description, title = title, video = video, _id = _id }

   parseInlineQueryResultVoiceNote :: A.Value -> T.Parser InlineQueryResult
   parseInlineQueryResultVoiceNote = A.withObject "InlineQueryResultVoiceNote" $ \o -> do
    title <- o A..:? "title"
    voice_note <- o A..:? "voice_note"
    _id <- o A..:? "id"
    return $ InlineQueryResultVoiceNote { title = title, voice_note = voice_note, _id = _id }