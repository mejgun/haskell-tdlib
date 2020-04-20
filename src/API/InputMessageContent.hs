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
 | InputMessageForwarded { remove_caption :: Bool, send_copy :: Bool, in_game_share :: Bool, message_id :: Int, from_chat_id :: Int }  -- deriving (Show)

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
-- inputMessageText InputMessageContent  { clear_draft :: Bool, disable_web_page_preview :: Bool, text :: FormattedText.FormattedText } 

-- inputMessageAnimation InputMessageContent  { caption :: FormattedText.FormattedText, height :: Int, width :: Int, duration :: Int, thumbnail :: InputThumbnail.InputThumbnail, animation :: InputFile.InputFile } 

-- inputMessageAudio InputMessageContent  { caption :: FormattedText.FormattedText, performer :: String, title :: String, duration :: Int, album_cover_thumbnail :: InputThumbnail.InputThumbnail, audio :: InputFile.InputFile } 

-- inputMessageDocument InputMessageContent  { caption :: FormattedText.FormattedText, thumbnail :: InputThumbnail.InputThumbnail, document :: InputFile.InputFile } 

-- inputMessagePhoto InputMessageContent  { ttl :: Int, caption :: FormattedText.FormattedText, height :: Int, width :: Int, added_sticker_file_ids :: [Int], thumbnail :: InputThumbnail.InputThumbnail, photo :: InputFile.InputFile } 

-- inputMessageSticker InputMessageContent  { height :: Int, width :: Int, thumbnail :: InputThumbnail.InputThumbnail, sticker :: InputFile.InputFile } 

-- inputMessageVideo InputMessageContent  { ttl :: Int, caption :: FormattedText.FormattedText, supports_streaming :: Bool, height :: Int, width :: Int, duration :: Int, added_sticker_file_ids :: [Int], thumbnail :: InputThumbnail.InputThumbnail, video :: InputFile.InputFile } 

-- inputMessageVideoNote InputMessageContent  { _length :: Int, duration :: Int, thumbnail :: InputThumbnail.InputThumbnail, video_note :: InputFile.InputFile } 

-- inputMessageVoiceNote InputMessageContent  { caption :: FormattedText.FormattedText, waveform :: String, duration :: Int, voice_note :: InputFile.InputFile } 

-- inputMessageLocation InputMessageContent  { live_period :: Int, location :: Location.Location } 

-- inputMessageVenue InputMessageContent  { venue :: Venue.Venue } 

-- inputMessageContact InputMessageContent  { contact :: Contact.Contact } 

-- inputMessageDice InputMessageContent 

-- inputMessageGame InputMessageContent  { game_short_name :: String, bot_user_id :: Int } 

-- inputMessageInvoice InputMessageContent  { start_parameter :: String, provider_data :: String, provider_token :: String, payload :: String, photo_height :: Int, photo_width :: Int, photo_size :: Int, photo_url :: String, description :: String, title :: String, invoice :: Invoice.Invoice } 

-- inputMessagePoll InputMessageContent  { is_closed :: Bool, _type :: PollType.PollType, is_anonymous :: Bool, options :: [String], question :: String } 

-- inputMessageForwarded InputMessageContent  { remove_caption :: Bool, send_copy :: Bool, in_game_share :: Bool, message_id :: Int, from_chat_id :: Int } 

