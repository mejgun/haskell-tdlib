module TD.Data.InputMessageContent
  (InputMessageContent(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.FormattedText as FormattedText
import qualified TD.Data.LinkPreviewOptions as LinkPreviewOptions
import qualified TD.Data.InputFile as InputFile
import qualified TD.Data.InputThumbnail as InputThumbnail
import qualified Data.Text as T
import qualified TD.Data.InputPaidMedia as InputPaidMedia
import qualified TD.Data.MessageSelfDestructType as MessageSelfDestructType
import qualified Data.ByteString as BS
import qualified TD.Data.Location as Location
import qualified TD.Data.Venue as Venue
import qualified TD.Data.Contact as Contact
import qualified TD.Data.Invoice as Invoice
import qualified TD.Data.PollType as PollType
import qualified TD.Data.MessageCopyOptions as MessageCopyOptions

-- | The content of a message to send
data InputMessageContent
  = InputMessageText -- ^ A text message
    { text                 :: Maybe FormattedText.FormattedText           -- ^ Formatted text to be sent; 0-getOption("message_text_length_max") characters. Only Bold, Italic, Underline, Strikethrough, Spoiler, CustomEmoji, BlockQuote, ExpandableBlockQuote, Code, Pre, PreCode, TextUrl and MentionName entities are allowed to be specified manually
    , link_preview_options :: Maybe LinkPreviewOptions.LinkPreviewOptions -- ^ Options to be used for generation of a link preview; may be null if none; pass null to use default link preview options
    , clear_draft          :: Maybe Bool                                  -- ^ True, if a chat message draft must be deleted
    }
  | InputMessageAnimation -- ^ An animation message (GIF-style).
    { animation                :: Maybe InputFile.InputFile           -- ^ Animation file to be sent
    , thumbnail                :: Maybe InputThumbnail.InputThumbnail -- ^ Animation thumbnail; pass null to skip thumbnail uploading
    , added_sticker_file_ids   :: Maybe [Int]                         -- ^ File identifiers of the stickers added to the animation, if applicable
    , duration                 :: Maybe Int                           -- ^ Duration of the animation, in seconds
    , width                    :: Maybe Int                           -- ^ Width of the animation; may be replaced by the server
    , height                   :: Maybe Int                           -- ^ Height of the animation; may be replaced by the server
    , caption                  :: Maybe FormattedText.FormattedText   -- ^ Animation caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                          -- ^ True, if the caption must be shown above the animation; otherwise, the caption must be shown below the animation; not supported in secret chats
    , has_spoiler              :: Maybe Bool                          -- ^ True, if the animation preview must be covered by a spoiler animation; not supported in secret chats
    }
  | InputMessageAudio -- ^ An audio message
    { audio                 :: Maybe InputFile.InputFile           -- ^ Audio file to be sent
    , album_cover_thumbnail :: Maybe InputThumbnail.InputThumbnail -- ^ Thumbnail of the cover for the album; pass null to skip thumbnail uploading
    , duration              :: Maybe Int                           -- ^ Duration of the audio, in seconds; may be replaced by the server
    , title                 :: Maybe T.Text                        -- ^ Title of the audio; 0-64 characters; may be replaced by the server
    , performer             :: Maybe T.Text                        -- ^ Performer of the audio; 0-64 characters, may be replaced by the server
    , caption               :: Maybe FormattedText.FormattedText   -- ^ Audio caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    }
  | InputMessageDocument -- ^ A document message (general file)
    { document                       :: Maybe InputFile.InputFile           -- ^ Document to be sent
    , thumbnail                      :: Maybe InputThumbnail.InputThumbnail -- ^ Document thumbnail; pass null to skip thumbnail uploading
    , disable_content_type_detection :: Maybe Bool                          -- ^ Pass true to disable automatic file type detection and send the document as a file. Always true for files sent to secret chats
    , caption                        :: Maybe FormattedText.FormattedText   -- ^ Document caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    }
  | InputMessagePaidMedia -- ^ A message with paid media; can be used only in channel chats with supergroupFullInfo.has_paid_media_allowed
    { star_count               :: Maybe Int                             -- ^ The number of Telegram Stars that must be paid to see the media; 1-getOption("paid_media_message_star_count_max")
    , paid_media               :: Maybe [InputPaidMedia.InputPaidMedia] -- ^ The content of the paid media
    , caption                  :: Maybe FormattedText.FormattedText     -- ^ Message caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                            -- ^ True, if the caption must be shown above the media; otherwise, the caption must be shown below the media; not supported in secret chats
    , payload                  :: Maybe T.Text                          -- ^ Bot-provided data for the paid media; bots only
    }
  | InputMessagePhoto -- ^ A photo message
    { photo                    :: Maybe InputFile.InputFile                             -- ^ Photo to send. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20
    , thumbnail                :: Maybe InputThumbnail.InputThumbnail                   -- ^ Photo thumbnail to be sent; pass null to skip thumbnail uploading. The thumbnail is sent to the other party only in secret chats
    , added_sticker_file_ids   :: Maybe [Int]                                           -- ^ File identifiers of the stickers added to the photo, if applicable
    , width                    :: Maybe Int                                             -- ^ Photo width
    , height                   :: Maybe Int                                             -- ^ Photo height
    , caption                  :: Maybe FormattedText.FormattedText                     -- ^ Photo caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                                            -- ^ True, if the caption must be shown above the photo; otherwise, the caption must be shown below the photo; not supported in secret chats
    , self_destruct_type       :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Photo self-destruct type; pass null if none; private chats only
    , has_spoiler              :: Maybe Bool                                            -- ^ True, if the photo preview must be covered by a spoiler animation; not supported in secret chats
    }
  | InputMessageSticker -- ^ A sticker message
    { sticker   :: Maybe InputFile.InputFile           -- ^ Sticker to be sent
    , thumbnail :: Maybe InputThumbnail.InputThumbnail -- ^ Sticker thumbnail; pass null to skip thumbnail uploading
    , width     :: Maybe Int                           -- ^ Sticker width
    , height    :: Maybe Int                           -- ^ Sticker height
    , emoji     :: Maybe T.Text                        -- ^ Emoji used to choose the sticker
    }
  | InputMessageVideo -- ^ A video message
    { video                    :: Maybe InputFile.InputFile                             -- ^ Video to be sent. The video is expected to be re-encoded to MPEG4 format with H.264 codec by the sender
    , thumbnail                :: Maybe InputThumbnail.InputThumbnail                   -- ^ Video thumbnail; pass null to skip thumbnail uploading
    , added_sticker_file_ids   :: Maybe [Int]                                           -- ^ File identifiers of the stickers added to the video, if applicable
    , duration                 :: Maybe Int                                             -- ^ Duration of the video, in seconds
    , width                    :: Maybe Int                                             -- ^ Video width
    , height                   :: Maybe Int                                             -- ^ Video height
    , supports_streaming       :: Maybe Bool                                            -- ^ True, if the video is expected to be streamed
    , caption                  :: Maybe FormattedText.FormattedText                     -- ^ Video caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    , show_caption_above_media :: Maybe Bool                                            -- ^ True, if the caption must be shown above the video; otherwise, the caption must be shown below the video; not supported in secret chats
    , self_destruct_type       :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Video self-destruct type; pass null if none; private chats only
    , has_spoiler              :: Maybe Bool                                            -- ^ True, if the video preview must be covered by a spoiler animation; not supported in secret chats
    }
  | InputMessageVideoNote -- ^ A video note message
    { video_note         :: Maybe InputFile.InputFile                             -- ^ Video note to be sent. The video is expected to be encoded to MPEG4 format with H.264 codec and have no data outside of the visible circle
    , thumbnail          :: Maybe InputThumbnail.InputThumbnail                   -- ^ Video thumbnail; may be null if empty; pass null to skip thumbnail uploading
    , duration           :: Maybe Int                                             -- ^ Duration of the video, in seconds; 0-60
    , _length            :: Maybe Int                                             -- ^ Video width and height; must be positive and not greater than 640
    , self_destruct_type :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Video note self-destruct type; may be null if none; pass null if none; private chats only
    }
  | InputMessageVoiceNote -- ^ A voice note message
    { voice_note         :: Maybe InputFile.InputFile                             -- ^ Voice note to be sent. The voice note must be encoded with the Opus codec and stored inside an OGG container with a single audio channel, or be in MP3 or M4A format as regular audio
    , duration           :: Maybe Int                                             -- ^ Duration of the voice note, in seconds
    , waveform           :: Maybe BS.ByteString                                   -- ^ Waveform representation of the voice note in 5-bit format
    , caption            :: Maybe FormattedText.FormattedText                     -- ^ Voice note caption; may be null if empty; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    , self_destruct_type :: Maybe MessageSelfDestructType.MessageSelfDestructType -- ^ Voice note self-destruct type; may be null if none; pass null if none; private chats only
    }
  | InputMessageLocation -- ^ A message with a location
    { location               :: Maybe Location.Location -- ^ Location to be sent
    , live_period            :: Maybe Int               -- ^ Period for which the location can be updated, in seconds; must be between 60 and 86400 for a temporary live location, 0x7FFFFFFF for permanent live location, and 0 otherwise
    , heading                :: Maybe Int               -- ^ For live locations, a direction in which the location moves, in degrees; 1-360. Pass 0 if unknown
    , proximity_alert_radius :: Maybe Int               -- ^ For live locations, a maximum distance to another chat member for proximity alerts, in meters (0-100000). Pass 0 if the notification is disabled. Can't be enabled in channels and Saved Messages
    }
  | InputMessageVenue -- ^ A message with information about a venue
    { venue :: Maybe Venue.Venue -- ^ Venue to send
    }
  | InputMessageContact -- ^ A message containing a user contact
    { contact :: Maybe Contact.Contact -- ^ Contact to send
    }
  | InputMessageDice -- ^ A dice message
    { emoji       :: Maybe T.Text -- ^ Emoji on which the dice throw animation is based
    , clear_draft :: Maybe Bool   -- ^ True, if the chat message draft must be deleted
    }
  | InputMessageGame -- ^ A message with a game; not supported for channels or secret chats
    { bot_user_id     :: Maybe Int    -- ^ User identifier of the bot that owns the game
    , game_short_name :: Maybe T.Text -- ^ Short name of the game
    }
  | InputMessageInvoice -- ^ A message with an invoice; can be used only by bots
    { invoice            :: Maybe Invoice.Invoice               -- ^ Invoice
    , title              :: Maybe T.Text                        -- ^ Product title; 1-32 characters
    , description        :: Maybe T.Text                        -- ^ Product description; 0-255 characters
    , photo_url          :: Maybe T.Text                        -- ^ Product photo URL; optional
    , photo_size         :: Maybe Int                           -- ^ Product photo size
    , photo_width        :: Maybe Int                           -- ^ Product photo width
    , photo_height       :: Maybe Int                           -- ^ Product photo height
    , _payload           :: Maybe BS.ByteString                 -- ^ The invoice payload
    , provider_token     :: Maybe T.Text                        -- ^ Payment provider token; may be empty for payments in Telegram Stars
    , provider_data      :: Maybe T.Text                        -- ^ JSON-encoded data about the invoice, which will be shared with the payment provider
    , start_parameter    :: Maybe T.Text                        -- ^ Unique invoice bot deep link parameter for the generation of this invoice. If empty, it would be possible to pay directly from forwards of the invoice message
    , _paid_media        :: Maybe InputPaidMedia.InputPaidMedia -- ^ The content of paid media attached to the invoice; pass null if none
    , paid_media_caption :: Maybe FormattedText.FormattedText   -- ^ Paid media caption; pass null to use an empty caption; 0-getOption("message_caption_length_max") characters
    }
  | InputMessagePoll -- ^ A message with a poll. Polls can't be sent to secret chats. Polls can be sent only to a private chat with a bot
    { question     :: Maybe FormattedText.FormattedText   -- ^ Poll question; 1-255 characters (up to 300 characters for bots). Only custom emoji entities are allowed to be added and only by Premium users
    , options      :: Maybe [FormattedText.FormattedText] -- ^ List of poll answer options, 2-10 strings 1-100 characters each. Only custom emoji entities are allowed to be added and only by Premium users
    , is_anonymous :: Maybe Bool                          -- ^ True, if the poll voters are anonymous. Non-anonymous polls can't be sent or forwarded to channels
    , _type        :: Maybe PollType.PollType             -- ^ Type of the poll
    , open_period  :: Maybe Int                           -- ^ Amount of time the poll will be active after creation, in seconds; for bots only
    , close_date   :: Maybe Int                           -- ^ Point in time (Unix timestamp) when the poll will automatically be closed; for bots only
    , is_closed    :: Maybe Bool                          -- ^ True, if the poll needs to be sent already closed; for bots only
    }
  | InputMessageStory -- ^ A message with a forwarded story. Stories can't be sent to secret chats. A story can be forwarded only if story.can_be_forwarded
    { story_sender_chat_id :: Maybe Int -- ^ Identifier of the chat that posted the story
    , story_id             :: Maybe Int -- ^ Story identifier
    }
  | InputMessageForwarded -- ^ A forwarded message
    { from_chat_id  :: Maybe Int                                   -- ^ Identifier for the chat this forwarded message came from
    , message_id    :: Maybe Int                                   -- ^ Identifier of the message to forward. A message can be forwarded only if messageProperties.can_be_forwarded
    , in_game_share :: Maybe Bool                                  -- ^ True, if a game message is being shared from a launched game; applies only to game messages
    , copy_options  :: Maybe MessageCopyOptions.MessageCopyOptions -- ^ Options to be used to copy content of the message without reference to the original sender; pass null to forward the message as usual
    }
  deriving (Eq, Show)

instance I.ShortShow InputMessageContent where
  shortShow InputMessageText
    { text                 = text_
    , link_preview_options = link_preview_options_
    , clear_draft          = clear_draft_
    }
      = "InputMessageText"
        ++ I.cc
        [ "text"                 `I.p` text_
        , "link_preview_options" `I.p` link_preview_options_
        , "clear_draft"          `I.p` clear_draft_
        ]
  shortShow InputMessageAnimation
    { animation                = animation_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , duration                 = duration_
    , width                    = width_
    , height                   = height_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , has_spoiler              = has_spoiler_
    }
      = "InputMessageAnimation"
        ++ I.cc
        [ "animation"                `I.p` animation_
        , "thumbnail"                `I.p` thumbnail_
        , "added_sticker_file_ids"   `I.p` added_sticker_file_ids_
        , "duration"                 `I.p` duration_
        , "width"                    `I.p` width_
        , "height"                   `I.p` height_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "has_spoiler"              `I.p` has_spoiler_
        ]
  shortShow InputMessageAudio
    { audio                 = audio_
    , album_cover_thumbnail = album_cover_thumbnail_
    , duration              = duration_
    , title                 = title_
    , performer             = performer_
    , caption               = caption_
    }
      = "InputMessageAudio"
        ++ I.cc
        [ "audio"                 `I.p` audio_
        , "album_cover_thumbnail" `I.p` album_cover_thumbnail_
        , "duration"              `I.p` duration_
        , "title"                 `I.p` title_
        , "performer"             `I.p` performer_
        , "caption"               `I.p` caption_
        ]
  shortShow InputMessageDocument
    { document                       = document_
    , thumbnail                      = thumbnail_
    , disable_content_type_detection = disable_content_type_detection_
    , caption                        = caption_
    }
      = "InputMessageDocument"
        ++ I.cc
        [ "document"                       `I.p` document_
        , "thumbnail"                      `I.p` thumbnail_
        , "disable_content_type_detection" `I.p` disable_content_type_detection_
        , "caption"                        `I.p` caption_
        ]
  shortShow InputMessagePaidMedia
    { star_count               = star_count_
    , paid_media               = paid_media_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , payload                  = payload_
    }
      = "InputMessagePaidMedia"
        ++ I.cc
        [ "star_count"               `I.p` star_count_
        , "paid_media"               `I.p` paid_media_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "payload"                  `I.p` payload_
        ]
  shortShow InputMessagePhoto
    { photo                    = photo_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , width                    = width_
    , height                   = height_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , self_destruct_type       = self_destruct_type_
    , has_spoiler              = has_spoiler_
    }
      = "InputMessagePhoto"
        ++ I.cc
        [ "photo"                    `I.p` photo_
        , "thumbnail"                `I.p` thumbnail_
        , "added_sticker_file_ids"   `I.p` added_sticker_file_ids_
        , "width"                    `I.p` width_
        , "height"                   `I.p` height_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "self_destruct_type"       `I.p` self_destruct_type_
        , "has_spoiler"              `I.p` has_spoiler_
        ]
  shortShow InputMessageSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    , emoji     = emoji_
    }
      = "InputMessageSticker"
        ++ I.cc
        [ "sticker"   `I.p` sticker_
        , "thumbnail" `I.p` thumbnail_
        , "width"     `I.p` width_
        , "height"    `I.p` height_
        , "emoji"     `I.p` emoji_
        ]
  shortShow InputMessageVideo
    { video                    = video_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , duration                 = duration_
    , width                    = width_
    , height                   = height_
    , supports_streaming       = supports_streaming_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , self_destruct_type       = self_destruct_type_
    , has_spoiler              = has_spoiler_
    }
      = "InputMessageVideo"
        ++ I.cc
        [ "video"                    `I.p` video_
        , "thumbnail"                `I.p` thumbnail_
        , "added_sticker_file_ids"   `I.p` added_sticker_file_ids_
        , "duration"                 `I.p` duration_
        , "width"                    `I.p` width_
        , "height"                   `I.p` height_
        , "supports_streaming"       `I.p` supports_streaming_
        , "caption"                  `I.p` caption_
        , "show_caption_above_media" `I.p` show_caption_above_media_
        , "self_destruct_type"       `I.p` self_destruct_type_
        , "has_spoiler"              `I.p` has_spoiler_
        ]
  shortShow InputMessageVideoNote
    { video_note         = video_note_
    , thumbnail          = thumbnail_
    , duration           = duration_
    , _length            = _length_
    , self_destruct_type = self_destruct_type_
    }
      = "InputMessageVideoNote"
        ++ I.cc
        [ "video_note"         `I.p` video_note_
        , "thumbnail"          `I.p` thumbnail_
        , "duration"           `I.p` duration_
        , "_length"            `I.p` _length_
        , "self_destruct_type" `I.p` self_destruct_type_
        ]
  shortShow InputMessageVoiceNote
    { voice_note         = voice_note_
    , duration           = duration_
    , waveform           = waveform_
    , caption            = caption_
    , self_destruct_type = self_destruct_type_
    }
      = "InputMessageVoiceNote"
        ++ I.cc
        [ "voice_note"         `I.p` voice_note_
        , "duration"           `I.p` duration_
        , "waveform"           `I.p` waveform_
        , "caption"            `I.p` caption_
        , "self_destruct_type" `I.p` self_destruct_type_
        ]
  shortShow InputMessageLocation
    { location               = location_
    , live_period            = live_period_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = "InputMessageLocation"
        ++ I.cc
        [ "location"               `I.p` location_
        , "live_period"            `I.p` live_period_
        , "heading"                `I.p` heading_
        , "proximity_alert_radius" `I.p` proximity_alert_radius_
        ]
  shortShow InputMessageVenue
    { venue = venue_
    }
      = "InputMessageVenue"
        ++ I.cc
        [ "venue" `I.p` venue_
        ]
  shortShow InputMessageContact
    { contact = contact_
    }
      = "InputMessageContact"
        ++ I.cc
        [ "contact" `I.p` contact_
        ]
  shortShow InputMessageDice
    { emoji       = emoji_
    , clear_draft = clear_draft_
    }
      = "InputMessageDice"
        ++ I.cc
        [ "emoji"       `I.p` emoji_
        , "clear_draft" `I.p` clear_draft_
        ]
  shortShow InputMessageGame
    { bot_user_id     = bot_user_id_
    , game_short_name = game_short_name_
    }
      = "InputMessageGame"
        ++ I.cc
        [ "bot_user_id"     `I.p` bot_user_id_
        , "game_short_name" `I.p` game_short_name_
        ]
  shortShow InputMessageInvoice
    { invoice            = invoice_
    , title              = title_
    , description        = description_
    , photo_url          = photo_url_
    , photo_size         = photo_size_
    , photo_width        = photo_width_
    , photo_height       = photo_height_
    , _payload           = _payload_
    , provider_token     = provider_token_
    , provider_data      = provider_data_
    , start_parameter    = start_parameter_
    , _paid_media        = _paid_media_
    , paid_media_caption = paid_media_caption_
    }
      = "InputMessageInvoice"
        ++ I.cc
        [ "invoice"            `I.p` invoice_
        , "title"              `I.p` title_
        , "description"        `I.p` description_
        , "photo_url"          `I.p` photo_url_
        , "photo_size"         `I.p` photo_size_
        , "photo_width"        `I.p` photo_width_
        , "photo_height"       `I.p` photo_height_
        , "_payload"           `I.p` _payload_
        , "provider_token"     `I.p` provider_token_
        , "provider_data"      `I.p` provider_data_
        , "start_parameter"    `I.p` start_parameter_
        , "_paid_media"        `I.p` _paid_media_
        , "paid_media_caption" `I.p` paid_media_caption_
        ]
  shortShow InputMessagePoll
    { question     = question_
    , options      = options_
    , is_anonymous = is_anonymous_
    , _type        = _type_
    , open_period  = open_period_
    , close_date   = close_date_
    , is_closed    = is_closed_
    }
      = "InputMessagePoll"
        ++ I.cc
        [ "question"     `I.p` question_
        , "options"      `I.p` options_
        , "is_anonymous" `I.p` is_anonymous_
        , "_type"        `I.p` _type_
        , "open_period"  `I.p` open_period_
        , "close_date"   `I.p` close_date_
        , "is_closed"    `I.p` is_closed_
        ]
  shortShow InputMessageStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = "InputMessageStory"
        ++ I.cc
        [ "story_sender_chat_id" `I.p` story_sender_chat_id_
        , "story_id"             `I.p` story_id_
        ]
  shortShow InputMessageForwarded
    { from_chat_id  = from_chat_id_
    , message_id    = message_id_
    , in_game_share = in_game_share_
    , copy_options  = copy_options_
    }
      = "InputMessageForwarded"
        ++ I.cc
        [ "from_chat_id"  `I.p` from_chat_id_
        , "message_id"    `I.p` message_id_
        , "in_game_share" `I.p` in_game_share_
        , "copy_options"  `I.p` copy_options_
        ]

instance AT.FromJSON InputMessageContent where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "inputMessageText"      -> parseInputMessageText v
      "inputMessageAnimation" -> parseInputMessageAnimation v
      "inputMessageAudio"     -> parseInputMessageAudio v
      "inputMessageDocument"  -> parseInputMessageDocument v
      "inputMessagePaidMedia" -> parseInputMessagePaidMedia v
      "inputMessagePhoto"     -> parseInputMessagePhoto v
      "inputMessageSticker"   -> parseInputMessageSticker v
      "inputMessageVideo"     -> parseInputMessageVideo v
      "inputMessageVideoNote" -> parseInputMessageVideoNote v
      "inputMessageVoiceNote" -> parseInputMessageVoiceNote v
      "inputMessageLocation"  -> parseInputMessageLocation v
      "inputMessageVenue"     -> parseInputMessageVenue v
      "inputMessageContact"   -> parseInputMessageContact v
      "inputMessageDice"      -> parseInputMessageDice v
      "inputMessageGame"      -> parseInputMessageGame v
      "inputMessageInvoice"   -> parseInputMessageInvoice v
      "inputMessagePoll"      -> parseInputMessagePoll v
      "inputMessageStory"     -> parseInputMessageStory v
      "inputMessageForwarded" -> parseInputMessageForwarded v
      _                       -> mempty
    
    where
      parseInputMessageText :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageText = A.withObject "InputMessageText" $ \o -> do
        text_                 <- o A..:?  "text"
        link_preview_options_ <- o A..:?  "link_preview_options"
        clear_draft_          <- o A..:?  "clear_draft"
        pure $ InputMessageText
          { text                 = text_
          , link_preview_options = link_preview_options_
          , clear_draft          = clear_draft_
          }
      parseInputMessageAnimation :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageAnimation = A.withObject "InputMessageAnimation" $ \o -> do
        animation_                <- o A..:?  "animation"
        thumbnail_                <- o A..:?  "thumbnail"
        added_sticker_file_ids_   <- o A..:?  "added_sticker_file_ids"
        duration_                 <- o A..:?  "duration"
        width_                    <- o A..:?  "width"
        height_                   <- o A..:?  "height"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        has_spoiler_              <- o A..:?  "has_spoiler"
        pure $ InputMessageAnimation
          { animation                = animation_
          , thumbnail                = thumbnail_
          , added_sticker_file_ids   = added_sticker_file_ids_
          , duration                 = duration_
          , width                    = width_
          , height                   = height_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , has_spoiler              = has_spoiler_
          }
      parseInputMessageAudio :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageAudio = A.withObject "InputMessageAudio" $ \o -> do
        audio_                 <- o A..:?  "audio"
        album_cover_thumbnail_ <- o A..:?  "album_cover_thumbnail"
        duration_              <- o A..:?  "duration"
        title_                 <- o A..:?  "title"
        performer_             <- o A..:?  "performer"
        caption_               <- o A..:?  "caption"
        pure $ InputMessageAudio
          { audio                 = audio_
          , album_cover_thumbnail = album_cover_thumbnail_
          , duration              = duration_
          , title                 = title_
          , performer             = performer_
          , caption               = caption_
          }
      parseInputMessageDocument :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageDocument = A.withObject "InputMessageDocument" $ \o -> do
        document_                       <- o A..:?  "document"
        thumbnail_                      <- o A..:?  "thumbnail"
        disable_content_type_detection_ <- o A..:?  "disable_content_type_detection"
        caption_                        <- o A..:?  "caption"
        pure $ InputMessageDocument
          { document                       = document_
          , thumbnail                      = thumbnail_
          , disable_content_type_detection = disable_content_type_detection_
          , caption                        = caption_
          }
      parseInputMessagePaidMedia :: A.Value -> AT.Parser InputMessageContent
      parseInputMessagePaidMedia = A.withObject "InputMessagePaidMedia" $ \o -> do
        star_count_               <- o A..:?  "star_count"
        paid_media_               <- o A..:?  "paid_media"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        payload_                  <- o A..:?  "payload"
        pure $ InputMessagePaidMedia
          { star_count               = star_count_
          , paid_media               = paid_media_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , payload                  = payload_
          }
      parseInputMessagePhoto :: A.Value -> AT.Parser InputMessageContent
      parseInputMessagePhoto = A.withObject "InputMessagePhoto" $ \o -> do
        photo_                    <- o A..:?  "photo"
        thumbnail_                <- o A..:?  "thumbnail"
        added_sticker_file_ids_   <- o A..:?  "added_sticker_file_ids"
        width_                    <- o A..:?  "width"
        height_                   <- o A..:?  "height"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        self_destruct_type_       <- o A..:?  "self_destruct_type"
        has_spoiler_              <- o A..:?  "has_spoiler"
        pure $ InputMessagePhoto
          { photo                    = photo_
          , thumbnail                = thumbnail_
          , added_sticker_file_ids   = added_sticker_file_ids_
          , width                    = width_
          , height                   = height_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , self_destruct_type       = self_destruct_type_
          , has_spoiler              = has_spoiler_
          }
      parseInputMessageSticker :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageSticker = A.withObject "InputMessageSticker" $ \o -> do
        sticker_   <- o A..:?  "sticker"
        thumbnail_ <- o A..:?  "thumbnail"
        width_     <- o A..:?  "width"
        height_    <- o A..:?  "height"
        emoji_     <- o A..:?  "emoji"
        pure $ InputMessageSticker
          { sticker   = sticker_
          , thumbnail = thumbnail_
          , width     = width_
          , height    = height_
          , emoji     = emoji_
          }
      parseInputMessageVideo :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageVideo = A.withObject "InputMessageVideo" $ \o -> do
        video_                    <- o A..:?  "video"
        thumbnail_                <- o A..:?  "thumbnail"
        added_sticker_file_ids_   <- o A..:?  "added_sticker_file_ids"
        duration_                 <- o A..:?  "duration"
        width_                    <- o A..:?  "width"
        height_                   <- o A..:?  "height"
        supports_streaming_       <- o A..:?  "supports_streaming"
        caption_                  <- o A..:?  "caption"
        show_caption_above_media_ <- o A..:?  "show_caption_above_media"
        self_destruct_type_       <- o A..:?  "self_destruct_type"
        has_spoiler_              <- o A..:?  "has_spoiler"
        pure $ InputMessageVideo
          { video                    = video_
          , thumbnail                = thumbnail_
          , added_sticker_file_ids   = added_sticker_file_ids_
          , duration                 = duration_
          , width                    = width_
          , height                   = height_
          , supports_streaming       = supports_streaming_
          , caption                  = caption_
          , show_caption_above_media = show_caption_above_media_
          , self_destruct_type       = self_destruct_type_
          , has_spoiler              = has_spoiler_
          }
      parseInputMessageVideoNote :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageVideoNote = A.withObject "InputMessageVideoNote" $ \o -> do
        video_note_         <- o A..:?  "video_note"
        thumbnail_          <- o A..:?  "thumbnail"
        duration_           <- o A..:?  "duration"
        _length_            <- o A..:?  "length"
        self_destruct_type_ <- o A..:?  "self_destruct_type"
        pure $ InputMessageVideoNote
          { video_note         = video_note_
          , thumbnail          = thumbnail_
          , duration           = duration_
          , _length            = _length_
          , self_destruct_type = self_destruct_type_
          }
      parseInputMessageVoiceNote :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageVoiceNote = A.withObject "InputMessageVoiceNote" $ \o -> do
        voice_note_         <- o A..:?                       "voice_note"
        duration_           <- o A..:?                       "duration"
        waveform_           <- fmap I.readBytes <$> o A..:?  "waveform"
        caption_            <- o A..:?                       "caption"
        self_destruct_type_ <- o A..:?                       "self_destruct_type"
        pure $ InputMessageVoiceNote
          { voice_note         = voice_note_
          , duration           = duration_
          , waveform           = waveform_
          , caption            = caption_
          , self_destruct_type = self_destruct_type_
          }
      parseInputMessageLocation :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageLocation = A.withObject "InputMessageLocation" $ \o -> do
        location_               <- o A..:?  "location"
        live_period_            <- o A..:?  "live_period"
        heading_                <- o A..:?  "heading"
        proximity_alert_radius_ <- o A..:?  "proximity_alert_radius"
        pure $ InputMessageLocation
          { location               = location_
          , live_period            = live_period_
          , heading                = heading_
          , proximity_alert_radius = proximity_alert_radius_
          }
      parseInputMessageVenue :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageVenue = A.withObject "InputMessageVenue" $ \o -> do
        venue_ <- o A..:?  "venue"
        pure $ InputMessageVenue
          { venue = venue_
          }
      parseInputMessageContact :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageContact = A.withObject "InputMessageContact" $ \o -> do
        contact_ <- o A..:?  "contact"
        pure $ InputMessageContact
          { contact = contact_
          }
      parseInputMessageDice :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageDice = A.withObject "InputMessageDice" $ \o -> do
        emoji_       <- o A..:?  "emoji"
        clear_draft_ <- o A..:?  "clear_draft"
        pure $ InputMessageDice
          { emoji       = emoji_
          , clear_draft = clear_draft_
          }
      parseInputMessageGame :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageGame = A.withObject "InputMessageGame" $ \o -> do
        bot_user_id_     <- o A..:?  "bot_user_id"
        game_short_name_ <- o A..:?  "game_short_name"
        pure $ InputMessageGame
          { bot_user_id     = bot_user_id_
          , game_short_name = game_short_name_
          }
      parseInputMessageInvoice :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageInvoice = A.withObject "InputMessageInvoice" $ \o -> do
        invoice_            <- o A..:?                       "invoice"
        title_              <- o A..:?                       "title"
        description_        <- o A..:?                       "description"
        photo_url_          <- o A..:?                       "photo_url"
        photo_size_         <- o A..:?                       "photo_size"
        photo_width_        <- o A..:?                       "photo_width"
        photo_height_       <- o A..:?                       "photo_height"
        _payload_           <- fmap I.readBytes <$> o A..:?  "payload"
        provider_token_     <- o A..:?                       "provider_token"
        provider_data_      <- o A..:?                       "provider_data"
        start_parameter_    <- o A..:?                       "start_parameter"
        _paid_media_        <- o A..:?                       "paid_media"
        paid_media_caption_ <- o A..:?                       "paid_media_caption"
        pure $ InputMessageInvoice
          { invoice            = invoice_
          , title              = title_
          , description        = description_
          , photo_url          = photo_url_
          , photo_size         = photo_size_
          , photo_width        = photo_width_
          , photo_height       = photo_height_
          , _payload           = _payload_
          , provider_token     = provider_token_
          , provider_data      = provider_data_
          , start_parameter    = start_parameter_
          , _paid_media        = _paid_media_
          , paid_media_caption = paid_media_caption_
          }
      parseInputMessagePoll :: A.Value -> AT.Parser InputMessageContent
      parseInputMessagePoll = A.withObject "InputMessagePoll" $ \o -> do
        question_     <- o A..:?  "question"
        options_      <- o A..:?  "options"
        is_anonymous_ <- o A..:?  "is_anonymous"
        _type_        <- o A..:?  "type"
        open_period_  <- o A..:?  "open_period"
        close_date_   <- o A..:?  "close_date"
        is_closed_    <- o A..:?  "is_closed"
        pure $ InputMessagePoll
          { question     = question_
          , options      = options_
          , is_anonymous = is_anonymous_
          , _type        = _type_
          , open_period  = open_period_
          , close_date   = close_date_
          , is_closed    = is_closed_
          }
      parseInputMessageStory :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageStory = A.withObject "InputMessageStory" $ \o -> do
        story_sender_chat_id_ <- o A..:?  "story_sender_chat_id"
        story_id_             <- o A..:?  "story_id"
        pure $ InputMessageStory
          { story_sender_chat_id = story_sender_chat_id_
          , story_id             = story_id_
          }
      parseInputMessageForwarded :: A.Value -> AT.Parser InputMessageContent
      parseInputMessageForwarded = A.withObject "InputMessageForwarded" $ \o -> do
        from_chat_id_  <- o A..:?  "from_chat_id"
        message_id_    <- o A..:?  "message_id"
        in_game_share_ <- o A..:?  "in_game_share"
        copy_options_  <- o A..:?  "copy_options"
        pure $ InputMessageForwarded
          { from_chat_id  = from_chat_id_
          , message_id    = message_id_
          , in_game_share = in_game_share_
          , copy_options  = copy_options_
          }
  parseJSON _ = mempty

instance AT.ToJSON InputMessageContent where
  toJSON InputMessageText
    { text                 = text_
    , link_preview_options = link_preview_options_
    , clear_draft          = clear_draft_
    }
      = A.object
        [ "@type"                A..= AT.String "inputMessageText"
        , "text"                 A..= text_
        , "link_preview_options" A..= link_preview_options_
        , "clear_draft"          A..= clear_draft_
        ]
  toJSON InputMessageAnimation
    { animation                = animation_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , duration                 = duration_
    , width                    = width_
    , height                   = height_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , has_spoiler              = has_spoiler_
    }
      = A.object
        [ "@type"                    A..= AT.String "inputMessageAnimation"
        , "animation"                A..= animation_
        , "thumbnail"                A..= thumbnail_
        , "added_sticker_file_ids"   A..= added_sticker_file_ids_
        , "duration"                 A..= duration_
        , "width"                    A..= width_
        , "height"                   A..= height_
        , "caption"                  A..= caption_
        , "show_caption_above_media" A..= show_caption_above_media_
        , "has_spoiler"              A..= has_spoiler_
        ]
  toJSON InputMessageAudio
    { audio                 = audio_
    , album_cover_thumbnail = album_cover_thumbnail_
    , duration              = duration_
    , title                 = title_
    , performer             = performer_
    , caption               = caption_
    }
      = A.object
        [ "@type"                 A..= AT.String "inputMessageAudio"
        , "audio"                 A..= audio_
        , "album_cover_thumbnail" A..= album_cover_thumbnail_
        , "duration"              A..= duration_
        , "title"                 A..= title_
        , "performer"             A..= performer_
        , "caption"               A..= caption_
        ]
  toJSON InputMessageDocument
    { document                       = document_
    , thumbnail                      = thumbnail_
    , disable_content_type_detection = disable_content_type_detection_
    , caption                        = caption_
    }
      = A.object
        [ "@type"                          A..= AT.String "inputMessageDocument"
        , "document"                       A..= document_
        , "thumbnail"                      A..= thumbnail_
        , "disable_content_type_detection" A..= disable_content_type_detection_
        , "caption"                        A..= caption_
        ]
  toJSON InputMessagePaidMedia
    { star_count               = star_count_
    , paid_media               = paid_media_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , payload                  = payload_
    }
      = A.object
        [ "@type"                    A..= AT.String "inputMessagePaidMedia"
        , "star_count"               A..= star_count_
        , "paid_media"               A..= paid_media_
        , "caption"                  A..= caption_
        , "show_caption_above_media" A..= show_caption_above_media_
        , "payload"                  A..= payload_
        ]
  toJSON InputMessagePhoto
    { photo                    = photo_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , width                    = width_
    , height                   = height_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , self_destruct_type       = self_destruct_type_
    , has_spoiler              = has_spoiler_
    }
      = A.object
        [ "@type"                    A..= AT.String "inputMessagePhoto"
        , "photo"                    A..= photo_
        , "thumbnail"                A..= thumbnail_
        , "added_sticker_file_ids"   A..= added_sticker_file_ids_
        , "width"                    A..= width_
        , "height"                   A..= height_
        , "caption"                  A..= caption_
        , "show_caption_above_media" A..= show_caption_above_media_
        , "self_destruct_type"       A..= self_destruct_type_
        , "has_spoiler"              A..= has_spoiler_
        ]
  toJSON InputMessageSticker
    { sticker   = sticker_
    , thumbnail = thumbnail_
    , width     = width_
    , height    = height_
    , emoji     = emoji_
    }
      = A.object
        [ "@type"     A..= AT.String "inputMessageSticker"
        , "sticker"   A..= sticker_
        , "thumbnail" A..= thumbnail_
        , "width"     A..= width_
        , "height"    A..= height_
        , "emoji"     A..= emoji_
        ]
  toJSON InputMessageVideo
    { video                    = video_
    , thumbnail                = thumbnail_
    , added_sticker_file_ids   = added_sticker_file_ids_
    , duration                 = duration_
    , width                    = width_
    , height                   = height_
    , supports_streaming       = supports_streaming_
    , caption                  = caption_
    , show_caption_above_media = show_caption_above_media_
    , self_destruct_type       = self_destruct_type_
    , has_spoiler              = has_spoiler_
    }
      = A.object
        [ "@type"                    A..= AT.String "inputMessageVideo"
        , "video"                    A..= video_
        , "thumbnail"                A..= thumbnail_
        , "added_sticker_file_ids"   A..= added_sticker_file_ids_
        , "duration"                 A..= duration_
        , "width"                    A..= width_
        , "height"                   A..= height_
        , "supports_streaming"       A..= supports_streaming_
        , "caption"                  A..= caption_
        , "show_caption_above_media" A..= show_caption_above_media_
        , "self_destruct_type"       A..= self_destruct_type_
        , "has_spoiler"              A..= has_spoiler_
        ]
  toJSON InputMessageVideoNote
    { video_note         = video_note_
    , thumbnail          = thumbnail_
    , duration           = duration_
    , _length            = _length_
    , self_destruct_type = self_destruct_type_
    }
      = A.object
        [ "@type"              A..= AT.String "inputMessageVideoNote"
        , "video_note"         A..= video_note_
        , "thumbnail"          A..= thumbnail_
        , "duration"           A..= duration_
        , "length"             A..= _length_
        , "self_destruct_type" A..= self_destruct_type_
        ]
  toJSON InputMessageVoiceNote
    { voice_note         = voice_note_
    , duration           = duration_
    , waveform           = waveform_
    , caption            = caption_
    , self_destruct_type = self_destruct_type_
    }
      = A.object
        [ "@type"              A..= AT.String "inputMessageVoiceNote"
        , "voice_note"         A..= voice_note_
        , "duration"           A..= duration_
        , "waveform"           A..= fmap I.writeBytes  waveform_
        , "caption"            A..= caption_
        , "self_destruct_type" A..= self_destruct_type_
        ]
  toJSON InputMessageLocation
    { location               = location_
    , live_period            = live_period_
    , heading                = heading_
    , proximity_alert_radius = proximity_alert_radius_
    }
      = A.object
        [ "@type"                  A..= AT.String "inputMessageLocation"
        , "location"               A..= location_
        , "live_period"            A..= live_period_
        , "heading"                A..= heading_
        , "proximity_alert_radius" A..= proximity_alert_radius_
        ]
  toJSON InputMessageVenue
    { venue = venue_
    }
      = A.object
        [ "@type" A..= AT.String "inputMessageVenue"
        , "venue" A..= venue_
        ]
  toJSON InputMessageContact
    { contact = contact_
    }
      = A.object
        [ "@type"   A..= AT.String "inputMessageContact"
        , "contact" A..= contact_
        ]
  toJSON InputMessageDice
    { emoji       = emoji_
    , clear_draft = clear_draft_
    }
      = A.object
        [ "@type"       A..= AT.String "inputMessageDice"
        , "emoji"       A..= emoji_
        , "clear_draft" A..= clear_draft_
        ]
  toJSON InputMessageGame
    { bot_user_id     = bot_user_id_
    , game_short_name = game_short_name_
    }
      = A.object
        [ "@type"           A..= AT.String "inputMessageGame"
        , "bot_user_id"     A..= bot_user_id_
        , "game_short_name" A..= game_short_name_
        ]
  toJSON InputMessageInvoice
    { invoice            = invoice_
    , title              = title_
    , description        = description_
    , photo_url          = photo_url_
    , photo_size         = photo_size_
    , photo_width        = photo_width_
    , photo_height       = photo_height_
    , _payload           = _payload_
    , provider_token     = provider_token_
    , provider_data      = provider_data_
    , start_parameter    = start_parameter_
    , _paid_media        = _paid_media_
    , paid_media_caption = paid_media_caption_
    }
      = A.object
        [ "@type"              A..= AT.String "inputMessageInvoice"
        , "invoice"            A..= invoice_
        , "title"              A..= title_
        , "description"        A..= description_
        , "photo_url"          A..= photo_url_
        , "photo_size"         A..= photo_size_
        , "photo_width"        A..= photo_width_
        , "photo_height"       A..= photo_height_
        , "payload"            A..= fmap I.writeBytes  _payload_
        , "provider_token"     A..= provider_token_
        , "provider_data"      A..= provider_data_
        , "start_parameter"    A..= start_parameter_
        , "paid_media"         A..= _paid_media_
        , "paid_media_caption" A..= paid_media_caption_
        ]
  toJSON InputMessagePoll
    { question     = question_
    , options      = options_
    , is_anonymous = is_anonymous_
    , _type        = _type_
    , open_period  = open_period_
    , close_date   = close_date_
    , is_closed    = is_closed_
    }
      = A.object
        [ "@type"        A..= AT.String "inputMessagePoll"
        , "question"     A..= question_
        , "options"      A..= options_
        , "is_anonymous" A..= is_anonymous_
        , "type"         A..= _type_
        , "open_period"  A..= open_period_
        , "close_date"   A..= close_date_
        , "is_closed"    A..= is_closed_
        ]
  toJSON InputMessageStory
    { story_sender_chat_id = story_sender_chat_id_
    , story_id             = story_id_
    }
      = A.object
        [ "@type"                A..= AT.String "inputMessageStory"
        , "story_sender_chat_id" A..= story_sender_chat_id_
        , "story_id"             A..= story_id_
        ]
  toJSON InputMessageForwarded
    { from_chat_id  = from_chat_id_
    , message_id    = message_id_
    , in_game_share = in_game_share_
    , copy_options  = copy_options_
    }
      = A.object
        [ "@type"         A..= AT.String "inputMessageForwarded"
        , "from_chat_id"  A..= from_chat_id_
        , "message_id"    A..= message_id_
        , "in_game_share" A..= in_game_share_
        , "copy_options"  A..= copy_options_
        ]

