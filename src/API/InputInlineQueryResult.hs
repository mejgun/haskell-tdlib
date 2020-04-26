-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputInlineQueryResult where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

-- |
-- 
-- Represents a single result of an inline query; for bots only
data InputInlineQueryResult = 
 InputInlineQueryResultAnimatedGif { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, gif_height :: Maybe Int, gif_width :: Maybe Int, gif_duration :: Maybe Int, gif_url :: Maybe String, thumbnail_url :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultAnimatedMpeg4 { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, mpeg4_height :: Maybe Int, mpeg4_width :: Maybe Int, mpeg4_duration :: Maybe Int, mpeg4_url :: Maybe String, thumbnail_url :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultArticle { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, hide_url :: Maybe Bool, url :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultAudio { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, audio_duration :: Maybe Int, audio_url :: Maybe String, performer :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultContact { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, contact :: Maybe Contact.Contact, _id :: Maybe String }  
 | InputInlineQueryResultDocument { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, mime_type :: Maybe String, document_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultGame { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, game_short_name :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultLocation { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, title :: Maybe String, live_period :: Maybe Int, location :: Maybe Location.Location, _id :: Maybe String }  
 | InputInlineQueryResultPhoto { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, photo_height :: Maybe Int, photo_width :: Maybe Int, photo_url :: Maybe String, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultSticker { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, sticker_height :: Maybe Int, sticker_width :: Maybe Int, sticker_url :: Maybe String, thumbnail_url :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultVenue { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, venue :: Maybe Venue.Venue, _id :: Maybe String }  
 | InputInlineQueryResultVideo { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, video_duration :: Maybe Int, video_height :: Maybe Int, video_width :: Maybe Int, mime_type :: Maybe String, video_url :: Maybe String, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  
 | InputInlineQueryResultVoiceNote { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, voice_note_duration :: Maybe Int, voice_note_url :: Maybe String, title :: Maybe String, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InputInlineQueryResult where
 toJSON (InputInlineQueryResultAnimatedGif { input_message_content = input_message_content, reply_markup = reply_markup, gif_height = gif_height, gif_width = gif_width, gif_duration = gif_duration, gif_url = gif_url, thumbnail_url = thumbnail_url, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultAnimatedGif", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "gif_height" A..= gif_height, "gif_width" A..= gif_width, "gif_duration" A..= gif_duration, "gif_url" A..= gif_url, "thumbnail_url" A..= thumbnail_url, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultAnimatedMpeg4 { input_message_content = input_message_content, reply_markup = reply_markup, mpeg4_height = mpeg4_height, mpeg4_width = mpeg4_width, mpeg4_duration = mpeg4_duration, mpeg4_url = mpeg4_url, thumbnail_url = thumbnail_url, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultAnimatedMpeg4", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "mpeg4_height" A..= mpeg4_height, "mpeg4_width" A..= mpeg4_width, "mpeg4_duration" A..= mpeg4_duration, "mpeg4_url" A..= mpeg4_url, "thumbnail_url" A..= thumbnail_url, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultArticle { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, description = description, title = title, hide_url = hide_url, url = url, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultArticle", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "thumbnail_height" A..= thumbnail_height, "thumbnail_width" A..= thumbnail_width, "thumbnail_url" A..= thumbnail_url, "description" A..= description, "title" A..= title, "hide_url" A..= hide_url, "url" A..= url, "id" A..= _id ]

 toJSON (InputInlineQueryResultAudio { input_message_content = input_message_content, reply_markup = reply_markup, audio_duration = audio_duration, audio_url = audio_url, performer = performer, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultAudio", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "audio_duration" A..= audio_duration, "audio_url" A..= audio_url, "performer" A..= performer, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultContact { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, contact = contact, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultContact", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "thumbnail_height" A..= thumbnail_height, "thumbnail_width" A..= thumbnail_width, "thumbnail_url" A..= thumbnail_url, "contact" A..= contact, "id" A..= _id ]

 toJSON (InputInlineQueryResultDocument { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, mime_type = mime_type, document_url = document_url, description = description, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultDocument", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "thumbnail_height" A..= thumbnail_height, "thumbnail_width" A..= thumbnail_width, "thumbnail_url" A..= thumbnail_url, "mime_type" A..= mime_type, "document_url" A..= document_url, "description" A..= description, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultGame { reply_markup = reply_markup, game_short_name = game_short_name, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultGame", "reply_markup" A..= reply_markup, "game_short_name" A..= game_short_name, "id" A..= _id ]

 toJSON (InputInlineQueryResultLocation { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, title = title, live_period = live_period, location = location, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultLocation", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "thumbnail_height" A..= thumbnail_height, "thumbnail_width" A..= thumbnail_width, "thumbnail_url" A..= thumbnail_url, "title" A..= title, "live_period" A..= live_period, "location" A..= location, "id" A..= _id ]

 toJSON (InputInlineQueryResultPhoto { input_message_content = input_message_content, reply_markup = reply_markup, photo_height = photo_height, photo_width = photo_width, photo_url = photo_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultPhoto", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "photo_height" A..= photo_height, "photo_width" A..= photo_width, "photo_url" A..= photo_url, "thumbnail_url" A..= thumbnail_url, "description" A..= description, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultSticker { input_message_content = input_message_content, reply_markup = reply_markup, sticker_height = sticker_height, sticker_width = sticker_width, sticker_url = sticker_url, thumbnail_url = thumbnail_url, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultSticker", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "sticker_height" A..= sticker_height, "sticker_width" A..= sticker_width, "sticker_url" A..= sticker_url, "thumbnail_url" A..= thumbnail_url, "id" A..= _id ]

 toJSON (InputInlineQueryResultVenue { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, venue = venue, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultVenue", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "thumbnail_height" A..= thumbnail_height, "thumbnail_width" A..= thumbnail_width, "thumbnail_url" A..= thumbnail_url, "venue" A..= venue, "id" A..= _id ]

 toJSON (InputInlineQueryResultVideo { input_message_content = input_message_content, reply_markup = reply_markup, video_duration = video_duration, video_height = video_height, video_width = video_width, mime_type = mime_type, video_url = video_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultVideo", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "video_duration" A..= video_duration, "video_height" A..= video_height, "video_width" A..= video_width, "mime_type" A..= mime_type, "video_url" A..= video_url, "thumbnail_url" A..= thumbnail_url, "description" A..= description, "title" A..= title, "id" A..= _id ]

 toJSON (InputInlineQueryResultVoiceNote { input_message_content = input_message_content, reply_markup = reply_markup, voice_note_duration = voice_note_duration, voice_note_url = voice_note_url, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultVoiceNote", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "voice_note_duration" A..= voice_note_duration, "voice_note_url" A..= voice_note_url, "title" A..= title, "id" A..= _id ]

instance T.FromJSON InputInlineQueryResult where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputInlineQueryResultAnimatedGif" -> parseInputInlineQueryResultAnimatedGif v
   "inputInlineQueryResultAnimatedMpeg4" -> parseInputInlineQueryResultAnimatedMpeg4 v
   "inputInlineQueryResultArticle" -> parseInputInlineQueryResultArticle v
   "inputInlineQueryResultAudio" -> parseInputInlineQueryResultAudio v
   "inputInlineQueryResultContact" -> parseInputInlineQueryResultContact v
   "inputInlineQueryResultDocument" -> parseInputInlineQueryResultDocument v
   "inputInlineQueryResultGame" -> parseInputInlineQueryResultGame v
   "inputInlineQueryResultLocation" -> parseInputInlineQueryResultLocation v
   "inputInlineQueryResultPhoto" -> parseInputInlineQueryResultPhoto v
   "inputInlineQueryResultSticker" -> parseInputInlineQueryResultSticker v
   "inputInlineQueryResultVenue" -> parseInputInlineQueryResultVenue v
   "inputInlineQueryResultVideo" -> parseInputInlineQueryResultVideo v
   "inputInlineQueryResultVoiceNote" -> parseInputInlineQueryResultVoiceNote v
   _ -> mempty
  where
   parseInputInlineQueryResultAnimatedGif :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAnimatedGif = A.withObject "InputInlineQueryResultAnimatedGif" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    gif_height <- mconcat [ o A..:? "gif_height", readMaybe <$> (o A..: "gif_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    gif_width <- mconcat [ o A..:? "gif_width", readMaybe <$> (o A..: "gif_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    gif_duration <- mconcat [ o A..:? "gif_duration", readMaybe <$> (o A..: "gif_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    gif_url <- o A..:? "gif_url"
    thumbnail_url <- o A..:? "thumbnail_url"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultAnimatedGif { input_message_content = input_message_content, reply_markup = reply_markup, gif_height = gif_height, gif_width = gif_width, gif_duration = gif_duration, gif_url = gif_url, thumbnail_url = thumbnail_url, title = title, _id = _id }

   parseInputInlineQueryResultAnimatedMpeg4 :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAnimatedMpeg4 = A.withObject "InputInlineQueryResultAnimatedMpeg4" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    mpeg4_height <- mconcat [ o A..:? "mpeg4_height", readMaybe <$> (o A..: "mpeg4_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    mpeg4_width <- mconcat [ o A..:? "mpeg4_width", readMaybe <$> (o A..: "mpeg4_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    mpeg4_duration <- mconcat [ o A..:? "mpeg4_duration", readMaybe <$> (o A..: "mpeg4_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    mpeg4_url <- o A..:? "mpeg4_url"
    thumbnail_url <- o A..:? "thumbnail_url"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultAnimatedMpeg4 { input_message_content = input_message_content, reply_markup = reply_markup, mpeg4_height = mpeg4_height, mpeg4_width = mpeg4_width, mpeg4_duration = mpeg4_duration, mpeg4_url = mpeg4_url, thumbnail_url = thumbnail_url, title = title, _id = _id }

   parseInputInlineQueryResultArticle :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultArticle = A.withObject "InputInlineQueryResultArticle" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    thumbnail_height <- mconcat [ o A..:? "thumbnail_height", readMaybe <$> (o A..: "thumbnail_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_width <- mconcat [ o A..:? "thumbnail_width", readMaybe <$> (o A..: "thumbnail_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_url <- o A..:? "thumbnail_url"
    description <- o A..:? "description"
    title <- o A..:? "title"
    hide_url <- o A..:? "hide_url"
    url <- o A..:? "url"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultArticle { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, description = description, title = title, hide_url = hide_url, url = url, _id = _id }

   parseInputInlineQueryResultAudio :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAudio = A.withObject "InputInlineQueryResultAudio" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    audio_duration <- mconcat [ o A..:? "audio_duration", readMaybe <$> (o A..: "audio_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    audio_url <- o A..:? "audio_url"
    performer <- o A..:? "performer"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultAudio { input_message_content = input_message_content, reply_markup = reply_markup, audio_duration = audio_duration, audio_url = audio_url, performer = performer, title = title, _id = _id }

   parseInputInlineQueryResultContact :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultContact = A.withObject "InputInlineQueryResultContact" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    thumbnail_height <- mconcat [ o A..:? "thumbnail_height", readMaybe <$> (o A..: "thumbnail_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_width <- mconcat [ o A..:? "thumbnail_width", readMaybe <$> (o A..: "thumbnail_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_url <- o A..:? "thumbnail_url"
    contact <- o A..:? "contact"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultContact { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, contact = contact, _id = _id }

   parseInputInlineQueryResultDocument :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultDocument = A.withObject "InputInlineQueryResultDocument" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    thumbnail_height <- mconcat [ o A..:? "thumbnail_height", readMaybe <$> (o A..: "thumbnail_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_width <- mconcat [ o A..:? "thumbnail_width", readMaybe <$> (o A..: "thumbnail_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_url <- o A..:? "thumbnail_url"
    mime_type <- o A..:? "mime_type"
    document_url <- o A..:? "document_url"
    description <- o A..:? "description"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultDocument { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, mime_type = mime_type, document_url = document_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultGame :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultGame = A.withObject "InputInlineQueryResultGame" $ \o -> do
    reply_markup <- o A..:? "reply_markup"
    game_short_name <- o A..:? "game_short_name"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultGame { reply_markup = reply_markup, game_short_name = game_short_name, _id = _id }

   parseInputInlineQueryResultLocation :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultLocation = A.withObject "InputInlineQueryResultLocation" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    thumbnail_height <- mconcat [ o A..:? "thumbnail_height", readMaybe <$> (o A..: "thumbnail_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_width <- mconcat [ o A..:? "thumbnail_width", readMaybe <$> (o A..: "thumbnail_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_url <- o A..:? "thumbnail_url"
    title <- o A..:? "title"
    live_period <- mconcat [ o A..:? "live_period", readMaybe <$> (o A..: "live_period" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultLocation { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, title = title, live_period = live_period, location = location, _id = _id }

   parseInputInlineQueryResultPhoto :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultPhoto = A.withObject "InputInlineQueryResultPhoto" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    photo_height <- mconcat [ o A..:? "photo_height", readMaybe <$> (o A..: "photo_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo_width <- mconcat [ o A..:? "photo_width", readMaybe <$> (o A..: "photo_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo_url <- o A..:? "photo_url"
    thumbnail_url <- o A..:? "thumbnail_url"
    description <- o A..:? "description"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultPhoto { input_message_content = input_message_content, reply_markup = reply_markup, photo_height = photo_height, photo_width = photo_width, photo_url = photo_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultSticker :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultSticker = A.withObject "InputInlineQueryResultSticker" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    sticker_height <- mconcat [ o A..:? "sticker_height", readMaybe <$> (o A..: "sticker_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    sticker_width <- mconcat [ o A..:? "sticker_width", readMaybe <$> (o A..: "sticker_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    sticker_url <- o A..:? "sticker_url"
    thumbnail_url <- o A..:? "thumbnail_url"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultSticker { input_message_content = input_message_content, reply_markup = reply_markup, sticker_height = sticker_height, sticker_width = sticker_width, sticker_url = sticker_url, thumbnail_url = thumbnail_url, _id = _id }

   parseInputInlineQueryResultVenue :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVenue = A.withObject "InputInlineQueryResultVenue" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    thumbnail_height <- mconcat [ o A..:? "thumbnail_height", readMaybe <$> (o A..: "thumbnail_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_width <- mconcat [ o A..:? "thumbnail_width", readMaybe <$> (o A..: "thumbnail_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail_url <- o A..:? "thumbnail_url"
    venue <- o A..:? "venue"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultVenue { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, venue = venue, _id = _id }

   parseInputInlineQueryResultVideo :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVideo = A.withObject "InputInlineQueryResultVideo" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    video_duration <- mconcat [ o A..:? "video_duration", readMaybe <$> (o A..: "video_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    video_height <- mconcat [ o A..:? "video_height", readMaybe <$> (o A..: "video_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    video_width <- mconcat [ o A..:? "video_width", readMaybe <$> (o A..: "video_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    mime_type <- o A..:? "mime_type"
    video_url <- o A..:? "video_url"
    thumbnail_url <- o A..:? "thumbnail_url"
    description <- o A..:? "description"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultVideo { input_message_content = input_message_content, reply_markup = reply_markup, video_duration = video_duration, video_height = video_height, video_width = video_width, mime_type = mime_type, video_url = video_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultVoiceNote :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVoiceNote = A.withObject "InputInlineQueryResultVoiceNote" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    voice_note_duration <- mconcat [ o A..:? "voice_note_duration", readMaybe <$> (o A..: "voice_note_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    voice_note_url <- o A..:? "voice_note_url"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultVoiceNote { input_message_content = input_message_content, reply_markup = reply_markup, voice_note_duration = voice_note_duration, voice_note_url = voice_note_url, title = title, _id = _id }