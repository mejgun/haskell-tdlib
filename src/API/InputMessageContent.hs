-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.InputMessageContent where

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

--main = putStrLn "ok"

data InputMessageContent = 
 InputMessageText { clear_draft :: Bool, disable_web_page_preview :: Bool, text :: FormattedText.FormattedText }  
 | InputMessageAnimation { caption :: FormattedText.FormattedText, height :: Int, width :: Int, duration :: Int, thumbnail :: InputThumbnail.InputThumbnail, animation :: InputFile.InputFile }  
 | InputMessageAudio { caption :: FormattedText.FormattedText, performer :: String, title :: String, duration :: Int, album_cover_thumbnail :: InputThumbnail.InputThumbnail, audio :: InputFile.InputFile }  
 | InputMessageDocument { caption :: FormattedText.FormattedText, thumbnail :: InputThumbnail.InputThumbnail, document :: InputFile.InputFile }  
 | InputMessagePhoto { ttl :: Int, caption :: FormattedText.FormattedText, height :: Int, width :: Int, added_sticker_file_ids :: [Int], thumbnail :: InputThumbnail.InputThumbnail, photo :: InputFile.InputFile }  
 | InputMessageSticker { height :: Int, width :: Int, thumbnail :: InputThumbnail.InputThumbnail, sticker :: InputFile.InputFile }  
 | InputMessageVideo { ttl :: Int, caption :: FormattedText.FormattedText, supports_streaming :: Bool, height :: Int, width :: Int, duration :: Int, added_sticker_file_ids :: [Int], thumbnail :: InputThumbnail.InputThumbnail, video :: InputFile.InputFile }  
 | InputMessageVideoNote { _length :: Int, duration :: Int, thumbnail :: InputThumbnail.InputThumbnail, video_note :: InputFile.InputFile }  
 | InputMessageVoiceNote { caption :: FormattedText.FormattedText, waveform :: String, duration :: Int, voice_note :: InputFile.InputFile }  
 | InputMessageLocation { live_period :: Int, location :: Location.Location }  
 | InputMessageVenue { venue :: Venue.Venue }  
 | InputMessageContact { contact :: Contact.Contact }  
 | InputMessageDice 
 | InputMessageGame { game_short_name :: String, bot_user_id :: Int }  
 | InputMessageInvoice { start_parameter :: String, provider_data :: String, provider_token :: String, payload :: String, photo_height :: Int, photo_width :: Int, photo_size :: Int, photo_url :: String, description :: String, title :: String, invoice :: Invoice.Invoice }  
 | InputMessagePoll { is_closed :: Bool, _type :: PollType.PollType, is_anonymous :: Bool, options :: [String], question :: String }  
 | InputMessageForwarded { remove_caption :: Bool, send_copy :: Bool, in_game_share :: Bool, message_id :: Int, from_chat_id :: Int }  deriving (Show)

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

 toJSON (InputMessageDice {  }) =
  A.object [ "@type" A..= T.String "inputMessageDice" ]

 toJSON (InputMessageGame { game_short_name = game_short_name, bot_user_id = bot_user_id }) =
  A.object [ "@type" A..= T.String "inputMessageGame", "game_short_name" A..= game_short_name, "bot_user_id" A..= bot_user_id ]

 toJSON (InputMessageInvoice { start_parameter = start_parameter, provider_data = provider_data, provider_token = provider_token, payload = payload, photo_height = photo_height, photo_width = photo_width, photo_size = photo_size, photo_url = photo_url, description = description, title = title, invoice = invoice }) =
  A.object [ "@type" A..= T.String "inputMessageInvoice", "start_parameter" A..= start_parameter, "provider_data" A..= provider_data, "provider_token" A..= provider_token, "payload" A..= payload, "photo_height" A..= photo_height, "photo_width" A..= photo_width, "photo_size" A..= photo_size, "photo_url" A..= photo_url, "description" A..= description, "title" A..= title, "invoice" A..= invoice ]

 toJSON (InputMessagePoll { is_closed = is_closed, _type = _type, is_anonymous = is_anonymous, options = options, question = question }) =
  A.object [ "@type" A..= T.String "inputMessagePoll", "is_closed" A..= is_closed, "type" A..= _type, "is_anonymous" A..= is_anonymous, "options" A..= options, "question" A..= question ]

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

   _ -> mempty ""
  where
   parseInputMessageText :: A.Value -> T.Parser InputMessageContent
   parseInputMessageText = A.withObject "InputMessageText" $ \o -> do
    clear_draft <- o A..: "clear_draft"
    disable_web_page_preview <- o A..: "disable_web_page_preview"
    text <- o A..: "text"
    return $ InputMessageText { clear_draft = clear_draft, disable_web_page_preview = disable_web_page_preview, text = text }

   parseInputMessageAnimation :: A.Value -> T.Parser InputMessageContent
   parseInputMessageAnimation = A.withObject "InputMessageAnimation" $ \o -> do
    caption <- o A..: "caption"
    height <- o A..: "height"
    width <- o A..: "width"
    duration <- o A..: "duration"
    thumbnail <- o A..: "thumbnail"
    animation <- o A..: "animation"
    return $ InputMessageAnimation { caption = caption, height = height, width = width, duration = duration, thumbnail = thumbnail, animation = animation }

   parseInputMessageAudio :: A.Value -> T.Parser InputMessageContent
   parseInputMessageAudio = A.withObject "InputMessageAudio" $ \o -> do
    caption <- o A..: "caption"
    performer <- o A..: "performer"
    title <- o A..: "title"
    duration <- o A..: "duration"
    album_cover_thumbnail <- o A..: "album_cover_thumbnail"
    audio <- o A..: "audio"
    return $ InputMessageAudio { caption = caption, performer = performer, title = title, duration = duration, album_cover_thumbnail = album_cover_thumbnail, audio = audio }

   parseInputMessageDocument :: A.Value -> T.Parser InputMessageContent
   parseInputMessageDocument = A.withObject "InputMessageDocument" $ \o -> do
    caption <- o A..: "caption"
    thumbnail <- o A..: "thumbnail"
    document <- o A..: "document"
    return $ InputMessageDocument { caption = caption, thumbnail = thumbnail, document = document }

   parseInputMessagePhoto :: A.Value -> T.Parser InputMessageContent
   parseInputMessagePhoto = A.withObject "InputMessagePhoto" $ \o -> do
    ttl <- o A..: "ttl"
    caption <- o A..: "caption"
    height <- o A..: "height"
    width <- o A..: "width"
    added_sticker_file_ids <- o A..: "added_sticker_file_ids"
    thumbnail <- o A..: "thumbnail"
    photo <- o A..: "photo"
    return $ InputMessagePhoto { ttl = ttl, caption = caption, height = height, width = width, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, photo = photo }

   parseInputMessageSticker :: A.Value -> T.Parser InputMessageContent
   parseInputMessageSticker = A.withObject "InputMessageSticker" $ \o -> do
    height <- o A..: "height"
    width <- o A..: "width"
    thumbnail <- o A..: "thumbnail"
    sticker <- o A..: "sticker"
    return $ InputMessageSticker { height = height, width = width, thumbnail = thumbnail, sticker = sticker }

   parseInputMessageVideo :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVideo = A.withObject "InputMessageVideo" $ \o -> do
    ttl <- o A..: "ttl"
    caption <- o A..: "caption"
    supports_streaming <- o A..: "supports_streaming"
    height <- o A..: "height"
    width <- o A..: "width"
    duration <- o A..: "duration"
    added_sticker_file_ids <- o A..: "added_sticker_file_ids"
    thumbnail <- o A..: "thumbnail"
    video <- o A..: "video"
    return $ InputMessageVideo { ttl = ttl, caption = caption, supports_streaming = supports_streaming, height = height, width = width, duration = duration, added_sticker_file_ids = added_sticker_file_ids, thumbnail = thumbnail, video = video }

   parseInputMessageVideoNote :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVideoNote = A.withObject "InputMessageVideoNote" $ \o -> do
    _length <- o A..: "length"
    duration <- o A..: "duration"
    thumbnail <- o A..: "thumbnail"
    video_note <- o A..: "video_note"
    return $ InputMessageVideoNote { _length = _length, duration = duration, thumbnail = thumbnail, video_note = video_note }

   parseInputMessageVoiceNote :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVoiceNote = A.withObject "InputMessageVoiceNote" $ \o -> do
    caption <- o A..: "caption"
    waveform <- o A..: "waveform"
    duration <- o A..: "duration"
    voice_note <- o A..: "voice_note"
    return $ InputMessageVoiceNote { caption = caption, waveform = waveform, duration = duration, voice_note = voice_note }

   parseInputMessageLocation :: A.Value -> T.Parser InputMessageContent
   parseInputMessageLocation = A.withObject "InputMessageLocation" $ \o -> do
    live_period <- o A..: "live_period"
    location <- o A..: "location"
    return $ InputMessageLocation { live_period = live_period, location = location }

   parseInputMessageVenue :: A.Value -> T.Parser InputMessageContent
   parseInputMessageVenue = A.withObject "InputMessageVenue" $ \o -> do
    venue <- o A..: "venue"
    return $ InputMessageVenue { venue = venue }

   parseInputMessageContact :: A.Value -> T.Parser InputMessageContent
   parseInputMessageContact = A.withObject "InputMessageContact" $ \o -> do
    contact <- o A..: "contact"
    return $ InputMessageContact { contact = contact }

   parseInputMessageDice :: A.Value -> T.Parser InputMessageContent
   parseInputMessageDice = A.withObject "InputMessageDice" $ \o -> do
    return $ InputMessageDice {  }

   parseInputMessageGame :: A.Value -> T.Parser InputMessageContent
   parseInputMessageGame = A.withObject "InputMessageGame" $ \o -> do
    game_short_name <- o A..: "game_short_name"
    bot_user_id <- o A..: "bot_user_id"
    return $ InputMessageGame { game_short_name = game_short_name, bot_user_id = bot_user_id }

   parseInputMessageInvoice :: A.Value -> T.Parser InputMessageContent
   parseInputMessageInvoice = A.withObject "InputMessageInvoice" $ \o -> do
    start_parameter <- o A..: "start_parameter"
    provider_data <- o A..: "provider_data"
    provider_token <- o A..: "provider_token"
    payload <- o A..: "payload"
    photo_height <- o A..: "photo_height"
    photo_width <- o A..: "photo_width"
    photo_size <- o A..: "photo_size"
    photo_url <- o A..: "photo_url"
    description <- o A..: "description"
    title <- o A..: "title"
    invoice <- o A..: "invoice"
    return $ InputMessageInvoice { start_parameter = start_parameter, provider_data = provider_data, provider_token = provider_token, payload = payload, photo_height = photo_height, photo_width = photo_width, photo_size = photo_size, photo_url = photo_url, description = description, title = title, invoice = invoice }

   parseInputMessagePoll :: A.Value -> T.Parser InputMessageContent
   parseInputMessagePoll = A.withObject "InputMessagePoll" $ \o -> do
    is_closed <- o A..: "is_closed"
    _type <- o A..: "type"
    is_anonymous <- o A..: "is_anonymous"
    options <- o A..: "options"
    question <- o A..: "question"
    return $ InputMessagePoll { is_closed = is_closed, _type = _type, is_anonymous = is_anonymous, options = options, question = question }

   parseInputMessageForwarded :: A.Value -> T.Parser InputMessageContent
   parseInputMessageForwarded = A.withObject "InputMessageForwarded" $ \o -> do
    remove_caption <- o A..: "remove_caption"
    send_copy <- o A..: "send_copy"
    in_game_share <- o A..: "in_game_share"
    message_id <- o A..: "message_id"
    from_chat_id <- o A..: "from_chat_id"
    return $ InputMessageForwarded { remove_caption = remove_caption, send_copy = send_copy, in_game_share = in_game_share, message_id = message_id, from_chat_id = from_chat_id }