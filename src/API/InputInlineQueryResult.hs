-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputInlineQueryResult where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.InputMessageContent as InputMessageContent
import {-# SOURCE #-} qualified API.ReplyMarkup as ReplyMarkup

data InputInlineQueryResult = 
 InputInlineQueryResultAnimatedGif { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, gif_height :: Int, gif_width :: Int, gif_duration :: Int, gif_url :: String, thumbnail_url :: String, title :: String, _id :: String }  
 | InputInlineQueryResultAnimatedMpeg4 { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, mpeg4_height :: Int, mpeg4_width :: Int, mpeg4_duration :: Int, mpeg4_url :: String, thumbnail_url :: String, title :: String, _id :: String }  
 | InputInlineQueryResultArticle { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, thumbnail_height :: Int, thumbnail_width :: Int, thumbnail_url :: String, description :: String, title :: String, hide_url :: Bool, url :: String, _id :: String }  
 | InputInlineQueryResultAudio { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, audio_duration :: Int, audio_url :: String, performer :: String, title :: String, _id :: String }  
 | InputInlineQueryResultContact { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, thumbnail_height :: Int, thumbnail_width :: Int, thumbnail_url :: String, contact :: Contact.Contact, _id :: String }  
 | InputInlineQueryResultDocument { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, thumbnail_height :: Int, thumbnail_width :: Int, thumbnail_url :: String, mime_type :: String, document_url :: String, description :: String, title :: String, _id :: String }  
 | InputInlineQueryResultGame { reply_markup :: ReplyMarkup.ReplyMarkup, game_short_name :: String, _id :: String }  
 | InputInlineQueryResultLocation { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, thumbnail_height :: Int, thumbnail_width :: Int, thumbnail_url :: String, title :: String, live_period :: Int, location :: Location.Location, _id :: String }  
 | InputInlineQueryResultPhoto { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, photo_height :: Int, photo_width :: Int, photo_url :: String, thumbnail_url :: String, description :: String, title :: String, _id :: String }  
 | InputInlineQueryResultSticker { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, sticker_height :: Int, sticker_width :: Int, sticker_url :: String, thumbnail_url :: String, _id :: String }  
 | InputInlineQueryResultVenue { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, thumbnail_height :: Int, thumbnail_width :: Int, thumbnail_url :: String, venue :: Venue.Venue, _id :: String }  
 | InputInlineQueryResultVideo { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, video_duration :: Int, video_height :: Int, video_width :: Int, mime_type :: String, video_url :: String, thumbnail_url :: String, description :: String, title :: String, _id :: String }  
 | InputInlineQueryResultVoiceNote { input_message_content :: InputMessageContent.InputMessageContent, reply_markup :: ReplyMarkup.ReplyMarkup, voice_note_duration :: Int, voice_note_url :: String, title :: String, _id :: String }  deriving (Show)

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
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    gif_height <- o A..: "gif_height"
    gif_width <- o A..: "gif_width"
    gif_duration <- o A..: "gif_duration"
    gif_url <- o A..: "gif_url"
    thumbnail_url <- o A..: "thumbnail_url"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultAnimatedGif { input_message_content = input_message_content, reply_markup = reply_markup, gif_height = gif_height, gif_width = gif_width, gif_duration = gif_duration, gif_url = gif_url, thumbnail_url = thumbnail_url, title = title, _id = _id }

   parseInputInlineQueryResultAnimatedMpeg4 :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAnimatedMpeg4 = A.withObject "InputInlineQueryResultAnimatedMpeg4" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    mpeg4_height <- o A..: "mpeg4_height"
    mpeg4_width <- o A..: "mpeg4_width"
    mpeg4_duration <- o A..: "mpeg4_duration"
    mpeg4_url <- o A..: "mpeg4_url"
    thumbnail_url <- o A..: "thumbnail_url"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultAnimatedMpeg4 { input_message_content = input_message_content, reply_markup = reply_markup, mpeg4_height = mpeg4_height, mpeg4_width = mpeg4_width, mpeg4_duration = mpeg4_duration, mpeg4_url = mpeg4_url, thumbnail_url = thumbnail_url, title = title, _id = _id }

   parseInputInlineQueryResultArticle :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultArticle = A.withObject "InputInlineQueryResultArticle" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    thumbnail_height <- o A..: "thumbnail_height"
    thumbnail_width <- o A..: "thumbnail_width"
    thumbnail_url <- o A..: "thumbnail_url"
    description <- o A..: "description"
    title <- o A..: "title"
    hide_url <- o A..: "hide_url"
    url <- o A..: "url"
    _id <- o A..: "id"
    return $ InputInlineQueryResultArticle { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, description = description, title = title, hide_url = hide_url, url = url, _id = _id }

   parseInputInlineQueryResultAudio :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAudio = A.withObject "InputInlineQueryResultAudio" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    audio_duration <- o A..: "audio_duration"
    audio_url <- o A..: "audio_url"
    performer <- o A..: "performer"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultAudio { input_message_content = input_message_content, reply_markup = reply_markup, audio_duration = audio_duration, audio_url = audio_url, performer = performer, title = title, _id = _id }

   parseInputInlineQueryResultContact :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultContact = A.withObject "InputInlineQueryResultContact" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    thumbnail_height <- o A..: "thumbnail_height"
    thumbnail_width <- o A..: "thumbnail_width"
    thumbnail_url <- o A..: "thumbnail_url"
    contact <- o A..: "contact"
    _id <- o A..: "id"
    return $ InputInlineQueryResultContact { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, contact = contact, _id = _id }

   parseInputInlineQueryResultDocument :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultDocument = A.withObject "InputInlineQueryResultDocument" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    thumbnail_height <- o A..: "thumbnail_height"
    thumbnail_width <- o A..: "thumbnail_width"
    thumbnail_url <- o A..: "thumbnail_url"
    mime_type <- o A..: "mime_type"
    document_url <- o A..: "document_url"
    description <- o A..: "description"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultDocument { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, mime_type = mime_type, document_url = document_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultGame :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultGame = A.withObject "InputInlineQueryResultGame" $ \o -> do
    reply_markup <- o A..: "reply_markup"
    game_short_name <- o A..: "game_short_name"
    _id <- o A..: "id"
    return $ InputInlineQueryResultGame { reply_markup = reply_markup, game_short_name = game_short_name, _id = _id }

   parseInputInlineQueryResultLocation :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultLocation = A.withObject "InputInlineQueryResultLocation" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    thumbnail_height <- o A..: "thumbnail_height"
    thumbnail_width <- o A..: "thumbnail_width"
    thumbnail_url <- o A..: "thumbnail_url"
    title <- o A..: "title"
    live_period <- o A..: "live_period"
    location <- o A..: "location"
    _id <- o A..: "id"
    return $ InputInlineQueryResultLocation { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, title = title, live_period = live_period, location = location, _id = _id }

   parseInputInlineQueryResultPhoto :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultPhoto = A.withObject "InputInlineQueryResultPhoto" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    photo_height <- o A..: "photo_height"
    photo_width <- o A..: "photo_width"
    photo_url <- o A..: "photo_url"
    thumbnail_url <- o A..: "thumbnail_url"
    description <- o A..: "description"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultPhoto { input_message_content = input_message_content, reply_markup = reply_markup, photo_height = photo_height, photo_width = photo_width, photo_url = photo_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultSticker :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultSticker = A.withObject "InputInlineQueryResultSticker" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    sticker_height <- o A..: "sticker_height"
    sticker_width <- o A..: "sticker_width"
    sticker_url <- o A..: "sticker_url"
    thumbnail_url <- o A..: "thumbnail_url"
    _id <- o A..: "id"
    return $ InputInlineQueryResultSticker { input_message_content = input_message_content, reply_markup = reply_markup, sticker_height = sticker_height, sticker_width = sticker_width, sticker_url = sticker_url, thumbnail_url = thumbnail_url, _id = _id }

   parseInputInlineQueryResultVenue :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVenue = A.withObject "InputInlineQueryResultVenue" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    thumbnail_height <- o A..: "thumbnail_height"
    thumbnail_width <- o A..: "thumbnail_width"
    thumbnail_url <- o A..: "thumbnail_url"
    venue <- o A..: "venue"
    _id <- o A..: "id"
    return $ InputInlineQueryResultVenue { input_message_content = input_message_content, reply_markup = reply_markup, thumbnail_height = thumbnail_height, thumbnail_width = thumbnail_width, thumbnail_url = thumbnail_url, venue = venue, _id = _id }

   parseInputInlineQueryResultVideo :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVideo = A.withObject "InputInlineQueryResultVideo" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    video_duration <- o A..: "video_duration"
    video_height <- o A..: "video_height"
    video_width <- o A..: "video_width"
    mime_type <- o A..: "mime_type"
    video_url <- o A..: "video_url"
    thumbnail_url <- o A..: "thumbnail_url"
    description <- o A..: "description"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultVideo { input_message_content = input_message_content, reply_markup = reply_markup, video_duration = video_duration, video_height = video_height, video_width = video_width, mime_type = mime_type, video_url = video_url, thumbnail_url = thumbnail_url, description = description, title = title, _id = _id }

   parseInputInlineQueryResultVoiceNote :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultVoiceNote = A.withObject "InputInlineQueryResultVoiceNote" $ \o -> do
    input_message_content <- o A..: "input_message_content"
    reply_markup <- o A..: "reply_markup"
    voice_note_duration <- o A..: "voice_note_duration"
    voice_note_url <- o A..: "voice_note_url"
    title <- o A..: "title"
    _id <- o A..: "id"
    return $ InputInlineQueryResultVoiceNote { input_message_content = input_message_content, reply_markup = reply_markup, voice_note_duration = voice_note_duration, voice_note_url = voice_note_url, title = title, _id = _id }