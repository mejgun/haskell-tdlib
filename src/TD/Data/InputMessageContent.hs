{-# LANGUAGE OverloadedStrings #-}

module TD.Data.InputMessageContent where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.Contact as Contact
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.Location as Location
import qualified TD.Data.MessageCopyOptions as MessageCopyOptions
import qualified TD.Data.PollType as PollType
import qualified TD.Data.Venue as Venue
import qualified Utils as U

-- | The content of a message to send
data InputMessageContent
  = -- | A text message @text Formatted text to be sent; 1-GetOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
    InputMessageText
      { -- |
        clear_draft :: Maybe Bool,
        -- | True, if rich web page previews for URLs in the message text must be disabled @clear_draft True, if a chat message draft must be deleted
        disable_web_page_preview :: Maybe Bool,
        -- |
        text :: Maybe FormattedText.FormattedText
      }
  | -- | An animation message (GIF-style). @animation Animation file to be sent @thumbnail Animation thumbnail; pass null to skip thumbnail uploading @added_sticker_file_ids File identifiers of the stickers added to the animation, if applicable
    InputMessageAnimation
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- | Duration of the animation, in seconds @width Width of the animation; may be replaced by the server @height Height of the animation; may be replaced by the server @caption Animation caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
        duration :: Maybe Int,
        -- |
        added_sticker_file_ids :: Maybe [Int],
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        animation :: Maybe InputFile.InputFile
      }
  | -- | An audio message @audio Audio file to be sent @album_cover_thumbnail Thumbnail of the cover for the album; pass null to skip thumbnail uploading @duration Duration of the audio, in seconds; may be replaced by the server @title Title of the audio; 0-64 characters; may be replaced by the server
    InputMessageAudio
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- | Performer of the audio; 0-64 characters, may be replaced by the server @caption Audio caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
        performer :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        duration :: Maybe Int,
        -- |
        album_cover_thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        audio :: Maybe InputFile.InputFile
      }
  | -- | A document message (general file) @document Document to be sent @thumbnail Document thumbnail; pass null to skip thumbnail uploading @disable_content_type_detection If true, automatic file type detection will be disabled and the document will be always sent as file. Always true for files sent to secret chats @caption Document caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
    InputMessageDocument
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        disable_content_type_detection :: Maybe Bool,
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        document :: Maybe InputFile.InputFile
      }
  | -- | A photo message @photo Photo to send @thumbnail Photo thumbnail to be sent; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats @added_sticker_file_ids File identifiers of the stickers added to the photo, if applicable @width Photo width @height Photo height @caption Photo caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
    InputMessagePhoto
      { -- | Photo TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
        ttl :: Maybe Int,
        -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- |
        added_sticker_file_ids :: Maybe [Int],
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        photo :: Maybe InputFile.InputFile
      }
  | -- | A sticker message @sticker Sticker to be sent @thumbnail Sticker thumbnail; pass null to skip thumbnail uploading @width Sticker width @height Sticker height @emoji Emoji used to choose the sticker
    InputMessageSticker
      { -- |
        emoji :: Maybe String,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        sticker :: Maybe InputFile.InputFile
      }
  | -- | A video message @video Video to be sent @thumbnail Video thumbnail; pass null to skip thumbnail uploading @added_sticker_file_ids File identifiers of the stickers added to the video, if applicable
    InputMessageVideo
      { -- |
        ttl :: Maybe Int,
        -- | Video caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters @ttl Video TTL (Time To Live), in seconds (0-60). A non-zero TTL can be specified only in private chats
        caption :: Maybe FormattedText.FormattedText,
        -- |
        supports_streaming :: Maybe Bool,
        -- |
        height :: Maybe Int,
        -- |
        width :: Maybe Int,
        -- | Duration of the video, in seconds @width Video width @height Video height @supports_streaming True, if the video is supposed to be streamed
        duration :: Maybe Int,
        -- |
        added_sticker_file_ids :: Maybe [Int],
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        video :: Maybe InputFile.InputFile
      }
  | -- | A video note message @video_note Video note to be sent @thumbnail Video thumbnail; pass null to skip thumbnail uploading @duration Duration of the video, in seconds @length Video width and height; must be positive and not greater than 640
    InputMessageVideoNote
      { -- |
        _length :: Maybe Int,
        -- |
        duration :: Maybe Int,
        -- |
        thumbnail :: Maybe InputThumbnail.InputThumbnail,
        -- |
        video_note :: Maybe InputFile.InputFile
      }
  | -- | A voice note message @voice_note Voice note to be sent @duration Duration of the voice note, in seconds @waveform Waveform representation of the voice note, in 5-bit format @caption Voice note caption; pass null to use an empty caption; 0-GetOption("message_caption_length_max") characters
    InputMessageVoiceNote
      { -- |
        caption :: Maybe FormattedText.FormattedText,
        -- |
        waveform :: Maybe String,
        -- |
        duration :: Maybe Int,
        -- |
        voice_note :: Maybe InputFile.InputFile
      }
  | -- | A message with a location @location Location to be sent @live_period Period for which the location can be updated, in seconds; must be between 60 and 86400 for a live location and 0 otherwise
    InputMessageLocation
      { -- | For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
        proximity_alert_radius :: Maybe Int,
        -- | For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
        heading :: Maybe Int,
        -- |
        live_period :: Maybe Int,
        -- |
        location :: Maybe Location.Location
      }
  | -- | A message with information about a venue @venue Venue to send
    InputMessageVenue
      { -- |
        venue :: Maybe Venue.Venue
      }
  | -- | A message containing a user contact @contact Contact to send
    InputMessageContact
      { -- |
        contact :: Maybe Contact.Contact
      }
  | -- | A dice message @emoji Emoji on which the dice throw animation is based @clear_draft True, if the chat message draft must be deleted
    InputMessageDice
      { -- |
        clear_draft :: Maybe Bool,
        -- |
        emoji :: Maybe String
      }
  | -- | A message with a game; not supported for channels or secret chats @bot_user_id User identifier of the bot that owns the game @game_short_name Short name of the game
    InputMessageGame
      { -- |
        game_short_name :: Maybe String,
        -- |
        bot_user_id :: Maybe Int
      }
  | -- | A message with an invoice; can be used only by bots @invoice Invoice @title Product title; 1-32 characters @param_description Product description; 0-255 characters
    InputMessageInvoice
      { -- | Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
        start_parameter :: Maybe String,
        -- |
        provider_data :: Maybe String,
        -- |
        provider_token :: Maybe String,
        -- | The invoice payload @provider_token Payment provider token @provider_data JSON-encoded data about the invoice, which will be shared with the payment provider
        payload :: Maybe String,
        -- |
        photo_height :: Maybe Int,
        -- |
        photo_width :: Maybe Int,
        -- |
        photo_size :: Maybe Int,
        -- | Product photo URL; optional @photo_size Product photo size @photo_width Product photo width @photo_height Product photo height
        photo_url :: Maybe String,
        -- |
        description :: Maybe String,
        -- |
        title :: Maybe String,
        -- |
        invoice :: Maybe Invoice.Invoice
      }
  | -- | A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot @question Poll question; 1-255 characters (up to 300 characters for bots) @options List of poll answer options, 2-10 strings 1-100 characters each
    InputMessagePoll
      { -- | True, if the poll needs to be sent already closed; for bots only
        is_closed :: Maybe Bool,
        -- | Point in time (Unix timestamp) when the poll will automatically be closed; for bots only
        close_date :: Maybe Int,
        -- | Amount of time the poll will be active after creation, in seconds; for bots only
        open_period :: Maybe Int,
        -- |
        _type :: Maybe PollType.PollType,
        -- | True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels @type Type of the poll
        is_anonymous :: Maybe Bool,
        -- |
        options :: Maybe [String],
        -- |
        question :: Maybe String
      }
  | -- | A forwarded message @from_chat_id Identifier for the chat this forwarded message came from @message_id Identifier of the message to forward
    InputMessageForwarded
      { -- | Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual
        copy_options :: Maybe MessageCopyOptions.MessageCopyOptions,
        -- | True, if a game message is being shared from a launched game; applies only to game messages
        in_game_share :: Maybe Bool,
        -- |
        message_id :: Maybe Int,
        -- |
        from_chat_id :: Maybe Int
      }
  deriving (Eq)

