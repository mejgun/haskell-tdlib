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
 -- |
 -- 
 -- Represents a link to an animated GIF or an animated (i.e., without sound) H.264/MPEG-4 AVC video
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the query result
 -- 
 -- __thumbnail_url__ URL of the result thumbnail (JPEG, GIF, or MPEG4), if it exists
 -- 
 -- __thumbnail_mime_type__ MIME type of the video thumbnail. If non-empty, must be one of "image/jpeg", "image/gif" and "video/mp4"
 -- 
 -- __video_url__ The URL of the video file (file size must not exceed 1MB)
 -- 
 -- __video_mime_type__ MIME type of the video file. Must be one of "image/gif" and "video/mp4"
 -- 
 -- __video_duration__ Duration of the video, in seconds
 -- 
 -- __video_width__ Width of the video
 -- 
 -- __video_height__ Height of the video
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAnimation, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultAnimation { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, video_height :: Maybe Int, video_width :: Maybe Int, video_duration :: Maybe Int, video_mime_type :: Maybe String, video_url :: Maybe String, thumbnail_mime_type :: Maybe String, thumbnail_url :: Maybe String, title :: Maybe String, _id :: Maybe String }  |
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
 -- __thumbnail_url__ URL of the result thumbnail, if it exists
 -- 
 -- __thumbnail_width__ Thumbnail width, if known
 -- 
 -- __thumbnail_height__ Thumbnail height, if known
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultArticle { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, hide_url :: Maybe Bool, url :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a link to an MP3 audio file 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the audio file
 -- 
 -- __performer__ Performer of the audio file
 -- 
 -- __audio_url__ The URL of the audio file
 -- 
 -- __audio_duration__ Audio file duration, in seconds
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageAudio, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultAudio { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, audio_duration :: Maybe Int, audio_url :: Maybe String, performer :: Maybe String, title :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a user contact 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __contact__ User contact
 -- 
 -- __thumbnail_url__ URL of the result thumbnail, if it exists
 -- 
 -- __thumbnail_width__ Thumbnail width, if known
 -- 
 -- __thumbnail_height__ Thumbnail height, if known
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultContact { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, contact :: Maybe Contact.Contact, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a link to a file 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the resulting file
 -- 
 -- __param_description__ Short description of the result, if known
 -- 
 -- __document_url__ URL of the file
 -- 
 -- __mime_type__ MIME type of the file content; only "application/pdf" and "application/zip" are currently allowed
 -- 
 -- __thumbnail_url__ The URL of the file thumbnail, if it exists
 -- 
 -- __thumbnail_width__ Width of the thumbnail
 -- 
 -- __thumbnail_height__ Height of the thumbnail
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageDocument, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultDocument { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, mime_type :: Maybe String, document_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a game 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __game_short_name__ Short name of the game
 -- 
 -- __reply_markup__ Message reply markup. Must be of type replyMarkupInlineKeyboard or null
 InputInlineQueryResultGame { reply_markup :: Maybe ReplyMarkup.ReplyMarkup, game_short_name :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a point on the map 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __location__ Location result
 -- 
 -- __live_period__ Amount of time relative to the message sent time until the location can be updated, in seconds
 -- 
 -- __title__ Title of the result
 -- 
 -- __thumbnail_url__ URL of the result thumbnail, if it exists
 -- 
 -- __thumbnail_width__ Thumbnail width, if known
 -- 
 -- __thumbnail_height__ Thumbnail height, if known
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultLocation { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, title :: Maybe String, live_period :: Maybe Int, location :: Maybe Location.Location, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents link to a JPEG image 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the result, if known
 -- 
 -- __param_description__ A short description of the result, if known
 -- 
 -- __thumbnail_url__ URL of the photo thumbnail, if it exists
 -- 
 -- __photo_url__ The URL of the JPEG photo (photo size must not exceed 5MB)
 -- 
 -- __photo_width__ Width of the photo
 -- 
 -- __photo_height__ Height of the photo
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessagePhoto, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultPhoto { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, photo_height :: Maybe Int, photo_width :: Maybe Int, photo_url :: Maybe String, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a link to a WEBP or TGS sticker 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __thumbnail_url__ URL of the sticker thumbnail, if it exists
 -- 
 -- __sticker_url__ The URL of the WEBP or TGS sticker (sticker file size must not exceed 5MB)
 -- 
 -- __sticker_width__ Width of the sticker
 -- 
 -- __sticker_height__ Height of the sticker
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageSticker, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultSticker { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, sticker_height :: Maybe Int, sticker_width :: Maybe Int, sticker_url :: Maybe String, thumbnail_url :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents information about a venue 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __venue__ Venue result
 -- 
 -- __thumbnail_url__ URL of the result thumbnail, if it exists
 -- 
 -- __thumbnail_width__ Thumbnail width, if known
 -- 
 -- __thumbnail_height__ Thumbnail height, if known
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultVenue { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, thumbnail_height :: Maybe Int, thumbnail_width :: Maybe Int, thumbnail_url :: Maybe String, venue :: Maybe Venue.Venue, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a link to a page containing an embedded video player or a video file 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the result
 -- 
 -- __param_description__ A short description of the result, if known
 -- 
 -- __thumbnail_url__ The URL of the video thumbnail (JPEG), if it exists
 -- 
 -- __video_url__ URL of the embedded video player or video file
 -- 
 -- __mime_type__ MIME type of the content of the video URL, only "text/html" or "video/mp4" are currently supported
 -- 
 -- __video_width__ Width of the video
 -- 
 -- __video_height__ Height of the video
 -- 
 -- __video_duration__ Video duration, in seconds
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVideo, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultVideo { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, video_duration :: Maybe Int, video_height :: Maybe Int, video_width :: Maybe Int, mime_type :: Maybe String, video_url :: Maybe String, thumbnail_url :: Maybe String, description :: Maybe String, title :: Maybe String, _id :: Maybe String }  |
 -- |
 -- 
 -- Represents a link to an opus-encoded audio file within an OGG container, single channel audio 
 -- 
 -- __id__ Unique identifier of the query result
 -- 
 -- __title__ Title of the voice note
 -- 
 -- __voice_note_url__ The URL of the voice note file
 -- 
 -- __voice_note_duration__ Duration of the voice note, in seconds
 -- 
 -- __reply_markup__ The message reply markup. Must be of type replyMarkupInlineKeyboard or null
 -- 
 -- __input_message_content__ The content of the message to be sent. Must be one of the following types: inputMessageText, inputMessageVoiceNote, inputMessageInvoice, inputMessageLocation, inputMessageVenue or inputMessageContact
 InputInlineQueryResultVoiceNote { input_message_content :: Maybe InputMessageContent.InputMessageContent, reply_markup :: Maybe ReplyMarkup.ReplyMarkup, voice_note_duration :: Maybe Int, voice_note_url :: Maybe String, title :: Maybe String, _id :: Maybe String }  deriving (Show, Eq)

instance T.ToJSON InputInlineQueryResult where
 toJSON (InputInlineQueryResultAnimation { input_message_content = input_message_content, reply_markup = reply_markup, video_height = video_height, video_width = video_width, video_duration = video_duration, video_mime_type = video_mime_type, video_url = video_url, thumbnail_mime_type = thumbnail_mime_type, thumbnail_url = thumbnail_url, title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "inputInlineQueryResultAnimation", "input_message_content" A..= input_message_content, "reply_markup" A..= reply_markup, "video_height" A..= video_height, "video_width" A..= video_width, "video_duration" A..= video_duration, "video_mime_type" A..= video_mime_type, "video_url" A..= video_url, "thumbnail_mime_type" A..= thumbnail_mime_type, "thumbnail_url" A..= thumbnail_url, "title" A..= title, "id" A..= _id ]

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
   "inputInlineQueryResultAnimation" -> parseInputInlineQueryResultAnimation v
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
   parseInputInlineQueryResultAnimation :: A.Value -> T.Parser InputInlineQueryResult
   parseInputInlineQueryResultAnimation = A.withObject "InputInlineQueryResultAnimation" $ \o -> do
    input_message_content <- o A..:? "input_message_content"
    reply_markup <- o A..:? "reply_markup"
    video_height <- mconcat [ o A..:? "video_height", readMaybe <$> (o A..: "video_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    video_width <- mconcat [ o A..:? "video_width", readMaybe <$> (o A..: "video_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    video_duration <- mconcat [ o A..:? "video_duration", readMaybe <$> (o A..: "video_duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    video_mime_type <- o A..:? "video_mime_type"
    video_url <- o A..:? "video_url"
    thumbnail_mime_type <- o A..:? "thumbnail_mime_type"
    thumbnail_url <- o A..:? "thumbnail_url"
    title <- o A..:? "title"
    _id <- o A..:? "id"
    return $ InputInlineQueryResultAnimation { input_message_content = input_message_content, reply_markup = reply_markup, video_height = video_height, video_width = video_width, video_duration = video_duration, video_mime_type = video_mime_type, video_url = video_url, thumbnail_mime_type = thumbnail_mime_type, thumbnail_url = thumbnail_url, title = title, _id = _id }

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