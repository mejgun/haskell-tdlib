-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputMessageContent where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputThumbnail as InputThumbnail
import {-# SOURCE #-} qualified API.FormattedText as FormattedText
import {-# SOURCE #-} qualified API.InputFile as InputFile
import {-# SOURCE #-} qualified API.Location as Location
import {-# SOURCE #-} qualified API.Venue as Venue
import {-# SOURCE #-} qualified API.Contact as Contact
import {-# SOURCE #-} qualified API.Invoice as Invoice
import {-# SOURCE #-} qualified API.PollType as PollType

-- |
-- 
-- The content of a message to send
data InputMessageContent = 
 -- |
 -- 
 -- A text message 
 -- 
 -- __text__ Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
 -- 
 -- __disable_web_page_preview__ True, if rich web page previews for URLs in the message text should be disabled
 -- 
 -- __clear_draft__ True, if a chat message draft should be deleted
 InputMessageText { clear_draft :: Maybe Bool, disable_web_page_preview :: Maybe Bool, text :: Maybe FormattedText.FormattedText }  |
 -- |
 -- 
 -- An animation message (GIF-style). 
 -- 
 -- __animation__ Animation file to be sent
 -- 
 -- __thumbnail__ Animation thumbnail, if available
 -- 
 -- __duration__ Duration of the animation, in seconds
 -- 
 -- __width__ Width of the animation; may be replaced by the server
 -- 
 -- __height__ Height of the animation; may be replaced by the server
 -- 
 -- __caption__ Animation caption; 0-GetOption("message_caption_length_max") characters
 InputMessageAnimation { caption :: Maybe FormattedText.FormattedText, height :: Maybe Int, width :: Maybe Int, duration :: Maybe Int, thumbnail :: Maybe InputThumbnail.InputThumbnail, animation :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- An audio message 
 -- 
 -- __audio__ Audio file to be sent
 -- 
 -- __album_cover_thumbnail__ Thumbnail of the cover for the album, if available
 -- 
 -- __duration__ Duration of the audio, in seconds; may be replaced by the server
 -- 
 -- __title__ Title of the audio; 0-64 characters; may be replaced by the server
 -- 
 -- __performer__ Performer of the audio; 0-64 characters, may be replaced by the server
 -- 
 -- __caption__ Audio caption; 0-GetOption("message_caption_length_max") characters
 InputMessageAudio { caption :: Maybe FormattedText.FormattedText, performer :: Maybe String, title :: Maybe String, duration :: Maybe Int, album_cover_thumbnail :: Maybe InputThumbnail.InputThumbnail, audio :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A document message (general file) 
 -- 
 -- __document__ Document to be sent
 -- 
 -- __thumbnail__ Document thumbnail, if available
 -- 
 -- __caption__ Document caption; 0-GetOption("message_caption_length_max") characters
 InputMessageDocument { caption :: Maybe FormattedText.FormattedText, thumbnail :: Maybe InputThumbnail.InputThumbnail, document :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A photo message 
 -- 
 -- __photo__ Photo to send
 -- 
 -- __thumbnail__ Photo thumbnail to be sent, this is sent to the other party in secret chats only
 -- 
 -- __added_sticker_file_ids__ File identifiers of the stickers added to the photo, if applicable
 -- 
 -- __width__ Photo width
 -- 
 -- __height__ Photo height
 -- 
 -- __caption__ Photo caption; 0-GetOption("message_caption_length_max") characters
 -- 
 -- __ttl__ Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
 InputMessagePhoto { ttl :: Maybe Int, caption :: Maybe FormattedText.FormattedText, height :: Maybe Int, width :: Maybe Int, added_sticker_file_ids :: Maybe [Int], thumbnail :: Maybe InputThumbnail.InputThumbnail, photo :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A sticker message 
 -- 
 -- __sticker__ Sticker to be sent
 -- 
 -- __thumbnail__ Sticker thumbnail, if available
 -- 
 -- __width__ Sticker width
 -- 
 -- __height__ Sticker height
 InputMessageSticker { height :: Maybe Int, width :: Maybe Int, thumbnail :: Maybe InputThumbnail.InputThumbnail, sticker :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A video message 
 -- 
 -- __video__ Video to be sent
 -- 
 -- __thumbnail__ Video thumbnail, if available
 -- 
 -- __added_sticker_file_ids__ File identifiers of the stickers added to the video, if applicable
 -- 
 -- __duration__ Duration of the video, in seconds
 -- 
 -- __width__ Video width
 -- 
 -- __height__ Video height
 -- 
 -- __supports_streaming__ True, if the video should be tried to be streamed
 -- 
 -- __caption__ Video caption; 0-GetOption("message_caption_length_max") characters
 -- 
 -- __ttl__ Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
 InputMessageVideo { ttl :: Maybe Int, caption :: Maybe FormattedText.FormattedText, supports_streaming :: Maybe Bool, height :: Maybe Int, width :: Maybe Int, duration :: Maybe Int, added_sticker_file_ids :: Maybe [Int], thumbnail :: Maybe InputThumbnail.InputThumbnail, video :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A video note message 
 -- 
 -- __video_note__ Video note to be sent
 -- 
 -- __thumbnail__ Video thumbnail, if available
 -- 
 -- __duration__ Duration of the video, in seconds
 -- 
 -- __length__ Video width and height; must be positive and not greater than 640
 InputMessageVideoNote { _length :: Maybe Int, duration :: Maybe Int, thumbnail :: Maybe InputThumbnail.InputThumbnail, video_note :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A voice note message 
 -- 
 -- __voice_note__ Voice note to be sent
 -- 
 -- __duration__ Duration of the voice note, in seconds
 -- 
 -- __waveform__ Waveform representation of the voice note, in 5-bit format
 -- 
 -- __caption__ Voice note caption; 0-GetOption("message_caption_length_max") characters
 InputMessageVoiceNote { caption :: Maybe FormattedText.FormattedText, waveform :: Maybe String, duration :: Maybe Int, voice_note :: Maybe InputFile.InputFile }  |
 -- |
 -- 
 -- A message with a location 
 -- 
 -- __location__ Location to be sent
 -- 
 -- __live_period__ Period for which the location can be updated, in seconds; should be between 60 and 86400 for a live location and 0 otherwise
 InputMessageLocation { live_period :: Maybe Int, location :: Maybe Location.Location }  |
 -- |
 -- 
 -- A message with information about a venue 
 -- 
 -- __venue__ Venue to send
 InputMessageVenue { venue :: Maybe Venue.Venue }  |
 -- |
 -- 
 -- A message containing a user contact 
 -- 
 -- __contact__ Contact to send
 InputMessageContact { contact :: Maybe Contact.Contact }  |
 -- |
 -- 
 -- A dice message 
 -- 
 -- __emoji__ Emoji on which the dice throw animation is based
 -- 
 -- __clear_draft__ True, if a chat message draft should be deleted
 InputMessageDice { clear_draft :: Maybe Bool, emoji :: Maybe String }  |
 -- |
 -- 
 -- A message with a game; not supported for channels or secret chats 
 -- 
 -- __bot_user_id__ User identifier of the bot that owns the game
 -- 
 -- __game_short_name__ Short name of the game
 InputMessageGame { game_short_name :: Maybe String, bot_user_id :: Maybe Int }  |
 -- |
 -- 
 -- A message with an invoice; can be used only by bots and only in private chats 
 -- 
 -- __invoice__ Invoice
 -- 
 -- __title__ Product title; 1-32 characters
 -- 
 -- __param_description__ Product description; 0-255 characters
 -- 
 -- __photo_url__ Product photo URL; optional
 -- 
 -- __photo_size__ Product photo size
 -- 
 -- __photo_width__ Product photo width
 -- 
 -- __photo_height__ Product photo height
 -- 
 -- __payload__ The invoice payload
 -- 
 -- __provider_token__ Payment provider token
 -- 
 -- __provider_data__ JSON-encoded data about the invoice, which will be shared with the payment provider
 -- 
 -- __start_parameter__ Unique invoice bot start_parameter for the generation of this invoice
 InputMessageInvoice { start_parameter :: Maybe String, provider_data :: Maybe String, provider_token :: Maybe String, payload :: Maybe String, photo_height :: Maybe Int, photo_width :: Maybe Int, photo_size :: Maybe Int, photo_url :: Maybe String, description :: Maybe String, title :: Maybe String, invoice :: Maybe Invoice.Invoice }  |
 -- |
 -- 
 -- A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot 
 -- 
 -- __question__ Poll question, 1-255 characters
 -- 
 -- __options__ List of poll answer options, 2-10 strings 1-100 characters each
 -- 
 -- __is_anonymous__ True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
 -- 
 -- __type__ Type of the poll
 -- 
 -- __open_period__ Amount of time the poll will be active after creation, in seconds; for bots only
 -- 
 -- __close_date__ Point in time (Unix timestamp) when the poll will be automatically closed; for bots only
 -- 
 -- __is_closed__ True, if the poll needs to be sent already closed; for bots only
 InputMessagePoll { is_closed :: Maybe Bool, close_date :: Maybe Int, open_period :: Maybe Int, _type :: Maybe PollType.PollType, is_anonymous :: Maybe Bool, options :: Maybe [String], question :: Maybe String }  |
 -- |
 -- 
 -- A forwarded message 
 -- 
 -- __from_chat_id__ Identifier for the chat this forwarded message came from
 -- 
 -- __message_id__ Identifier of the message to forward
 -- 
 -- __in_game_share__ True, if a game message should be shared within a launched game; applies only to game messages
 -- 
 -- __send_copy__ True, if content of the message needs to be copied without a link to the original message. Always true if the message is forwarded to a secret chat
 -- 
 -- __remove_caption__ True, if media caption of the message copy needs to be removed. Ignored if send_copy is false
 InputMessageForwarded { remove_caption :: Maybe Bool, send_copy :: Maybe Bool, in_game_share :: Maybe Bool, message_id :: Maybe Int, from_chat_id :: Maybe Int }  deriving (Show, Eq)

instance T.ToJSON InputMessageContent where
 toJSON (InputMessageText { clear_draft = clear_draft, disable_web_page_preview = disable_web_page_preview, text = text }) =
  A.object [ "@type" A..= T.String "inputMessageText", "clear_draft" A..= clear_draft, "disable_web_page_preview" A..= disable_web_page_preview, "text" A..= text ]

 toJSON (InputMessageAnimation { caption = caption, height = height, width = width, duration = duration, thumbnail = thumbnail, animation = animation }) =
  A.object [ "@type" A..= T.String "inputMessageAnimation", "caption" A..= caption, "height" A..= height, "width" A..= width, "duration" A..= duration, "thumbnail" A..= thumbnail, "animation" A..= animation ]

 toJSON (InputMessageAudio { caption = caption, performer = performer, title = title, duration = duration, album_cover_thumbnail = album_cover_thumbnail, audio = audio }) =
  A.object [ "@type" A..= T.String "inputMessageAudio", "caption" A..= caption, "performer" A..= performer, "title" A..= title, "duration" A..= duration, "album_cover_thumbnail" A..= album_cover_thumbnail, "audio" A..= audio ]

 toJSON (InputMessageDocument { caption = caption, thumbnail = thumbnail, document = document }) =
  A.object [ "@type" A..= T.String "inputMessageDocument", "caption" A..= caption, "thumbnail" A..= thumbnail, "document" A..= document ]

 toJSON (InputMessagePhoto { ttl = ttl, caption = caption, height = height, width = width, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, photo = photo }) =
  A.object [ "@type" A..= T.String "inputMessagePhoto", "ttl" A..= ttl, "caption" A..= caption, "height" A..= height, "width" A..= width, "added_sticker_file_ids" A..= added_sticker_file_ids, "thumbnail" A..= thumbnail, "photo" A..= photo ]

 toJSON (InputMessageSticker { height = height, width = width, thumbnail = thumbnail, sticker = sticker }) =
  A.object [ "@type" A..= T.String "inputMessageSticker", "height" A..= height, "width" A..= width, "thumbnail" A..= thumbnail, "sticker" A..= sticker ]

 toJSON (InputMessageVideo { ttl = ttl, caption = caption, supports_streaming = supports_streaming, height = height, width = width, duration = duration, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, video = video }) =
  A.object [ "@type" A..= T.String "inputMessageVideo", "ttl" A..= ttl, "caption" A..= caption, "supports_streaming" A..= supports_streaming, "height" A..= height, "width" A..= width, "duration" A..= duration, "added_sticker_file_ids" A..= added_sticker_file_ids, "thumbnail" A..= thumbnail, "video" A..= video ]

 toJSON (InputMessageVideoNote { _length = _length, duration = duration, thumbnail = thumbnail, video_note = video_note }) =
  A.object [ "@type" A..= T.String "inputMessageVideoNote", "length" A..= _length, "duration" A..= duration, "thumbnail" A..= thumbnail, "video_note" A..= video_note ]

 toJSON (InputMessageVoiceNote { caption = caption, waveform = waveform, duration = duration, voice_note = voice_note }) =
  A.object [ "@type" A..= T.String "inputMessageVoiceNote", "caption" A..= caption, "waveform" A..= waveform, "duration" A..= duration, "voice_note" A..= voice_note ]

 toJSON (InputMessageLocation { live_period = live_period, location = location }) =
  A.object [ "@type" A..= T.String "inputMessageLocation", "live_period" A..= live_period, "location" A..= location ]

 toJSON (InputMessageVenue { venue = venue }) =
  A.object [ "@type" A..= T.String "inputMessageVenue", "venue" A..= venue ]

 toJSON (InputMessageContact { contact = contact }) =
  A.object [ "@type" A..= T.String "inputMessageContact", "contact" A..= contact ]

 toJSON (InputMessageDice { clear_draft = clear_draft, emoji = emoji }) =
  A.object [ "@type" A..= T.String "inputMessageDice", "clear_draft" A..= clear_draft, "emoji" A..= emoji ]

 toJSON (InputMessageGame { game_short_name = game_short_name, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "inputMessageGame", "game_short_name" A..= game_short_name, "bot_user_id" A..= bot_user_id ]

 toJSON (InputMessageInvoice { start_parameter = start_parameter, provider_data = provider_data, provider_token = provider_token, payload = payload, photo_height = photo_height, photo_width = photo_width, photo_size = photo_size, photo_url = photo_url, description = description, title = title, invoice = invoice }) =
  A.object [ "@type" A..= T.String "inputMessageInvoice", "start_parameter" A..= start_parameter, "provider_data" A..= provider_data, "provider_token" A..= provider_token, "payload" A..= payload, "photo_height" A..= photo_height, "photo_width" A..= photo_width, "photo_size" A..= photo_size, "photo_url" A..= photo_url, "description" A..= description, "title" A..= title, "invoice" A..= invoice ]

 toJSON (InputMessagePoll { is_closed = is_closed, close_date = close_date, open_period = open_period, _type = _type, is_anonymous = is_anonymous, options = options, question = question }) =
  A.object [ "@type" A..= T.String "inputMessagePoll", "is_closed" A..= is_closed, "close_date" A..= close_date, "open_period" A..= open_period, "type" A..= _type, "is_anonymous" A..= is_anonymous, "options" A..= options, "question" A..= question ]

 toJSON (InputMessageForwarded { remove_caption = remove_caption, send_copy = send_copy, in_game_share = in_game_share, message_id = message_id, from_chat_id = from_chat_id }) =
  A.object [ "@type" A..= T.String "inputMessageForwarded", "remove_caption" A..= remove_caption, "send_copy" A..= send_copy, "in_game_share" A..= in_game_share, "message_id" A..= message_id, "from_chat_id" A..= from_chat_id ]

instance T.FromJSON InputMessageContent where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "inputMessageText" -> parseInputMessageText v
   "inputMessageAnimation" -> parseInputMessageAnimation v
   "inputMessageAudio" -> parseInputMessageAudio v
   "inputMessageDocument" -> parseInputMessageDocument v
   "inputMessagePhoto" -> parseInputMessagePhoto v
   "inputMessageSticker" -> parseInputMessageSticker v
   "inputMessageVideo" -> parseInputMessageVideo v
   "inputMessageVideoNote" -> parseInputMessageVideoNote v
   "inputMessageVoiceNote" -> parseInputMessageVoiceNote v
   "inputMessageLocation" -> parseInputMessageLocation v
   "inputMessageVenue" -> parseInputMessageVenue v
   "inputMessageContact" -> parseInputMessageContact v
   "inputMessageDice" -> parseInputMessageDice v
   "inputMessageGame" -> parseInputMessageGame v
   "inputMessageInvoice" -> parseInputMessageInvoice v
   "inputMessagePoll" -> parseInputMessagePoll v
   "inputMessageForwarded" -> parseInputMessageForwarded v
   _ -> mempty
  where
   parseInputMessageText :: A.Value -> T.Parser InputMessageContent
   parseInputMessageText = A.withObject "InputMessageText" $ \o -> do
    clear_draft <- o A..:? "clear_draft"
    disable_web_page_preview <- o A..:? "disable_web_page_preview"
    text <- o A..:? "text"
    return $ InputMessageText { clear_draft = clear_draft, disable_web_page_preview = disable_web_page_preview, text = text }

   parseInputMessageAnimation :: A.Value -> T.Parser InputMessageContent
   parseInputMessageAnimation = A.withObject "InputMessageAnimation" $ \o -> do
    caption <- o A..:? "caption"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail <- o A..:? "thumbnail"
    animation <- o A..:? "animation"
    return $ InputMessageAnimation { caption = caption, height = height, width = width, duration = duration, thumbnail = thumbnail, animation = animation }

   parseInputMessageAudio :: A.Value -> T.Parser InputMessageContent
   parseInputMessageAudio = A.withObject "InputMessageAudio" $ \o -> do
    caption <- o A..:? "caption"
    performer <- o A..:? "performer"
    title <- o A..:? "title"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    album_cover_thumbnail <- o A..:? "album_cover_thumbnail"
    audio <- o A..:? "audio"
    return $ InputMessageAudio { caption = caption, performer = performer, title = title, duration = duration, album_cover_thumbnail = album_cover_thumbnail, audio = audio }

   parseInputMessageDocument :: A.Value -> T.Parser InputMessageContent
   parseInputMessageDocument = A.withObject "InputMessageDocument" $ \o -> do
    caption <- o A..:? "caption"
    thumbnail <- o A..:? "thumbnail"
    document <- o A..:? "document"
    return $ InputMessageDocument { caption = caption, thumbnail = thumbnail, document = document }

   parseInputMessagePhoto :: A.Value -> T.Parser InputMessageContent
   parseInputMessagePhoto = A.withObject "InputMessagePhoto" $ \o -> do
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    caption <- o A..:? "caption"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    added_sticker_file_ids <- o A..:? "added_sticker_file_ids"
    thumbnail <- o A..:? "thumbnail"
    photo <- o A..:? "photo"
    return $ InputMessagePhoto { ttl = ttl, caption = caption, height = height, width = width, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, photo = photo }

   parseInputMessageSticker :: A.Value -> T.Parser InputMessageContent
   parseInputMessageSticker = A.withObject "InputMessageSticker" $ \o -> do
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail <- o A..:? "thumbnail"
    sticker <- o A..:? "sticker"
    return $ InputMessageSticker { height = height, width = width, thumbnail = thumbnail, sticker = sticker }

   parseInputMessageVideo :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVideo = A.withObject "InputMessageVideo" $ \o -> do
    ttl <- mconcat [ o A..:? "ttl", readMaybe <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
    caption <- o A..:? "caption"
    supports_streaming <- o A..:? "supports_streaming"
    height <- mconcat [ o A..:? "height", readMaybe <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
    width <- mconcat [ o A..:? "width", readMaybe <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    added_sticker_file_ids <- o A..:? "added_sticker_file_ids"
    thumbnail <- o A..:? "thumbnail"
    video <- o A..:? "video"
    return $ InputMessageVideo { ttl = ttl, caption = caption, supports_streaming = supports_streaming, height = height, width = width, duration = duration, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, video = video }

   parseInputMessageVideoNote :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVideoNote = A.withObject "InputMessageVideoNote" $ \o -> do
    _length <- mconcat [ o A..:? "length", readMaybe <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    thumbnail <- o A..:? "thumbnail"
    video_note <- o A..:? "video_note"
    return $ InputMessageVideoNote { _length = _length, duration = duration, thumbnail = thumbnail, video_note = video_note }

   parseInputMessageVoiceNote :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVoiceNote = A.withObject "InputMessageVoiceNote" $ \o -> do
    caption <- o A..:? "caption"
    waveform <- o A..:? "waveform"
    duration <- mconcat [ o A..:? "duration", readMaybe <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
    voice_note <- o A..:? "voice_note"
    return $ InputMessageVoiceNote { caption = caption, waveform = waveform, duration = duration, voice_note = voice_note }

   parseInputMessageLocation :: A.Value -> T.Parser InputMessageContent
   parseInputMessageLocation = A.withObject "InputMessageLocation" $ \o -> do
    live_period <- mconcat [ o A..:? "live_period", readMaybe <$> (o A..: "live_period" :: T.Parser String)] :: T.Parser (Maybe Int)
    location <- o A..:? "location"
    return $ InputMessageLocation { live_period = live_period, location = location }

   parseInputMessageVenue :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVenue = A.withObject "InputMessageVenue" $ \o -> do
    venue <- o A..:? "venue"
    return $ InputMessageVenue { venue = venue }

   parseInputMessageContact :: A.Value -> T.Parser InputMessageContent
   parseInputMessageContact = A.withObject "InputMessageContact" $ \o -> do
    contact <- o A..:? "contact"
    return $ InputMessageContact { contact = contact }

   parseInputMessageDice :: A.Value -> T.Parser InputMessageContent
   parseInputMessageDice = A.withObject "InputMessageDice" $ \o -> do
    clear_draft <- o A..:? "clear_draft"
    emoji <- o A..:? "emoji"
    return $ InputMessageDice { clear_draft = clear_draft, emoji = emoji }

   parseInputMessageGame :: A.Value -> T.Parser InputMessageContent
   parseInputMessageGame = A.withObject "InputMessageGame" $ \o -> do
    game_short_name <- o A..:? "game_short_name"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InputMessageGame { game_short_name = game_short_name, bot_user_id = bot_user_id }

   parseInputMessageInvoice :: A.Value -> T.Parser InputMessageContent
   parseInputMessageInvoice = A.withObject "InputMessageInvoice" $ \o -> do
    start_parameter <- o A..:? "start_parameter"
    provider_data <- o A..:? "provider_data"
    provider_token <- o A..:? "provider_token"
    payload <- o A..:? "payload"
    photo_height <- mconcat [ o A..:? "photo_height", readMaybe <$> (o A..: "photo_height" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo_width <- mconcat [ o A..:? "photo_width", readMaybe <$> (o A..: "photo_width" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo_size <- mconcat [ o A..:? "photo_size", readMaybe <$> (o A..: "photo_size" :: T.Parser String)] :: T.Parser (Maybe Int)
    photo_url <- o A..:? "photo_url"
    description <- o A..:? "description"
    title <- o A..:? "title"
    invoice <- o A..:? "invoice"
    return $ InputMessageInvoice { start_parameter = start_parameter, provider_data = provider_data, provider_token = provider_token, payload = payload, photo_height = photo_height, photo_width = photo_width, photo_size = photo_size, photo_url = photo_url, description = description, title = title, invoice = invoice }

   parseInputMessagePoll :: A.Value -> T.Parser InputMessageContent
   parseInputMessagePoll = A.withObject "InputMessagePoll" $ \o -> do
    is_closed <- o A..:? "is_closed"
    close_date <- mconcat [ o A..:? "close_date", readMaybe <$> (o A..: "close_date" :: T.Parser String)] :: T.Parser (Maybe Int)
    open_period <- mconcat [ o A..:? "open_period", readMaybe <$> (o A..: "open_period" :: T.Parser String)] :: T.Parser (Maybe Int)
    _type <- o A..:? "type"
    is_anonymous <- o A..:? "is_anonymous"
    options <- o A..:? "options"
    question <- o A..:? "question"
    return $ InputMessagePoll { is_closed = is_closed, close_date = close_date, open_period = open_period, _type = _type, is_anonymous = is_anonymous, options = options, question = question }

   parseInputMessageForwarded :: A.Value -> T.Parser InputMessageContent
   parseInputMessageForwarded = A.withObject "InputMessageForwarded" $ \o -> do
    remove_caption <- o A..:? "remove_caption"
    send_copy <- o A..:? "send_copy"
    in_game_share <- o A..:? "in_game_share"
    message_id <- mconcat [ o A..:? "message_id", readMaybe <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    from_chat_id <- mconcat [ o A..:? "from_chat_id", readMaybe <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ InputMessageForwarded { remove_caption = remove_caption, send_copy = send_copy, in_game_share = in_game_share, message_id = message_id, from_chat_id = from_chat_id }