instance Show InputMessageContent where
  show
    InputMessageText
      { clear_draft = clear_draft,
        disable_web_page_preview = disable_web_page_preview,
        text = text
      } =
      "InputMessageText"
        ++ U.cc
          [ U.p "clear_draft" clear_draft,
            U.p "disable_web_page_preview" disable_web_page_preview,
            U.p "text" text
          ]
  show
    InputMessageAnimation
      { caption = caption,
        height = height,
        width = width,
        duration = duration,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        animation = animation
      } =
      "InputMessageAnimation"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "height" height,
            U.p "width" width,
            U.p "duration" duration,
            U.p "added_sticker_file_ids" added_sticker_file_ids,
            U.p "thumbnail" thumbnail,
            U.p "animation" animation
          ]
  show
    InputMessageAudio
      { caption = caption,
        performer = performer,
        title = title,
        duration = duration,
        album_cover_thumbnail = album_cover_thumbnail,
        audio = audio
      } =
      "InputMessageAudio"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "performer" performer,
            U.p "title" title,
            U.p "duration" duration,
            U.p "album_cover_thumbnail" album_cover_thumbnail,
            U.p "audio" audio
          ]
  show
    InputMessageDocument
      { caption = caption,
        disable_content_type_detection = disable_content_type_detection,
        thumbnail = thumbnail,
        document = document
      } =
      "InputMessageDocument"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "disable_content_type_detection" disable_content_type_detection,
            U.p "thumbnail" thumbnail,
            U.p "document" document
          ]
  show
    InputMessagePhoto
      { ttl = ttl,
        caption = caption,
        height = height,
        width = width,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        photo = photo
      } =
      "InputMessagePhoto"
        ++ U.cc
          [ U.p "ttl" ttl,
            U.p "caption" caption,
            U.p "height" height,
            U.p "width" width,
            U.p "added_sticker_file_ids" added_sticker_file_ids,
            U.p "thumbnail" thumbnail,
            U.p "photo" photo
          ]
  show
    InputMessageSticker
      { emoji = emoji,
        height = height,
        width = width,
        thumbnail = thumbnail,
        sticker = sticker
      } =
      "InputMessageSticker"
        ++ U.cc
          [ U.p "emoji" emoji,
            U.p "height" height,
            U.p "width" width,
            U.p "thumbnail" thumbnail,
            U.p "sticker" sticker
          ]
  show
    InputMessageVideo
      { ttl = ttl,
        caption = caption,
        supports_streaming = supports_streaming,
        height = height,
        width = width,
        duration = duration,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        video = video
      } =
      "InputMessageVideo"
        ++ U.cc
          [ U.p "ttl" ttl,
            U.p "caption" caption,
            U.p "supports_streaming" supports_streaming,
            U.p "height" height,
            U.p "width" width,
            U.p "duration" duration,
            U.p "added_sticker_file_ids" added_sticker_file_ids,
            U.p "thumbnail" thumbnail,
            U.p "video" video
          ]
  show
    InputMessageVideoNote
      { _length = _length,
        duration = duration,
        thumbnail = thumbnail,
        video_note = video_note
      } =
      "InputMessageVideoNote"
        ++ U.cc
          [ U.p "_length" _length,
            U.p "duration" duration,
            U.p "thumbnail" thumbnail,
            U.p "video_note" video_note
          ]
  show
    InputMessageVoiceNote
      { caption = caption,
        waveform = waveform,
        duration = duration,
        voice_note = voice_note
      } =
      "InputMessageVoiceNote"
        ++ U.cc
          [ U.p "caption" caption,
            U.p "waveform" waveform,
            U.p "duration" duration,
            U.p "voice_note" voice_note
          ]
  show
    InputMessageLocation
      { proximity_alert_radius = proximity_alert_radius,
        heading = heading,
        live_period = live_period,
        location = location
      } =
      "InputMessageLocation"
        ++ U.cc
          [ U.p "proximity_alert_radius" proximity_alert_radius,
            U.p "heading" heading,
            U.p "live_period" live_period,
            U.p "location" location
          ]
  show
    InputMessageVenue
      { venue = venue
      } =
      "InputMessageVenue"
        ++ U.cc
          [ U.p "venue" venue
          ]
  show
    InputMessageContact
      { contact = contact
      } =
      "InputMessageContact"
        ++ U.cc
          [ U.p "contact" contact
          ]
  show
    InputMessageDice
      { clear_draft = clear_draft,
        emoji = emoji
      } =
      "InputMessageDice"
        ++ U.cc
          [ U.p "clear_draft" clear_draft,
            U.p "emoji" emoji
          ]
  show
    InputMessageGame
      { game_short_name = game_short_name,
        bot_user_id = bot_user_id
      } =
      "InputMessageGame"
        ++ U.cc
          [ U.p "game_short_name" game_short_name,
            U.p "bot_user_id" bot_user_id
          ]
  show
    InputMessageInvoice
      { start_parameter = start_parameter,
        provider_data = provider_data,
        provider_token = provider_token,
        payload = payload,
        photo_height = photo_height,
        photo_width = photo_width,
        photo_size = photo_size,
        photo_url = photo_url,
        description = description,
        title = title,
        invoice = invoice
      } =
      "InputMessageInvoice"
        ++ U.cc
          [ U.p "start_parameter" start_parameter,
            U.p "provider_data" provider_data,
            U.p "provider_token" provider_token,
            U.p "payload" payload,
            U.p "photo_height" photo_height,
            U.p "photo_width" photo_width,
            U.p "photo_size" photo_size,
            U.p "photo_url" photo_url,
            U.p "description" description,
            U.p "title" title,
            U.p "invoice" invoice
          ]
  show
    InputMessagePoll
      { is_closed = is_closed,
        close_date = close_date,
        open_period = open_period,
        _type = _type,
        is_anonymous = is_anonymous,
        options = options,
        question = question
      } =
      "InputMessagePoll"
        ++ U.cc
          [ U.p "is_closed" is_closed,
            U.p "close_date" close_date,
            U.p "open_period" open_period,
            U.p "_type" _type,
            U.p "is_anonymous" is_anonymous,
            U.p "options" options,
            U.p "question" question
          ]
  show
    InputMessageForwarded
      { copy_options = copy_options,
        in_game_share = in_game_share,
        message_id = message_id,
        from_chat_id = from_chat_id
      } =
      "InputMessageForwarded"
        ++ U.cc
          [ U.p "copy_options" copy_options,
            U.p "in_game_share" in_game_share,
            U.p "message_id" message_id,
            U.p "from_chat_id" from_chat_id
          ]

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
        clear_draft_ <- o A..:? "clear_draft"
        disable_web_page_preview_ <- o A..:? "disable_web_page_preview"
        text_ <- o A..:? "text"
        return $ InputMessageText {clear_draft = clear_draft_, disable_web_page_preview = disable_web_page_preview_, text = text_}

      parseInputMessageAnimation :: A.Value -> T.Parser InputMessageContent
      parseInputMessageAnimation = A.withObject "InputMessageAnimation" $ \o -> do
        caption_ <- o A..:? "caption"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        added_sticker_file_ids_ <- o A..:? "added_sticker_file_ids"
        thumbnail_ <- o A..:? "thumbnail"
        animation_ <- o A..:? "animation"
        return $ InputMessageAnimation {caption = caption_, height = height_, width = width_, duration = duration_, added_sticker_file_ids = added_sticker_file_ids_, thumbnail = thumbnail_, animation = animation_}

      parseInputMessageAudio :: A.Value -> T.Parser InputMessageContent
      parseInputMessageAudio = A.withObject "InputMessageAudio" $ \o -> do
        caption_ <- o A..:? "caption"
        performer_ <- o A..:? "performer"
        title_ <- o A..:? "title"
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        album_cover_thumbnail_ <- o A..:? "album_cover_thumbnail"
        audio_ <- o A..:? "audio"
        return $ InputMessageAudio {caption = caption_, performer = performer_, title = title_, duration = duration_, album_cover_thumbnail = album_cover_thumbnail_, audio = audio_}

      parseInputMessageDocument :: A.Value -> T.Parser InputMessageContent
      parseInputMessageDocument = A.withObject "InputMessageDocument" $ \o -> do
        caption_ <- o A..:? "caption"
        disable_content_type_detection_ <- o A..:? "disable_content_type_detection"
        thumbnail_ <- o A..:? "thumbnail"
        document_ <- o A..:? "document"
        return $ InputMessageDocument {caption = caption_, disable_content_type_detection = disable_content_type_detection_, thumbnail = thumbnail_, document = document_}

      parseInputMessagePhoto :: A.Value -> T.Parser InputMessageContent
      parseInputMessagePhoto = A.withObject "InputMessagePhoto" $ \o -> do
        ttl_ <- mconcat [o A..:? "ttl", U.rm <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        caption_ <- o A..:? "caption"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        added_sticker_file_ids_ <- o A..:? "added_sticker_file_ids"
        thumbnail_ <- o A..:? "thumbnail"
        photo_ <- o A..:? "photo"
        return $ InputMessagePhoto {ttl = ttl_, caption = caption_, height = height_, width = width_, added_sticker_file_ids = added_sticker_file_ids_, thumbnail = thumbnail_, photo = photo_}

      parseInputMessageSticker :: A.Value -> T.Parser InputMessageContent
      parseInputMessageSticker = A.withObject "InputMessageSticker" $ \o -> do
        emoji_ <- o A..:? "emoji"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        thumbnail_ <- o A..:? "thumbnail"
        sticker_ <- o A..:? "sticker"
        return $ InputMessageSticker {emoji = emoji_, height = height_, width = width_, thumbnail = thumbnail_, sticker = sticker_}

      parseInputMessageVideo :: A.Value -> T.Parser InputMessageContent
      parseInputMessageVideo = A.withObject "InputMessageVideo" $ \o -> do
        ttl_ <- mconcat [o A..:? "ttl", U.rm <$> (o A..: "ttl" :: T.Parser String)] :: T.Parser (Maybe Int)
        caption_ <- o A..:? "caption"
        supports_streaming_ <- o A..:? "supports_streaming"
        height_ <- mconcat [o A..:? "height", U.rm <$> (o A..: "height" :: T.Parser String)] :: T.Parser (Maybe Int)
        width_ <- mconcat [o A..:? "width", U.rm <$> (o A..: "width" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        added_sticker_file_ids_ <- o A..:? "added_sticker_file_ids"
        thumbnail_ <- o A..:? "thumbnail"
        video_ <- o A..:? "video"
        return $ InputMessageVideo {ttl = ttl_, caption = caption_, supports_streaming = supports_streaming_, height = height_, width = width_, duration = duration_, added_sticker_file_ids = added_sticker_file_ids_, thumbnail = thumbnail_, video = video_}

      parseInputMessageVideoNote :: A.Value -> T.Parser InputMessageContent
      parseInputMessageVideoNote = A.withObject "InputMessageVideoNote" $ \o -> do
        _length_ <- mconcat [o A..:? "length", U.rm <$> (o A..: "length" :: T.Parser String)] :: T.Parser (Maybe Int)
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        thumbnail_ <- o A..:? "thumbnail"
        video_note_ <- o A..:? "video_note"
        return $ InputMessageVideoNote {_length = _length_, duration = duration_, thumbnail = thumbnail_, video_note = video_note_}

      parseInputMessageVoiceNote :: A.Value -> T.Parser InputMessageContent
      parseInputMessageVoiceNote = A.withObject "InputMessageVoiceNote" $ \o -> do
        caption_ <- o A..:? "caption"
        waveform_ <- o A..:? "waveform"
        duration_ <- mconcat [o A..:? "duration", U.rm <$> (o A..: "duration" :: T.Parser String)] :: T.Parser (Maybe Int)
        voice_note_ <- o A..:? "voice_note"
        return $ InputMessageVoiceNote {caption = caption_, waveform = waveform_, duration = duration_, voice_note = voice_note_}

      parseInputMessageLocation :: A.Value -> T.Parser InputMessageContent
      parseInputMessageLocation = A.withObject "InputMessageLocation" $ \o -> do
        proximity_alert_radius_ <- mconcat [o A..:? "proximity_alert_radius", U.rm <$> (o A..: "proximity_alert_radius" :: T.Parser String)] :: T.Parser (Maybe Int)
        heading_ <- mconcat [o A..:? "heading", U.rm <$> (o A..: "heading" :: T.Parser String)] :: T.Parser (Maybe Int)
        live_period_ <- mconcat [o A..:? "live_period", U.rm <$> (o A..: "live_period" :: T.Parser String)] :: T.Parser (Maybe Int)
        location_ <- o A..:? "location"
        return $ InputMessageLocation {proximity_alert_radius = proximity_alert_radius_, heading = heading_, live_period = live_period_, location = location_}

      parseInputMessageVenue :: A.Value -> T.Parser InputMessageContent
      parseInputMessageVenue = A.withObject "InputMessageVenue" $ \o -> do
        venue_ <- o A..:? "venue"
        return $ InputMessageVenue {venue = venue_}

      parseInputMessageContact :: A.Value -> T.Parser InputMessageContent
      parseInputMessageContact = A.withObject "InputMessageContact" $ \o -> do
        contact_ <- o A..:? "contact"
        return $ InputMessageContact {contact = contact_}

      parseInputMessageDice :: A.Value -> T.Parser InputMessageContent
      parseInputMessageDice = A.withObject "InputMessageDice" $ \o -> do
        clear_draft_ <- o A..:? "clear_draft"
        emoji_ <- o A..:? "emoji"
        return $ InputMessageDice {clear_draft = clear_draft_, emoji = emoji_}

      parseInputMessageGame :: A.Value -> T.Parser InputMessageContent
      parseInputMessageGame = A.withObject "InputMessageGame" $ \o -> do
        game_short_name_ <- o A..:? "game_short_name"
        bot_user_id_ <- mconcat [o A..:? "bot_user_id", U.rm <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ InputMessageGame {game_short_name = game_short_name_, bot_user_id = bot_user_id_}

      parseInputMessageInvoice :: A.Value -> T.Parser InputMessageContent
      parseInputMessageInvoice = A.withObject "InputMessageInvoice" $ \o -> do
        start_parameter_ <- o A..:? "start_parameter"
        provider_data_ <- o A..:? "provider_data"
        provider_token_ <- o A..:? "provider_token"
        payload_ <- o A..:? "payload"
        photo_height_ <- mconcat [o A..:? "photo_height", U.rm <$> (o A..: "photo_height" :: T.Parser String)] :: T.Parser (Maybe Int)
        photo_width_ <- mconcat [o A..:? "photo_width", U.rm <$> (o A..: "photo_width" :: T.Parser String)] :: T.Parser (Maybe Int)
        photo_size_ <- mconcat [o A..:? "photo_size", U.rm <$> (o A..: "photo_size" :: T.Parser String)] :: T.Parser (Maybe Int)
        photo_url_ <- o A..:? "photo_url"
        description_ <- o A..:? "description"
        title_ <- o A..:? "title"
        invoice_ <- o A..:? "invoice"
        return $ InputMessageInvoice {start_parameter = start_parameter_, provider_data = provider_data_, provider_token = provider_token_, payload = payload_, photo_height = photo_height_, photo_width = photo_width_, photo_size = photo_size_, photo_url = photo_url_, description = description_, title = title_, invoice = invoice_}

      parseInputMessagePoll :: A.Value -> T.Parser InputMessageContent
      parseInputMessagePoll = A.withObject "InputMessagePoll" $ \o -> do
        is_closed_ <- o A..:? "is_closed"
        close_date_ <- mconcat [o A..:? "close_date", U.rm <$> (o A..: "close_date" :: T.Parser String)] :: T.Parser (Maybe Int)
        open_period_ <- mconcat [o A..:? "open_period", U.rm <$> (o A..: "open_period" :: T.Parser String)] :: T.Parser (Maybe Int)
        _type_ <- o A..:? "type"
        is_anonymous_ <- o A..:? "is_anonymous"
        options_ <- o A..:? "options"
        question_ <- o A..:? "question"
        return $ InputMessagePoll {is_closed = is_closed_, close_date = close_date_, open_period = open_period_, _type = _type_, is_anonymous = is_anonymous_, options = options_, question = question_}

      parseInputMessageForwarded :: A.Value -> T.Parser InputMessageContent
      parseInputMessageForwarded = A.withObject "InputMessageForwarded" $ \o -> do
        copy_options_ <- o A..:? "copy_options"
        in_game_share_ <- o A..:? "in_game_share"
        message_id_ <- mconcat [o A..:? "message_id", U.rm <$> (o A..: "message_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        from_chat_id_ <- mconcat [o A..:? "from_chat_id", U.rm <$> (o A..: "from_chat_id" :: T.Parser String)] :: T.Parser (Maybe Int)
        return $ InputMessageForwarded {copy_options = copy_options_, in_game_share = in_game_share_, message_id = message_id_, from_chat_id = from_chat_id_}
  parseJSON _ = mempty

instance T.ToJSON InputMessageContent where
  toJSON
    InputMessageText
      { clear_draft = clear_draft,
        disable_web_page_preview = disable_web_page_preview,
        text = text
      } =
      A.object
        [ "@type" A..= T.String "inputMessageText",
          "clear_draft" A..= clear_draft,
          "disable_web_page_preview" A..= disable_web_page_preview,
          "text" A..= text
        ]
  toJSON
    InputMessageAnimation
      { caption = caption,
        height = height,
        width = width,
        duration = duration,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        animation = animation
      } =
      A.object
        [ "@type" A..= T.String "inputMessageAnimation",
          "caption" A..= caption,
          "height" A..= height,
          "width" A..= width,
          "duration" A..= duration,
          "added_sticker_file_ids" A..= added_sticker_file_ids,
          "thumbnail" A..= thumbnail,
          "animation" A..= animation
        ]
  toJSON
    InputMessageAudio
      { caption = caption,
        performer = performer,
        title = title,
        duration = duration,
        album_cover_thumbnail = album_cover_thumbnail,
        audio = audio
      } =
      A.object
        [ "@type" A..= T.String "inputMessageAudio",
          "caption" A..= caption,
          "performer" A..= performer,
          "title" A..= title,
          "duration" A..= duration,
          "album_cover_thumbnail" A..= album_cover_thumbnail,
          "audio" A..= audio
        ]
  toJSON
    InputMessageDocument
      { caption = caption,
        disable_content_type_detection = disable_content_type_detection,
        thumbnail = thumbnail,
        document = document
      } =
      A.object
        [ "@type" A..= T.String "inputMessageDocument",
          "caption" A..= caption,
          "disable_content_type_detection" A..= disable_content_type_detection,
          "thumbnail" A..= thumbnail,
          "document" A..= document
        ]
  toJSON
    InputMessagePhoto
      { ttl = ttl,
        caption = caption,
        height = height,
        width = width,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        photo = photo
      } =
      A.object
        [ "@type" A..= T.String "inputMessagePhoto",
          "ttl" A..= ttl,
          "caption" A..= caption,
          "height" A..= height,
          "width" A..= width,
          "added_sticker_file_ids" A..= added_sticker_file_ids,
          "thumbnail" A..= thumbnail,
          "photo" A..= photo
        ]
  toJSON
    InputMessageSticker
      { emoji = emoji,
        height = height,
        width = width,
        thumbnail = thumbnail,
        sticker = sticker
      } =
      A.object
        [ "@type" A..= T.String "inputMessageSticker",
          "emoji" A..= emoji,
          "height" A..= height,
          "width" A..= width,
          "thumbnail" A..= thumbnail,
          "sticker" A..= sticker
        ]
  toJSON
    InputMessageVideo
      { ttl = ttl,
        caption = caption,
        supports_streaming = supports_streaming,
        height = height,
        width = width,
        duration = duration,
        added_sticker_file_ids = added_sticker_file_ids,
        thumbnail = thumbnail,
        video = video
      } =
      A.object
        [ "@type" A..= T.String "inputMessageVideo",
          "ttl" A..= ttl,
          "caption" A..= caption,
          "supports_streaming" A..= supports_streaming,
          "height" A..= height,
          "width" A..= width,
          "duration" A..= duration,
          "added_sticker_file_ids" A..= added_sticker_file_ids,
          "thumbnail" A..= thumbnail,
          "video" A..= video
        ]
  toJSON
    InputMessageVideoNote
      { _length = _length,
        duration = duration,
        thumbnail = thumbnail,
        video_note = video_note
      } =
      A.object
        [ "@type" A..= T.String "inputMessageVideoNote",
          "length" A..= _length,
          "duration" A..= duration,
          "thumbnail" A..= thumbnail,
          "video_note" A..= video_note
        ]
  toJSON
    InputMessageVoiceNote
      { caption = caption,
        waveform = waveform,
        duration = duration,
        voice_note = voice_note
      } =
      A.object
        [ "@type" A..= T.String "inputMessageVoiceNote",
          "caption" A..= caption,
          "waveform" A..= waveform,
          "duration" A..= duration,
          "voice_note" A..= voice_note
        ]
  toJSON
    InputMessageLocation
      { proximity_alert_radius = proximity_alert_radius,
        heading = heading,
        live_period = live_period,
        location = location
      } =
      A.object
        [ "@type" A..= T.String "inputMessageLocation",
          "proximity_alert_radius" A..= proximity_alert_radius,
          "heading" A..= heading,
          "live_period" A..= live_period,
          "location" A..= location
        ]
  toJSON
    InputMessageVenue
      { venue = venue
      } =
      A.object
        [ "@type" A..= T.String "inputMessageVenue",
          "venue" A..= venue
        ]
  toJSON
    InputMessageContact
      { contact = contact
      } =
      A.object
        [ "@type" A..= T.String "inputMessageContact",
          "contact" A..= contact
        ]
  toJSON
    InputMessageDice
      { clear_draft = clear_draft,
        emoji = emoji
      } =
      A.object
        [ "@type" A..= T.String "inputMessageDice",
          "clear_draft" A..= clear_draft,
          "emoji" A..= emoji
        ]
  toJSON
    InputMessageGame
      { game_short_name = game_short_name,
        bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "inputMessageGame",
          "game_short_name" A..= game_short_name,
          "bot_user_id" A..= bot_user_id
        ]
  toJSON
    InputMessageInvoice
      { start_parameter = start_parameter,
        provider_data = provider_data,
        provider_token = provider_token,
        payload = payload,
        photo_height = photo_height,
        photo_width = photo_width,
        photo_size = photo_size,
        photo_url = photo_url,
        description = description,
        title = title,
        invoice = invoice
      } =
      A.object
        [ "@type" A..= T.String "inputMessageInvoice",
          "start_parameter" A..= start_parameter,
          "provider_data" A..= provider_data,
          "provider_token" A..= provider_token,
          "payload" A..= payload,
          "photo_height" A..= photo_height,
          "photo_width" A..= photo_width,
          "photo_size" A..= photo_size,
          "photo_url" A..= photo_url,
          "description" A..= description,
          "title" A..= title,
          "invoice" A..= invoice
        ]
  toJSON
    InputMessagePoll
      { is_closed = is_closed,
        close_date = close_date,
        open_period = open_period,
        _type = _type,
        is_anonymous = is_anonymous,
        options = options,
        question = question
      } =
      A.object
        [ "@type" A..= T.String "inputMessagePoll",
          "is_closed" A..= is_closed,
          "close_date" A..= close_date,
          "open_period" A..= open_period,
          "type" A..= _type,
          "is_anonymous" A..= is_anonymous,
          "options" A..= options,
          "question" A..= question
        ]
  toJSON
    InputMessageForwarded
      { copy_options = copy_options,
        in_game_share = in_game_share,
        message_id = message_id,
        from_chat_id = from_chat_id
      } =
      A.object
        [ "@type" A..= T.String "inputMessageForwarded",
          "copy_options" A..= copy_options,
          "in_game_share" A..= in_game_share,
          "message_id" A..= message_id,
          "from_chat_id" A..= from_chat_id
        ]
